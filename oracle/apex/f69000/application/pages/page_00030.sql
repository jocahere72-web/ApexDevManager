prompt --application/pages/page_00030
begin
wwv_flow_api.create_page(
 p_id=>30
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Resumen Novedad Persona'
,p_step_title=>'Resumen Novedad Persona'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20251203114039'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18468586144011517)
,p_plug_name=>'Observaciones Novedad'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 ',
'from si_g_novedades_observacion a',
'join sg_g_usuarios b on a.id_usrio = b.id_usrio',
'join si_c_terceros c on b.id_trcro = c.id_trcro',
'where id_instncia_fljo = :P28_ID_INSTNCIA_FLJO;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18468803555011519)
,p_plug_name=>'observaciones'
,p_parent_plug_id=>wwv_flow_api.id(18468586144011517)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_nvddes_obsrvcion,',
'       a.id_nvdad,',
'       a.cdgo_nvdad_prsna_estdo,',
'       a.id_instncia_fljo,',
'       a.id_fljo_trea,',
'       a.id_usrio,',
'       a.obsrvcion,',
'       a.fcha_obsrvcion,',
'       (c.prmer_nmbre ||'' ''|| c.sgndo_nmbre ||'' ''|| c.prmer_aplldo ||'' ''|| c.sgndo_aplldo) usuario',
'from si_g_novedades_observacion a',
'join sg_g_usuarios b on a.id_usrio = b.id_usrio',
'join si_c_terceros c on b.id_trcro = c.id_trcro',
'where id_instncia_fljo = :P28_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18498089676365461)
,p_name=>'ID_NVDDES_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDDES_OBSRVCION'
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
 p_id=>wwv_flow_api.id(18498244779365462)
,p_name=>'ID_NVDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_NVDAD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(18498344110365463)
,p_name=>'CDGO_NVDAD_PRSNA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_NVDAD_PRSNA_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(18498463035365464)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18498509025365465)
,p_name=>'ID_FLJO_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(18498619668365466)
,p_name=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_USRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(18540722101475417)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Obsrvcion'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(18540861231475418)
,p_name=>'FCHA_OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OBSRVCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fcha Obsrvcion'
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
 p_id=>wwv_flow_api.id(18540928658475419)
,p_name=>'USUARIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USUARIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Usuario'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>503
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
 p_id=>wwv_flow_api.id(18498048959365460)
,p_internal_uid=>18498048959365460
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
 p_id=>wwv_flow_api.id(18546662123475616)
,p_interactive_grid_id=>wwv_flow_api.id(18498048959365460)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(18546772793475616)
,p_report_id=>wwv_flow_api.id(18546662123475616)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18547255102475617)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(18498089676365461)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18547777586475619)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(18498244779365462)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18548242026475620)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(18498344110365463)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18548756135475621)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(18498463035365464)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18549239172475623)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(18498509025365465)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18549748332475624)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(18498619668365466)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18550143894475625)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(18540722101475417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18550596561475627)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(18540861231475418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18551138861475628)
,p_view_id=>wwv_flow_api.id(18546772793475616)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(18540928658475419)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69621711419138405)
,p_plug_name=>'Resumen Novedad Persona'
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69656756505085902)
,p_plug_name=>'Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(69621711419138405)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P30_CDGO_NVDAD_TPO'
,p_plug_display_when_cond2=>'INS'
,p_attribute_01=>'P30_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69670216845251401)
,p_plug_name=>'Tipo Novedad &P30_CDGO_NVDAD_TPO.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69679193194417501)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69679203567417502)
,p_plug_name=>'Ayuda Registro de Novedad'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    <p align="justify">Funcionalidad de Solicitud de Novedad.<br> <br>',
'    <center><b> Paso 3 Registro de Novedad.</b> </center><br>',
'        En este paso se muestra un resumen de los datos de la novedad. <br>',
unistr('       Para Registrar la Novedad se debe hacer clic en el bot\00F3n <b><i>Registrar Novedad</b></i>'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P30_ID_NVDAD_PRSNA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69935243200104004)
,p_plug_name=>unistr('Ayuda Aplicaci\00F3n / Rechazo de Novedad')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
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
'<i>',
'    <p align="justify">Funcionalidad de Solicitud de Novedad.<br> <br>',
unistr('    <center><b> Paso 4 Aplicaci\00F3n / Rechazo de Novedad.</b> </center><br>'),
'        En este paso se muestra un resumen de los datos de la novedad. <br>',
unistr('       Para Aplicar la Novedad se debe hacer clic en el bot\00F3n <b><i>Aplicar Novedad</b></i>'),
unistr('       Para Aplicar la Rechazar se debe hacer clic en el bot\00F3n <b><i>Rechazar Novedad</b></i>'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P30_ID_NVDAD_PRSNA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70178303624256601)
,p_plug_name=>unistr('Display Selector - Actualizaci\00F3n / Cancelaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent1:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P30_CDGO_NVDAD_TPO'
,p_plug_display_when_cond2=>'INS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9079664024332501)
,p_plug_name=>'Sucursales'
,p_parent_plug_id=>wwv_flow_api.id(70178303624256601)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P30_ID_NVDAD_PRSNA is null then ',
'        return q''~',
'           select seq_id',
'				, c002 nmbre',
'			 	, c004 cdgo_scrsal',
'				, c005 id_dprtmnto_ntfccion   ',
'				, c006 id_mncpio_ntfccion',
'			 	, c007 drccion ',
'				, c008 email',
'				, c009 tlfno',
'				, c010 cllar',
'				, c011 actvo  ',
'				, c012 estdo',
'             from apex_collections    a',
'            where collection_name     = ''SUCURSALES''',
'              and n001                = :F_ID_INSTNCIA_FLJO;',
'        ~'';',
'    else',
'        return q''~',
'           select id_nvdad_prsna_scrsal seq_id',
'                , nmbre',
'                , cdgo_scrsal',
'                , id_dprtmnto_ntfccion',
'                , id_mncpio_ntfccion',
'                , drccion',
'                , email',
'                , tlfno',
'                , cllar',
'                , actvo  ',
'				, estdo',
'             from si_g_nvddes_prsna_scrsal    a',
'            where id_nvdad_prsna              = :P30_ID_NVDAD_PRSNA;',
'        ~'';',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from apex_collections    a',
'where collection_name     = ''SUCURSALES''',
'  and n001                = :F_ID_INSTNCIA_FLJO',
'union',
'select 1',
'from si_g_nvddes_prsna_scrsal    a',
'where id_nvdad_prsna              = :P30_ID_NVDAD_PRSNA;'))
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
 p_id=>wwv_flow_api.id(9079756864332502)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>9079756864332502
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9079849811332503)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9081219814332517)
,p_db_column_name=>'ID_DPRTMNTO_NTFCCION'
,p_display_order=>150
,p_column_identifier=>'D'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70569261834676479)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9081396707332518)
,p_db_column_name=>'ID_MNCPIO_NTFCCION'
,p_display_order=>160
,p_column_identifier=>'E'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70579007349685835)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9081516540332520)
,p_db_column_name=>'EMAIL'
,p_display_order=>180
,p_column_identifier=>'G'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9081660050332521)
,p_db_column_name=>'TLFNO'
,p_display_order=>190
,p_column_identifier=>'H'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9081731847332522)
,p_db_column_name=>'CLLAR'
,p_display_order=>200
,p_column_identifier=>'I'
,p_column_label=>'Celular'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9081842018332523)
,p_db_column_name=>'ACTVO'
,p_display_order=>210
,p_column_identifier=>'J'
,p_column_label=>'Activo'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9082040745332525)
,p_db_column_name=>'ESTDO'
,p_display_order=>230
,p_column_identifier=>'K'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9082188172332526)
,p_db_column_name=>'NMBRE'
,p_display_order=>240
,p_column_identifier=>'L'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9082216489332527)
,p_db_column_name=>'CDGO_SCRSAL'
,p_display_order=>250
,p_column_identifier=>'M'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(152447602216008001)
,p_db_column_name=>'DRCCION'
,p_display_order=>260
,p_column_identifier=>'N'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(9089695446374661)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'90897'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_SCRSAL:NMBRE:ID_DPRTMNTO_NTFCCION:ID_MNCPIO_NTFCCION:EMAIL:TLFNO:CLLAR:ACTVO:DRCCION:ESTDO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69656969889085904)
,p_plug_name=>unistr('Observaci\00F3n / Adjuntos ')
,p_parent_plug_id=>wwv_flow_api.id(70178303624256601)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_display_when_condition=>'P30_CDGO_NVDAD_TPO'
,p_plug_display_when_cond2=>'INS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65706307976105203)
,p_plug_name=>'Adjuntos PQR'
,p_parent_plug_id=>wwv_flow_api.id(69656969889085904)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_dcmnto,',
'        c.dscrpcion_dcmnto,',
'        a.file_name,',
'        a.obsrvcion,',
'        1 dscrgar',
'   from pq_g_documentos             a',
'   left join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   left join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo     = :F_ID_INSTNCIA_FLJO ',
'',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from pq_g_documentos             a',
'   left join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   left join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo     = :F_ID_INSTNCIA_FLJO'))
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
 p_id=>wwv_flow_api.id(65706486285105204)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se cargaron adjuntos'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>65706486285105204
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65706517862105205)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65706862007105208)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::::::attachment:<center><span class=" fa fa-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65706976260105209)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65707071235105210)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65707146851105211)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(65727676008198917)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'657277'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:DSCRGAR:ID_DCMNTO:DSCRPCION_DCMNTO:OBSRVCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65707245018105212)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(69656969889085904)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_dcmnto,',
'         null,',
'		 c.dscrpcion_dcmnto,',
'         a.file_name,',
'         c.dscrpcion_indcdor_oblgtrio,',
'         1 dscrgar',
'   from pq_g_documentos             a',
'   left join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   left join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo     = :F_ID_INSTNCIA_FLJO',
'  ',
'  union  all',
'    ',
'   select b.seq_id',
'        , a.id_nvdad_prsna_adjnto_tpo',
'		, a.dscrpcion_adjnto',
'		, b.c002 file_name',
unistr('		, decode (a.indcdor_oblgtrio, ''S'', ''S\00ED'', ''N'', ''No'') dscrpcion_indcdor_oblgtrio'),
'        , null',
'      -- , ''<span class="fa fa-eye"></span>''  ver',
'       --,1 ver',
'    -- , b.blob001 ',
'    --   , b.c003 mimetype',
'	 from si_d_nvddes_prsna_adjnto_tp	a',
'	 left join apex_collections			b on b.collection_name = ''ADJUNTOS_NOVEDADES_PERSONA''',
'      and b.n001                        = :F_ID_INSTNCIA_FLJO',
'      and a.id_nvdad_prsna_adjnto_tpo   = b.n002   ',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.cdgo_nvdad_tpo 				= :P28_CDGO_NVDAD_TPO',
'      and a.actvo 						= ''S''',
'    ',
'     '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P30_ID_NVDAD_PRSNA'
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
 p_id=>wwv_flow_api.id(65707362075105213)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se cargaron adjuntos'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>65707362075105213
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65707472727105214)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65707525454105215)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class=" fa fa-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65707695648105216)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65707725889105217)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Documento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65707984768105219)
,p_db_column_name=>'NULL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Null'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65708089290105220)
,p_db_column_name=>'DSCRPCION_INDCDOR_OBLGTRIO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('\00BF Obligatorio ?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(65726945990198526)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'657270'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FILE_NAME:DSCRGAR:ID_DCMNTO:DSCRPCION_DCMNTO:NULL:DSCRPCION_INDCDOR_OBLGTRIO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(69657053856085905)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(69656969889085904)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_nvdad_prsna_adjnto,',
'         b.dscrpcion_adjnto,',
'         a.file_name,',
'          1 dscrgar',
'  from si_g_novedades_prsna_adjnto a join si_d_nvddes_prsna_adjnto_tp b ',
'                                  on a.id_nvdad_prsna_adjnto_tpo = b.id_nvdad_prsna_adjnto_tpo    ',
'  where a.id_nvdad_prsna = :P30_ID_NVDAD_PRSNA',
'',
'',
'/*  select b.seq_id',
'        , a.id_nvdad_prsna_adjnto_tpo',
'		, a.dscrpcion_adjnto',
'		, b.c002 file_name',
unistr('		, decode (a.indcdor_oblgtrio, ''S'', ''S\00ED'', ''N'', ''No'') dscrpcion_indcdor_oblgtrio'),
'        , 1 descargar',
'	 from si_d_nvddes_prsna_adjnto_tp	a',
'	 left join apex_collections			b on b.collection_name = ''ADJUNTOS_NOVEDADES_PERSONA''',
'      and b.n001                        = :F_ID_INSTNCIA_FLJO',
'      and a.id_nvdad_prsna_adjnto_tpo   = b.n002   ',
'    where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.cdgo_nvdad_tpo 				= :P28_CDGO_NVDAD_TPO',
'      and a.actvo 						= ''S''*/',
'    '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1',
'  from si_g_novedades_prsna_adjnto a join si_d_nvddes_prsna_adjnto_tp b ',
'                                  on a.id_nvdad_prsna_adjnto_tpo = b.id_nvdad_prsna_adjnto_tpo    ',
'  where a.id_nvdad_prsna = :P30_ID_NVDAD_PRSNA'))
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
 p_id=>wwv_flow_api.id(69657190593085906)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se cargaron adjuntos'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>69657190593085906
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69657344423085908)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74255857337029702)
,p_db_column_name=>'DSCRPCION_ADJNTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Adjunto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65706100200105201)
,p_db_column_name=>'ID_NVDAD_PRSNA_ADJNTO'
,p_display_order=>50
,p_column_identifier=>'H'
,p_column_label=>'Id Nvdad Prsna Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'STRIP_HTML_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65706208083105202)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:SI_G_NOVEDADES_PRSNA_ADJNTO:FILE_BLOB:ID_NVDAD_PRSNA_ADJNTO::::::attachment:<center><span class=" fa fa-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(69668263375199573)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'696683'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ADJNTO:DSCRGAR:FILE_NAME:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70178440742256602)
,p_plug_name=>'Cambios Realizados'
,p_parent_plug_id=>wwv_flow_api.id(70178303624256601)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P30_ID_NVDAD_PRSNA is null then ',
'    ',
'        return q''~',
'           select a.id_tmpral',
'                , a.c004                        lbel',
'                , nvl(a.c006, nvl(c002, '' ''))   vlor_antrior',
'                , nvl(a.c007, nvl(c003, '' ''))   vlor_nvo',
'             from gn_g_temporal     a',
'            where a.n001            = :F_ID_INSTNCIA_FLJO',
'              and a.c005            = ''SUJETO''',
'              and (c002              != c003 ',
'               or (c002             is null and c003 is not null)',
'               or (c003             is null and c002 is not null)); ',
'        ~'';',
'    else',
'        return q''~ ',
'           select a.id_nvdad_prsna_dtlle                              id_tmpral',
'                , a.lbel_atrbto                                       lbel',
'                , nvl(txto_vlor_antrior, nvl(a.vlor_antrior, '' ''))    vlor_antrior',
'                , nvl(txto_vlor_nvo,     nvl(a.vlor_nvo, '' ''))        vlor_nvo',
'             from si_g_novedades_prsna_dtlle    a',
'            where a.id_nvdad_prsna              = :P30_ID_NVDAD_PRSNA',
'              and a.atrbto                      like ''P34%''; ',
'        ~'';',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
' from gn_g_temporal     a',
'where a.n001            = :F_ID_INSTNCIA_FLJO',
'  and a.c005            = ''SUJETO''',
'  and (c002              != c003 ',
'   or (c002             is null and c003 is not null)',
'   or (c003             is null and c002 is not null))  ',
'UNION',
'select 1',
' from si_g_novedades_prsna_dtlle    a',
'where a.id_nvdad_prsna              = :P30_ID_NVDAD_PRSNA',
'  and a.atrbto                      like ''P34%'''))
,p_plug_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_api.id(70335888592477701)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>70335888592477701
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70335991589477702)
,p_db_column_name=>'ID_TMPRAL'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Tmpral'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70336096341477703)
,p_db_column_name=>'LBEL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Atributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70336179285477704)
,p_db_column_name=>'VLOR_ANTRIOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Valor Anterior'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70336287725477705)
,p_db_column_name=>'VLOR_NVO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nuevo Valor '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(70345108335511783)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'703452'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_TMPRAL:LBEL:VLOR_ANTRIOR:VLOR_NVO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(70652316968896404)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(70178303624256601)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P30_ID_NVDAD_PRSNA is null then ',
'        return q''~',
'           select seq_id',
'                , c001 id_sjto_rspnsble',
'                , c002 id_sjto_impsto',
'                , c003 cdgo_idntfccion_tpo',
'                , c004 idntfccion',
'                , c005 prmer_nmbre',
'                , c006 sgndo_nmbre',
'                , c007 prmer_aplldo',
'                , c008 sgndo_aplldo',
'                , c009 prncpal_s_n',
'                , c010 cdgo_tpo_rspnsble',
'                , c011 prcntje_prtcpcion',
'                , c012 orgen_dcmnto',
'                , c013 id_pais_ntfccion',
'                , c014 id_dprtmnto_ntfccion',
'                , c015 id_mncpio_ntfccion',
'                , c016 drccion_ntfccion',
'                , c017 email',
'                , c018 tlfno',
'                , c019 cllar',
'                , c020 actvo',
'                , c021 id_trcro',
'                , c022 estdo',
'             from apex_collections    a',
'            where collection_name     = ''RESPONSABLES''',
'              and n001                = :F_ID_INSTNCIA_FLJO;',
'        ~'';',
'    else',
'        return q''~',
'           select id_nvdad_prsna_rspnsble seq_id',
'                , id_sjto_rspnsble',
'                , null id_sjto_impsto',
'                , cdgo_idntfccion_tpo',
'                , idntfccion',
'                , prmer_nmbre',
'                , sgndo_nmbre',
'                , prmer_aplldo',
'                , sgndo_aplldo',
'                , prncpal_s_n',
'                , cdgo_tpo_rspnsble',
'                , prcntje_prtcpcion',
'                , orgen_dcmnto',
'                , id_pais_ntfccion',
'                , id_dprtmnto_ntfccion',
'                , id_mncpio_ntfccion',
'                , drccion_ntfccion',
'                , email',
'                , tlfno',
'                , cllar',
'                , actvo',
'                , id_trcro',
'                , estdo',
'             from si_g_novddes_prsna_rspnsble    a',
'            where id_nvdad_prsna                 = :P30_ID_NVDAD_PRSNA;',
'        ~'';',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
' from apex_collections    a',
'where collection_name     = ''RESPONSABLES''',
'  and n001                = :F_ID_INSTNCIA_FLJO',
' union',
'   select 1',
'     from si_g_novddes_prsna_rspnsble    a',
'    where id_nvdad_prsna                 = :P30_ID_NVDAD_PRSNA;'))
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
 p_id=>wwv_flow_api.id(70652486659896405)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_NVDAD_PRSNA,P36_ID_NVDAD_PRSNA_RSPNSBLE:&P28_ID_NVDAD_PRSNA.,#SEQ_ID#'
,p_detail_link_text=>'<span aria-hidden="true" class="fa fa-eye" style="color: blue;" ></span>'
,p_owner=>'SROMERO'
,p_internal_uid=>70652486659896405
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70652571626896406)
,p_db_column_name=>'SEQ_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Seq Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70652683074896407)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto Rspnsble'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70652721159896408)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70652843329896409)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo de Identificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70586543772699932)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70652904370896410)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653049820896411)
,p_db_column_name=>'PRMER_NMBRE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Primer Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653198138896412)
,p_db_column_name=>'SGNDO_NMBRE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Segundo Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653220973896413)
,p_db_column_name=>'PRMER_APLLDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Primer Apelido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653349509896414)
,p_db_column_name=>'SGNDO_APLLDO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Segundo Apelido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653471859896415)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653534125896416)
,p_db_column_name=>'CDGO_TPO_RSPNSBLE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Tipo de Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70591738739699933)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653686785896417)
,p_db_column_name=>'PRCNTJE_PRTCPCION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Prcntje Prtcpcion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653726627896418)
,p_db_column_name=>'ORGEN_DCMNTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Orgen Dcmnto'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653837177896419)
,p_db_column_name=>'ID_PAIS_NTFCCION'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Id Pais Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70653927559896420)
,p_db_column_name=>'ID_DPRTMNTO_NTFCCION'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Id Dprtmnto Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70654039489896421)
,p_db_column_name=>'ID_MNCPIO_NTFCCION'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Id Mncpio Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70654149207896422)
,p_db_column_name=>'DRCCION_NTFCCION'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Drccion Ntfccion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70654287541896423)
,p_db_column_name=>'EMAIL'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70654375714896424)
,p_db_column_name=>'TLFNO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Tlfno'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70654453638896425)
,p_db_column_name=>'CLLAR'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Cllar'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70654513071896426)
,p_db_column_name=>'ACTVO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Activo'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70654640438896427)
,p_db_column_name=>'ID_TRCRO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Id Trcro'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(70654760708896428)
,p_db_column_name=>'ESTDO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(70671164152952165)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'706712'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_IDNTFCCION_TPO:IDNTFCCION:PRMER_NMBRE:SGNDO_NMBRE:PRMER_APLLDO:SGNDO_APLLDO:PRNCPAL_S_N:CDGO_TPO_RSPNSBLE:ACTVO:ESTDO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73989392488066701)
,p_plug_name=>unistr('Informaci\00F3n de Contribuyente')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent1:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>60
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P30_ID_NVDAD_PRSNA_SJTO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73989406182066702)
,p_plug_name=>unistr('<b>Informaci\00F3n B\00E1sica</b>')
,p_parent_plug_id=>wwv_flow_api.id(73989392488066701)
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73990697026066714)
,p_plug_name=>unistr('<b>Informaci\00F3n de Notificaci\00F3n</b>')
,p_parent_plug_id=>wwv_flow_api.id(73989392488066701)
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73991323145066721)
,p_plug_name=>unistr('<b>Informaci\00F3n de C\00E1mara de Comercio</b>')
,p_parent_plug_id=>wwv_flow_api.id(73989392488066701)
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73992476983066732)
,p_plug_name=>unistr('Inscripci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(73989392488066701)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P30_CDGO_NVDAD_TPO = ''INS'''
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8986195673062601)
,p_plug_name=>'Sucursales'
,p_parent_plug_id=>wwv_flow_api.id(73992476983066732)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_nvdad_prsna_scrsal ',
'        , id_nvdad_prsna    ',
'        , cdgo_scrsal',
'        , nmbre                 ',
'        , drccion               ',
'        , id_dprtmnto_ntfccion  ',
'        , id_mncpio_ntfccion    ',
'        , tlfno                 ',
'        , cllar                 ',
'        , email          ',
'     from si_g_nvddes_prsna_scrsal    ',
'    where id_nvdad_prsna      = :P30_ID_NVDAD_PRSNA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_g_nvddes_prsna_scrsal    ',
'    where id_nvdad_prsna      = :P30_ID_NVDAD_PRSNA',
'  and :P30_CDGO_NVDAD_TPO = ''INS'''))
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(8986241192062602)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se ingresaron Sucursales'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'JPRADA'
,p_internal_uid=>8986241192062602
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8987310771062613)
,p_db_column_name=>'ID_NVDAD_PRSNA'
,p_display_order=>110
,p_column_identifier=>'A'
,p_column_label=>'Id Nvdad Prsna'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8987497041062614)
,p_db_column_name=>'ID_NVDAD_PRSNA_SCRSAL'
,p_display_order=>120
,p_column_identifier=>'B'
,p_column_label=>'Id Nvdad Prsna Scrsal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(9050586660502801)
,p_db_column_name=>'CDGO_SCRSAL'
,p_display_order=>130
,p_column_identifier=>'J'
,p_column_label=>unistr('C\00F3digo')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8987587951062615)
,p_db_column_name=>'NMBRE'
,p_display_order=>140
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8987686762062616)
,p_db_column_name=>'DRCCION'
,p_display_order=>150
,p_column_identifier=>'D'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8987705408062617)
,p_db_column_name=>'ID_DPRTMNTO_NTFCCION'
,p_display_order=>160
,p_column_identifier=>'E'
,p_column_label=>'Departamento'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(70569261834676479)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8987853749062618)
,p_db_column_name=>'ID_MNCPIO_NTFCCION'
,p_display_order=>170
,p_column_identifier=>'F'
,p_column_label=>'Municipio'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(70579007349685835)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8987909004062619)
,p_db_column_name=>'TLFNO'
,p_display_order=>180
,p_column_identifier=>'G'
,p_column_label=>unistr('Tel\00E9fono')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8988024981062620)
,p_db_column_name=>'CLLAR'
,p_display_order=>190
,p_column_identifier=>'H'
,p_column_label=>'Celular'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8988181275062621)
,p_db_column_name=>'EMAIL'
,p_display_order=>200
,p_column_identifier=>'I'
,p_column_label=>'Email'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(8994854607101206)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'89949'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_SCRSAL:NMBRE:DRCCION:ID_DPRTMNTO_NTFCCION:ID_MNCPIO_NTFCCION:TLFNO:CLLAR:EMAIL:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73992566111066733)
,p_plug_name=>'Responsables'
,p_parent_plug_id=>wwv_flow_api.id(73992476983066732)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_nvdad_prsna',
'        , a.id_nvdad_prsna_rspnsble',
'        , a.cdgo_idntfccion_tpo',
'        , a.idntfccion',
'        , a.prmer_nmbre',
'        , a.sgndo_nmbre',
'        , a.prmer_aplldo',
'        , a.sgndo_aplldo',
'        , a.prncpal_s_n',
'        , a.cdgo_tpo_rspnsble',
'        , a.actvo',
'     from si_g_novddes_prsna_rspnsble    a',
'    where id_nvdad_prsna     			= :P30_ID_NVDAD_PRSNA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_g_novddes_prsna_rspnsble    a',
'    where id_nvdad_prsna     			= :P30_ID_NVDAD_PRSNA',
'     and :P30_CDGO_NVDAD_TPO = ''INS'''))
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
 p_id=>wwv_flow_api.id(73992601087066734)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se ingresaron Responsables'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID_NVDAD_PRSNA,P36_ID_NVDAD_PRSNA_RSPNSBLE:#ID_NVDAD_PRSNA#,#ID_NVDAD_PRSNA_RSPNSBLE#'
,p_detail_link_text=>'<span aria-hidden="true" class="fa fa-eye" style="color: blue;" ></span>'
,p_owner=>'SROMERO'
,p_internal_uid=>73992601087066734
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74058246247569301)
,p_db_column_name=>'ID_NVDAD_PRSNA'
,p_display_order=>10
,p_column_identifier=>'K'
,p_column_label=>'Id Nvdad Prsna'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73992784963066735)
,p_db_column_name=>'ID_NVDAD_PRSNA_RSPNSBLE'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id Nvdad Prsna Rspnsble'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73992828804066736)
,p_db_column_name=>'CDGO_IDNTFCCION_TPO'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Tipo de<br> Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70586543772699932)
,p_rpt_show_filter_lov=>'1'
);
end;
/
begin
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73992961756066737)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Indentificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73993045448066738)
,p_db_column_name=>'PRMER_NMBRE'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Primer Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73993124063066739)
,p_db_column_name=>'SGNDO_NMBRE'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Segundo Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73993292071066740)
,p_db_column_name=>'PRMER_APLLDO'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Primer Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73993347540066741)
,p_db_column_name=>'SGNDO_APLLDO'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Segundo Apellido'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73993428992066742)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>unistr('\00BFPrincipal?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73993565795066743)
,p_db_column_name=>'CDGO_TPO_RSPNSBLE'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Tipo de <br>Responsable'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(70591738739699933)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73993662143066744)
,p_db_column_name=>'ACTVO'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFActivo?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(74019040060481104)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'740191'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_PRSNA_RSPNSBLE:CDGO_IDNTFCCION_TPO:IDNTFCCION:PRMER_NMBRE:SGNDO_NMBRE:PRMER_APLLDO:SGNDO_APLLDO:PRNCPAL_S_N:CDGO_TPO_RSPNSBLE:ACTVO:ID_NVDAD_PRSNA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73993777989066745)
,p_plug_name=>unistr('Actividades Econ\00F3micas')
,p_parent_plug_id=>wwv_flow_api.id(73992476983066732)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_nvdad_prsna_actvd_eco',
'        , ''['' ||  c.nmbre_dclrcns_esqma_trfa_tpo || '' - '' ||  b.cdgo_dclrcns_esqma_trfa || ''] '' || b.dscrpcion actvdad_ecnmca',
'        , fcha_incio_actvdad',
'from si_g_nvddes_prsna_actvd_eco    a',
'	join gi_d_dclrcns_esqma_trfa     b   on a.id_actvdad_ecnmca    = b.id_dclrcns_esqma_trfa ',
'	join gi_d_dclrcns_esqma_trfa_tpo c   on  b.id_dclrcns_esqma_trfa_tpo =   c.id_dclrcns_esqma_trfa_tpo',
' where id_nvdad_prsna                 = :P30_ID_NVDAD_PRSNA',
' ',
' ',
'',
'/*select id_nvdad_prsna_actvd_eco',
'        , ''['' ||  c.nmbre_actvdad_ecnmca_tpo || '' - '' ||  b.cdgo_actvdad_ecnmca || ''] '' || b.dscrpcion actvdad_ecnmca',
'        , fcha_incio_actvdad',
'     from si_g_nvddes_prsna_actvd_eco    a',
'     join gi_d_actividades_economica     b on a.id_actvdad_ecnmca    = b.id_actvdad_ecnmca',
'     join gi_d_actividades_ecnmca_tpo    c on b.id_actvdad_ecnmca_tpo = c.id_actvdad_ecnmca_tpo',
'    where id_nvdad_prsna                 = :P30_ID_NVDAD_PRSNA*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from si_g_nvddes_prsna_actvd_eco    a ',
' where id_nvdad_prsna                 = :P30_ID_NVDAD_PRSNA',
'     and :P30_CDGO_NVDAD_TPO = ''INS'''))
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
 p_id=>wwv_flow_api.id(73993909224066747)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ingresaron Actividades Econ\00F3micas')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>73993909224066747
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(73994000670066748)
,p_db_column_name=>'ID_NVDAD_PRSNA_ACTVD_ECO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Nvdad Prsna Actvd Eco'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74023638208555601)
,p_db_column_name=>'ACTVDAD_ECNMCA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Actividad Econ\00F3mica')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74051764647531101)
,p_db_column_name=>'FCHA_INCIO_ACTVDAD'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Inicio de Actvidad'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(74030161620563852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'740302'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_NVDAD_PRSNA_ACTVD_ECO:ACTVDAD_ECNMCA:FCHA_INCIO_ACTVDAD'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73993886767066746)
,p_plug_name=>'Adjuntos'
,p_parent_plug_id=>wwv_flow_api.id(73992476983066732)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_dcmnto,',
'        c.dscrpcion_dcmnto,',
'        a.file_name,',
'        a.obsrvcion,',
'        1 dscrgar',
'   from pq_g_documentos             a',
'   join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo     = :F_ID_INSTNCIA_FLJO'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from pq_g_documentos             a',
'   join v_pq_g_solicitudes          b on a.id_slctud = b.id_slctud',
'   join v_pq_d_motivos_documento    c on a.id_mtvo_dcmnto = c.id_mtvo_dcmnto',
'  where b.id_instncia_fljo_gnrdo     = :F_ID_INSTNCIA_FLJO',
'  and :P30_CDGO_NVDAD_TPO = ''INS'''))
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
 p_id=>wwv_flow_api.id(74023710932555602)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se cargaron Adjuntos'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'SROMERO'
,p_internal_uid=>74023710932555602
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74023870484555603)
,p_db_column_name=>'ID_DCMNTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74023909966555604)
,p_db_column_name=>'DSCRPCION_DCMNTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74024020103555605)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74024168440555606)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74024271168555607)
,p_db_column_name=>'DSCRGAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Descargar'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'DOWNLOAD:PQ_G_DOCUMENTOS:FILE_BLOB:ID_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>:'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(74033238958581410)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'740333'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_DCMNTO:DSCRPCION_DCMNTO:FILE_NAME:OBSRVCION:DSCRGAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69795167352733803)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(69679193194417501)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:RP,28,29,30::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69679355770417503)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(69679193194417501)
,p_button_name=>'BTN_REGISTRAR_NOVEDAD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Registrar la Novedad?'',''BTN_REGISTRAR_NOVEDAD'')'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  :P30_ID_NVDAD_PRSNA is null and (:P28_RECHAZAR = ''N'' or :P28_RECHAZAR is null)',
'',
'--:P30_ID_NVDAD_PRSNA is null and :P28_ID_NVDAD_PRSNA is null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69767590745157801)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(69679193194417501)
,p_button_name=>'BTN_APLICAR_NOVEDAD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Aplicar Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Aplicar la Novedad?'',''BTN_APLICAR_NOVEDAD'')'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from si_g_novedades_persona ',
'where id_nvdad_prsna in (:P30_ID_NVDAD_PRSNA , :P28_ID_NVDAD_PRSNA )',
' and cdgo_nvdad_prsna_estdo = ''RGS'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(69784584576385801)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(69679193194417501)
,p_button_name=>'BTN_RECHAZAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Rechazar Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP:P31_TITULO:ObservaciÃ³n de Rechazo'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_total number;',
'',
'begin',
'',
'    begin',
'',
'        select 1 ',
'        into v_total',
'        from si_g_novedades_persona ',
'        where id_nvdad_prsna in (:P30_ID_NVDAD_PRSNA , :P28_ID_NVDAD_PRSNA )',
'         and cdgo_nvdad_prsna_estdo = ''RGS'';',
'          ',
'         return true;',
'         ',
'     exception    ',
'     when no_data_found then',
'     ',
'        if :P28_RECHAZAR = ''S'' then',
'            return true;',
'         else',
'            return false;',
'       end if;',
'     ',
'     end; ',
'',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-times'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5894425229964701)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(69679193194417501)
,p_button_name=>'BTN_REINICIAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Reiniciar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP:P31_TITULO:ObservaciÃ³n de Reinicio'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_total number;',
'',
'begin',
'',
'    begin',
'',
'        select 1 ',
'        into v_total',
'        from si_g_novedades_persona ',
'        where id_nvdad_prsna in (:P30_ID_NVDAD_PRSNA , :P28_ID_NVDAD_PRSNA )',
'         and cdgo_nvdad_prsna_estdo = ''RGS'';',
'          ',
'         return true;',
'         ',
'     exception    ',
'     when no_data_found then',
'     ',
'        if :P28_RECHAZAR = ''S'' then',
'            return true;',
'         else',
'            return false;',
'       end if;',
'     ',
'     end; ',
'',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-undo-arrow'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(152507906793319501)
,p_branch_name=>'Ir a pagina de gestion'
,p_branch_action=>'f?p=68000:26:&SESSION.::&DEBUG.:RP,28,29,30,31,34,35,55::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(69679355770417503)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(151994902851608001)
,p_branch_name=>'Ir al Inicio - 33'
,p_branch_action=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:RP,28,29,30,31,34,35,55:P33_ID_NVDAD_PRSNA:&P30_ID_NVDAD_PRSNA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(69767590745157801)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11930702016655701)
,p_name=>'P30_RECHAZAR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(69621711419138405)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69641569664581608)
,p_name=>'P30_CDGO_NVDAD_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69621711419138405)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo de Novedad'
,p_source=>'P30_CDGO_NVDAD_TPO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select dscrpcion',
'        , cdgo_nvdad_tpo',
'    from si_d_novedades_tipo',
'    where cdgo_sjto_tpo = ''E''',
' order by dscrpcion'))
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69656811182085903)
,p_name=>'P30_OBSRVCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69656969889085904)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'P30_OBSRVCION'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69679654161417506)
,p_name=>'P30_RSPSTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(69679193194417501)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(69979386375769601)
,p_name=>'P30_ID_NVDAD_PRSNA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(69621711419138405)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(:P30_ID_NVDAD_PRSNA, :P28_ID_NVDAD_PRSNA)',
'  from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73989567409066703)
,p_name=>'P30_TPO_PRSNA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>'Tipo de Persona'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Natural;N,Jur\00EDdica;J')
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73989600880066704)
,p_name=>'P30_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73989701238066705)
,p_name=>'P30_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73989832662066706)
,p_name=>'P30_NMBRE_RZON_SCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>unistr('Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P30_TPO_PRSNA'
,p_display_when2=>'J'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73989910203066707)
,p_name=>'P30_PRMER_NMBRE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P30_TPO_PRSNA'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990007969066708)
,p_name=>'P30_SGNDO_NMBRE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P30_TPO_PRSNA'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990120687066709)
,p_name=>'P30_PRMER_APLLDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P30_TPO_PRSNA'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990244226066710)
,p_name=>'P30_SGNDO_APLLDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P30_TPO_PRSNA'
,p_display_when2=>'N'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990331996066711)
,p_name=>'P30_ID_DPRTMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>'Departamento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990407879066712)
,p_name=>'P30_ID_MNCPIO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>'Municipio'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MUNICIPIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio as d,',
'       id_mncpio as r',
'  from df_s_municipios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990509335066713)
,p_name=>'P30_DRCCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990786420066715)
,p_name=>'P30_ID_DPRTMNTO_NTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73990697026066714)
,p_prompt=>unistr('Departamento Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990820310066716)
,p_name=>'P30_ID_MNCPIO_NTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73990697026066714)
,p_prompt=>unistr('Municipio Notificaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_MUNICIPIOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio as d,',
'       id_mncpio as r',
'  from df_s_municipios',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73990912516066717)
,p_name=>'P30_DRCCION_NTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(73990697026066714)
,p_prompt=>unistr('Direcci\00F3n Notificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73991079184066718)
,p_name=>'P30_TLFNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(73990697026066714)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73991141557066719)
,p_name=>'P30_CLLAR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(73990697026066714)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73991238356066720)
,p_name=>'P30_EMAIL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(73990697026066714)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588311049834706)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73991594113066723)
,p_name=>'P30_ID_ACTVDAD_ECNMCA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73991323145066721)
,p_prompt=>unistr('Actividad Ec\00F3nomica Principal')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ''['' || a.cdgo_dclrcns_esqma_trfa || ''] '' || a.dscrpcion',
'         , a.cdgo_dclrcns_esqma_trfa     id_actvdad_ecnmca',
'from    gi_d_dclrcns_esqma_trfa     a',
'join    gi_d_dclrcns_esqma_trfa_tpo b   on  b.id_dclrcns_esqma_trfa_tpo =   a.id_dclrcns_esqma_trfa_tpo',
'where   b.cdgo_clnte                =   :F_CDGO_CLNTE',
'        and cdgo_dclrcns_esqma_trfa_tpo in (''1'',''2'',''3'',''4'') ',
'        and sysdate between fcha_dsde and fcha_hsta',
'order by    a.dscrpcion',
'',
'',
'',
'/*select  ''['' || b.cdgo_actvdad_ecnmca || ''] '' || b.dscrpcion',
'        , id_actvdad_ecnmca',
'     from gi_d_actividades_ecnmca_tpo    a',
'     join gi_d_actividades_economica     b on a.id_actvdad_ecnmca_tpo = b.id_actvdad_ecnmca_tpo',
'    where a.cdgo_clnte                   = :F_CDGO_CLNTE',
' order by b.cdgo_actvdad_ecnmca*/'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73991683977066724)
,p_name=>'P30_FCHA_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(73991323145066721)
,p_prompt=>'Fecha Registro de Camara Comercio'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73991772412066725)
,p_name=>'P30_NMRO_RGSTRO_CMRA_CMRCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(73991323145066721)
,p_prompt=>'Camara de Comercio'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73991842217066726)
,p_name=>'P30_FCHA_INCIO_ACTVDDES'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(73991323145066721)
,p_prompt=>'Fecha inicio Actividades'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73991909676066727)
,p_name=>'P30_NMRO_SCRSLES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(73991323145066721)
,p_prompt=>'N.  Sucursales'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73992053552066728)
,p_name=>'P30_DRCCION_CMRA_CMRCIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(73991323145066721)
,p_prompt=>unistr('Direcci\00F3n de Cam\00E1ra Comercio')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73992273304066730)
,p_name=>'P30_ID_NVDAD_PRSNA_SJTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73989392488066701)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74058355399569302)
,p_name=>'P30_ID_SJTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_prompt=>'Tipo de Sujeto'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_sjto_tpo',
'        , id_sjto_tpo',
'     from df_i_sujetos_tipo',
'    where cdgo_clnte            = :F_CDGO_CLNTE',
' order by nmbre_sjto_tpo'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74058403788569303)
,p_name=>'P30_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(69621711419138405)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'P30_ID_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74861603202037001)
,p_name=>'P30_ID_PAIS_NTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(73990697026066714)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_pais',
'  from df_s_clientes',
'  where cdgo_clnte		= :F_CDGO_CLNTE;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74861770283037002)
,p_name=>'P30_ID_PAIS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(73989406182066702)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_pais',
'  from df_s_clientes',
'  where cdgo_clnte		= :F_CDGO_CLNTE;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75994311495640201)
,p_name=>'P30_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(69621711419138405)
,p_use_cache_before_default=>'NO'
,p_source=>'P30_ID_SJTO_IMPSTO'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(152379912049904203)
,p_name=>'P30_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(69621711419138405)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(73992306819066731)
,p_computation_sequence=>10
,p_computation_item=>'P30_ID_NVDAD_PRSNA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_nvdad_prsna',
'     from si_g_novedades_persona',
'    where id_instncia_fljo        = :F_ID_INSTNCIA_FLJO'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69767736387157803)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos de Novedad Persona'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   select id_nvdad_prsna',
'        , id_impsto',
'        , id_impsto',
'        , id_impsto_sbmpsto',
'        , cdgo_nvdad_tpo',
'        , id_sjto_impsto',
'        , obsrvcion',
'        , cdgo_nvdad_prsna_estdo',
'     into :P30_ID_NVDAD_PRSNA',
'        , :P30_ID_IMPSTO',
'        , :P30_ID_IMPSTO',
'        , :P30_ID_IMPSTO_SBMPSTO',
'        , :P30_CDGO_NVDAD_TPO',
'        , :P30_ID_SJTO_IMPSTO',
'        , :P30_OBSRVCION',
'        , :P28_CDGO_NVDAD_PRSNA_ESTDO',
'     from si_g_novedades_persona',
'    where id_nvdad_prsna            = nvl(:P30_ID_NVDAD_PRSNA, :P28_ID_NVDAD_PRSNA);',
'    ',
'    insert into muerto2  (v_001, v_002, t_001)  values (''1. ENTRO A CONSULTAR LOS DATOS DE LA NOVEDAD '','':P30_ID_SJTO_IMPSTO --'' || :P30_ID_SJTO_IMPSTO,SYSDATE); commit; ',
'    ',
'    ',
'exception',
'    when others then ',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'(:P30_ID_NVDAD_PRSNA is not null or :P28_ID_NVDAD_PRSNA is not null )'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73992181118066729)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Datos de Novedad Persona Sujeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_nvdad_prsna_sjto',
'        , tpo_prsna',
'		, cdgo_idntfccion_tpo',
'		, idntfccion',
'		, prmer_nmbre',
'		, sgndo_nmbre',
'		, prmer_aplldo		',
'		, sgndo_aplldo		',
'		, nmbre_rzon_scial',
'		, drccion',
'		, id_pais',
'		, id_dprtmnto',
'		, id_mncpio',
'		, drccion_ntfccion',
'		, id_pais_ntfccion',
'		, id_dprtmnto_ntfccion',
'		, id_mncpio_ntfccion',
'		, email',
'		, tlfno',
'		, cllar',
'		, nmro_rgstro_cmra_cmrcio',
'		, to_char(fcha_rgstro_cmra_cmrcio, ''DD/MM/YYYY'')',
'		, to_char(fcha_incio_actvddes, ''DD/MM/YYYY'')',
'		, nmro_scrsles',
'		, drccion_cmra_cmrcio',
'		, cdgo_dclrcns_esqma_trfa',
'        , id_sjto_tpo',
'     into :P30_ID_NVDAD_PRSNA_SJTO',
'        , :P30_TPO_PRSNA',
'		, :P30_CDGO_IDNTFCCION_TPO',
'		, :P30_IDNTFCCION',
'		, :P30_PRMER_NMBRE',
'		, :P30_SGNDO_NMBRE',
'		, :P30_PRMER_APLLDO		',
'		, :P30_SGNDO_APLLDO		',
'		, :P30_NMBRE_RZON_SCIAL',
'		, :P30_DRCCION',
'		, :P30_ID_PAIS',
'		, :P30_ID_DPRTMNTO',
'		, :P30_ID_MNCPIO',
'		, :P30_DRCCION_NTFCCION',
'		, :P30_ID_PAIS_NTFCCION',
'		, :P30_ID_DPRTMNTO_NTFCCION',
'		, :P30_ID_MNCPIO_NTFCCION',
'		, :P30_EMAIL',
'		, :P30_TLFNO',
'		, :P30_CLLAR',
'		, :P30_NMRO_RGSTRO_CMRA_CMRCIO',
'		, :P30_FCHA_RGSTRO_CMRA_CMRCIO',
'		, :P30_FCHA_INCIO_ACTVDDES',
'		, :P30_NMRO_SCRSLES',
'		, :P30_DRCCION_CMRA_CMRCIO',
'		, :P30_ID_ACTVDAD_ECNMCA',
'        , :P30_ID_SJTO_TPO',
'     from si_g_novedades_persona_sjto a',
'    left join  gi_d_dclrcns_esqma_trfa    b on a.id_actvdad_ecnmca = b.id_dclrcns_esqma_trfa',
'    where id_nvdad_prsna                = nvl(:P30_ID_NVDAD_PRSNA, :P28_ID_NVDAD_PRSNA);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from si_g_novedades_persona_sjto',
'    where id_nvdad_prsna                = :P30_ID_NVDAD_PRSNA;'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152067876455488344)
,p_process_sequence=>50
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar datos de actualizacion y/o inscripcion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_tmpral    number := 0;  ',
'    v_id_ssion     number;  ',
'    v_json         clob;  ',
'    v_total        number := 0;  ',
' ',
'begin ',
'',
'    --Tener presente que este proceso esta en las paginas 34, 29,30',
'    -- al hacer modificacion, modificarlo en esas paginas',
'   --insert into muerto2 (v_001, v_002, t_001) values (''ACTUALIZACODS'',:F_ID_INSTNCIA_FLJO||''-''|| :F_ID_FLJO_TREA,SYSDATE); commit;',
'    ',
'    /*',
'    select count(1)',
'    into v_total',
'    from gn_g_temporal ',
'    where n001           = :F_ID_INSTNCIA_FLJO     --instancia flujo'',',
'    and   c005           =  ''SUJETO'' ;',
'',
'    if v_total > 0 then',
'    */',
'      for c_item in  ( ',
'                    --busco la instancia flujo de esa temporal'',',
'                    select c001, c003 ',
'                    from gn_g_temporal ',
'                    where n001           = :F_ID_INSTNCIA_FLJO     --instancia flujo'',',
'                    and   c005           =  ''SUJETO'' ',
'                ) loop ',
'',
'                --v(c_item.c001):= c_item.c003; '',',
'                --v(''''F_CDGO_CLNTE'''')'',',
'                --v(''''P34_CDGO_IDNTFCCION_TPO'''')'',',
'',
'               -- insert into muerto (v_001, v_002, T_001) values (''''NOVEDADES'''', c_item.c001, sysdate); commit;'',',
'                if c_item.c001 = ''P34_CDGO_IDNTFCCION_TPO''			then :P34_CDGO_IDNTFCCION_TPO		:= c_item.c003; end if ;',
'                if c_item.c001 = ''P34_PRMER_NMBRE''                  then :P34_PRMER_NMBRE               := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_SGNDO_NMBRE''                  then :P34_SGNDO_NMBRE               := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_PRMER_APLLDO''                 then :P34_PRMER_APLLDO              := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_SGNDO_APLLDO''                 then :P34_SGNDO_APLLDO              := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_NMBRE_RZON_SCIAL''             then :P34_NMBRE_RZON_SCIAL          := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_DPRTMNTO''                  then :P34_ID_DPRTMNTO               := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_MNCPIO''                    then :P34_ID_MNCPIO                 := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_DPRTMNTO_NTFCCION''         then :P34_ID_DPRTMNTO_NTFCCION      := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_MNCPIO_NTFCCION''           then :P34_ID_MNCPIO_NTFCCION        := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_DRCCION''                      then :P34_DRCCION                   := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_DRCCION_NTFCCION''             then :P34_DRCCION_NTFCCION          := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_SJTO_TPO''                  then :P34_ID_SJTO_TPO               := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_NMRO_SCRSLES''                 then :P34_NMRO_SCRSLES              := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_ID_ACTVDAD_ECNMCA''            then :P34_ID_ACTVDAD_ECNMCA         := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_TLFNO''                        then :P34_TLFNO                     := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_EMAIL''                        then :P34_EMAIL                     := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_FCHA_INCIO_ACTVDDES''          then :P34_FCHA_INCIO_ACTVDDES       := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_NMRO_RGSTRO_CMRA_CMRCIO''      then :P34_NMRO_RGSTRO_CMRA_CMRCIO   := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_DRCCION_CMRA_CMRCIO''          then :P34_DRCCION_CMRA_CMRCIO       := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_FCHA_RGSTRO_CMRA_CMRCIO''      then :P34_FCHA_RGSTRO_CMRA_CMRCIO   := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_TPO_PRSNA''                    then :P34_TPO_PRSNA                 := c_item.c003; end if ;',
'                if c_item.c001 = ''P34_IDNTFCCION''                   then :P34_IDNTFCCION                := c_item.c003; end if ;',
'',
'        end loop; ',
'   /* else',
'        :P34_CDGO_IDNTFCCION_TPO	 := null;	',
'        :P34_PRMER_NMBRE             := null; ',
'        :P34_SGNDO_NMBRE             := null; ',
'        :P34_PRMER_APLLDO            := null; ',
'        :P34_SGNDO_APLLDO            := null; ',
'        :P34_NMBRE_RZON_SCIAL        := null; ',
'        :P34_ID_DPRTMNTO             := null; ',
'        :P34_ID_MNCPIO               := null; ',
'        :P34_ID_DPRTMNTO_NTFCCION    := null; ',
'        :P34_ID_MNCPIO_NTFCCION      := null; ',
'        :P34_DRCCION                 := null; ',
'        :P34_DRCCION_NTFCCION        := null; ',
'        :P34_ID_SJTO_TPO             := null; ',
'        :P34_NMRO_SCRSLES            := null; ',
'        :P34_ID_ACTVDAD_ECNMCA       := null; ',
'        :P34_TLFNO                   := null; ',
'        :P34_EMAIL                   := null; ',
'        :P34_FCHA_INCIO_ACTVDDES     := null; ',
'        :P34_NMRO_RGSTRO_CMRA_CMRCIO := null; ',
'        :P34_DRCCION_CMRA_CMRCIO     := null; ',
'        :P34_FCHA_RGSTRO_CMRA_CMRCIO := null; ',
'        :P34_TPO_PRSNA               := null; ',
'        :P34_IDNTFCCION              := null; ',
'    end if;*/',
'end;  '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P30_CDGO_NVDAD_TPO in (''ACT'',''INS'')'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152069026663491851)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar parametros del flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_trnscion   number := 0; ',
'    v_cdgo_nvdad_tpo         si_d_novedades_tipo.cdgo_nvdad_tpo%type;',
'    v_idntfccion             varchar(20);',
'    v_id_sjto_impsto         number := 0; ',
'    v_id_impsto              number := 0; ',
'    v_obsrvcion              si_g_novedades_persona.obsrvcion%type;',
'    v_id_impsto_sbmpsto      number := 0; ',
'begin',
'',
'        begin',
'            --insert into muerto2 (v_001, v_002, t_001) values (''PARAMETROS'',:F_ID_INSTNCIA_FLJO||''-''|| :F_ID_FLJO_TREA,SYSDATE); commit;',
'            select id_instncia_trnscion',
'            into v_id_instncia_trnscion',
'            from wf_g_instancias_transicion',
'            where  id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'            and id_fljo_trea_orgen = :F_ID_FLJO_TREA;',
'        exception',
'            when others then',
'               raise_application_error(-20003, ''Error al consultar la transicion de la instancia flujo : '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);   ',
'        end;                    ',
'',
'',
'        --insert into muerto2  (v_001, v_002, t_001)  values (''PARAMETROS'',''v_id_instncia_trnscion : '' || v_id_instncia_trnscion,SYSDATE); commit;',
'        begin',
'            select vlor',
'            into v_cdgo_nvdad_tpo ',
'            from wf_g_instancias_item_valor',
'            where  id_instncia_trnscion = v_id_instncia_trnscion',
'            and nmbre_item =  ''P30_CDGO_NVDAD_TPO''; ',
'',
'            :P28_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ;',
'            :P29_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ;',
'            :P34_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ;',
'            :P30_CDGO_NVDAD_TPO := v_cdgo_nvdad_tpo ;',
'            --insert into muerto2  (v_001, v_002, t_001)  values (''PARAMETROS'',''P34_CDGO_NVDAD_TPO : '' || :P34_CDGO_NVDAD_TPO,SYSDATE); commit;',
'            ',
'        exception',
'            when no_data_found then',
'                if  :P28_CDGO_NVDAD_TPO is not null then ',
'                    :P29_CDGO_NVDAD_TPO := :P28_CDGO_NVDAD_TPO ;',
'                    :P34_CDGO_NVDAD_TPO := :P28_CDGO_NVDAD_TPO ;',
'                    :P30_CDGO_NVDAD_TPO := :P28_CDGO_NVDAD_TPO ;',
'                end if;            ',
'            when others then',
'               raise_application_error(-20003, ''No se encontro  P30_CDGO_NVDAD_TPO en la instancia  flujo : '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);   ',
'        end;',
'        ',
'        begin',
'            select vlor',
'            into v_idntfccion',
'            from wf_g_instancias_item_valor',
'            where  id_instncia_trnscion = v_id_instncia_trnscion',
'            and nmbre_item =  ''P30_IDNTFCCION'';',
'',
'            :P28_IDNTFCCION := v_idntfccion;',
'            :P29_IDNTFCCION := v_idntfccion;',
'            :P34_IDNTFCCION := v_idntfccion;',
'            :P30_IDNTFCCION := v_idntfccion;',
'        exception',
'            when no_data_found then',
'                if  :P28_IDNTFCCION is not null then ',
'                ',
'                    :P29_IDNTFCCION := :P28_IDNTFCCION ;',
'                    :P34_IDNTFCCION := :P28_IDNTFCCION ;',
'                    :P30_IDNTFCCION := :P28_IDNTFCCION ;',
'                end if;       ',
'            when others then',
'               raise_application_error(-20003, ''No se encontro  P30_IDNTFCCION en la instancia  flujo :  '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);   ',
'        end;        ',
'        ',
'       -- insert into muerto  (v_001, v_002, t_001)  values (''PARAMETROS'','':P34_IDNTFCCION  :'' || :P34_IDNTFCCION,SYSDATE); commit;',
'        begin',
'            select vlor',
'            into v_id_sjto_impsto ',
'            from wf_g_instancias_item_valor',
'            where  id_instncia_trnscion = v_id_instncia_trnscion',
'            and nmbre_item =  ''P30_ID_SJTO_IMPSTO'';',
'',
'            :P29_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'            :P34_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'            :P30_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'            :P28_ID_SJTO_IMPSTO := v_id_sjto_impsto;  ',
'        ',
'        exception',
'            when no_data_found then ',
'                --insert into muerto2 (v_001, v_002, t_001) values (''ENTRO AL NO DATA FOUND  P30_ID_SJTO_IMPSTO'',:F_ID_INSTNCIA_FLJO||''-''|| :F_ID_FLJO_TREA,SYSDATE); commit;  ',
'                if :28_ID_SJTO_IMPSTO is not null then',
'                    :P29_ID_SJTO_IMPSTO := :28_ID_SJTO_IMPSTO;',
'                    :P34_ID_SJTO_IMPSTO := :28_ID_SJTO_IMPSTO;',
'                    :P30_ID_SJTO_IMPSTO := :28_ID_SJTO_IMPSTO; ',
'                 end if; ',
'            when others then',
'               raise_application_error(-20003, ''No se encontro  P30_ID_SJTO_IMPSTO en la instancia  flujo :  '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);   ',
'        end;',
'        ',
'        ',
'          --insert into muerto2  (v_001, v_002, t_001)  values (''PARAMETROS'','':P30_ID_SJTO_IMPSTO --'' || :P30_ID_SJTO_IMPSTO,SYSDATE); commit; ',
'          --insert into muerto2  (v_001, v_002, t_001)  values (''PARAMETROS'',''v_id_sjto_impsto  --'' || v_id_sjto_impsto,SYSDATE); commit;',
'          ',
'        begin          ',
'            select vlor',
'            into v_id_impsto ',
'            from wf_g_instancias_item_valor',
'            where  id_instncia_trnscion = v_id_instncia_trnscion',
'            and nmbre_item =  ''P30_ID_IMPSTO'';',
'',
'            :P28_ID_IMPSTO := v_id_impsto;',
'            :P29_ID_IMPSTO := v_id_impsto;',
'            :P34_ID_IMPSTO := v_id_impsto;',
'            :P30_ID_IMPSTO := v_id_impsto; ',
'',
'        exception',
'            when no_data_found then',
'                if :P28_ID_IMPSTO is not null then',
'                    :P29_ID_IMPSTO := :P28_ID_IMPSTO;',
'                    :P34_ID_IMPSTO := :P28_ID_IMPSTO;',
'                    :P30_ID_IMPSTO := :P28_ID_IMPSTO; ',
'                end if;',
'            when others then',
'               raise_application_error(-20003, ''No se encontro  P30_ID_IMPSTO en la instancia  flujo :  '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);   ',
'        end;',
'        ',
'        begin',
'            select vlor',
'            into v_obsrvcion',
'            from wf_g_instancias_item_valor',
'            where  id_instncia_trnscion = v_id_instncia_trnscion',
'            and nmbre_item =  ''P30_OBSRVCION'';',
'        ',
'            :P30_OBSRVCION := v_obsrvcion; ',
'        exception',
'            when no_data_found then',
'                null;',
'            when others then',
'               raise_application_error(-20003, ''No se encontro  P30_OBSRVCION en la instancia  flujo :  '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);   ',
'        end;',
'        ',
'        begin',
'            select vlor',
'            into v_id_impsto_sbmpsto ',
'            from wf_g_instancias_item_valor',
'            where  id_instncia_trnscion = v_id_instncia_trnscion',
'            and nmbre_item =  ''P30_ID_IMPSTO_SBMPSTO'';',
'',
'            :P28_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto;',
'            :P29_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto; ',
'            :P34_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto; ',
'            :P30_ID_IMPSTO_SBMPSTO := v_id_impsto_sbmpsto; ',
'        exception',
'            when no_data_found then',
'             insert into muerto2 (v_001, v_002, t_001) values (''ENTRO AL NO DATA FOUND  P30_ID_IMPSTO_SBMPSTO'',:F_ID_INSTNCIA_FLJO||''-''|| :F_ID_FLJO_TREA,SYSDATE); commit;  ',
'                if :P28_ID_IMPSTO_SBMPSTO is not null then',
'                ',
'                    :P29_ID_IMPSTO_SBMPSTO := :P28_ID_IMPSTO_SBMPSTO; ',
'                    :P34_ID_IMPSTO_SBMPSTO := :P28_ID_IMPSTO_SBMPSTO; ',
'                    :P30_ID_IMPSTO_SBMPSTO := :P28_ID_IMPSTO_SBMPSTO;      ',
'                end if;',
'             ',
'            when others then',
'               raise_application_error(-20003, ''No se encontro  P30_ID_IMPSTO_SBMPSTO en la instancia  flujo : '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);   ',
'        end;        ',
'        ',
'         --insert into muerto2 (v_001, v_002, t_001) values (''FIN PARAMETROS'',:F_ID_INSTNCIA_FLJO||''-''|| :F_ID_FLJO_TREA,SYSDATE); commit;',
'         -- insert into muerto2  (v_001, v_002, t_001)  values (''PARAMETROS final '','':P30_ID_SJTO_IMPSTO --'' || :P30_ID_SJTO_IMPSTO,SYSDATE); commit; ',
' ',
'   end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152068171583489178)
,p_process_sequence=>70
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n de Responsables')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_total number;',
'begin',
'    ',
'    insert into muerto2(v_001,v_002) values(''Entro a coleccion respondables :F_ID_INSTNCIA_FLJO :'', :F_ID_INSTNCIA_FLJO); commit;',
'    ',
'    if (not apex_collection.collection_exists(p_collection_name => ''RESPONSABLES'') ) then',
'        apex_collection.create_collection( p_collection_name => ''RESPONSABLES'');',
'    end if;',
'',
'',
'    select count(*)',
'    into v_total',
'    from gn_g_temporal',
'    where n001 =  :F_ID_INSTNCIA_FLJO',
'      and c023 = ''RESPONSABLE_NOVEDADES_PERSONA'';',
'',
'',
'    if v_total > 0 then',
'',
'      for c_rspnsble in (select * ',
'                         from gn_g_temporal a',
'                         where n001 =  :F_ID_INSTNCIA_FLJO',
'                              and c023 = ''RESPONSABLE_NOVEDADES_PERSONA''',
'                              and c004  not in (select c004 ',
'                                                from apex_collections    m',
'                                               where collection_name     = ''RESPONSABLES'' ',
'                                                 and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'',
'          apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                   , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                   , p_c001				=> c_rspnsble.c001',
'                                   , p_c002				=> c_rspnsble.c002',
'                                   , p_c003				=> c_rspnsble.c003',
'                                   , p_c004				=> c_rspnsble.c004',
'                                   , p_c005				=> c_rspnsble.c005',
'                                   , p_c006				=> c_rspnsble.c006',
'                                   , p_c007				=> c_rspnsble.c007',
'                                   , p_c008				=> c_rspnsble.c008',
'                                   , p_c009				=> c_rspnsble.c009',
'                                   , p_c010				=> c_rspnsble.c010',
'                                   , p_c011				=> c_rspnsble.c011',
'                                   , p_c012				=> c_rspnsble.c012',
'                                   , p_c013				=> c_rspnsble.c013',
'                                   , p_c014				=> c_rspnsble.c014',
'                                   , p_c015				=> c_rspnsble.c015',
'                                   , p_c016				=> c_rspnsble.c016',
'                                   , p_c017				=> c_rspnsble.c017',
'                                   , p_c018				=> c_rspnsble.c018',
'                                   , p_c019				=> c_rspnsble.c019',
'                                   , p_c020				=> c_rspnsble.c020',
'                                   , p_c021				=> c_rspnsble.c021',
'                                   , p_c022				=> c_rspnsble.c022);',
'      end loop;',
'    end if;',
'  ',
' /*',
'    for c_rspnsble in (select * ',
'                         from si_i_sujetos_responsable a',
'                        where id_sjto_impsto    = nvl(:P30_ID_SJTO_IMPSTO, :P29_ID_SJTO_IMPSTO)',
'                          and idntfccion        not in (select c004 ',
'                                                          from apex_collections    m',
'                                                         where collection_name     = ''RESPONSABLES'' ',
'                                                           and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'                        ',
'        apex_collection.add_member(p_collection_name 	=> ''RESPONSABLES''',
'                                 , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                 , p_c001				=> c_rspnsble.ID_SJTO_RSPNSBLE',
'                                 , p_c002				=> c_rspnsble.ID_SJTO_IMPSTO',
'                                 , p_c003				=> c_rspnsble.CDGO_IDNTFCCION_TPO',
'                                 , p_c004				=> c_rspnsble.IDNTFCCION',
'                                 , p_c005				=> c_rspnsble.PRMER_NMBRE',
'                                 , p_c006				=> c_rspnsble.SGNDO_NMBRE',
'                                 , p_c007				=> c_rspnsble.PRMER_APLLDO',
'                                 , p_c008				=> c_rspnsble.SGNDO_APLLDO',
'                                 , p_c009				=> c_rspnsble.PRNCPAL_S_N',
'                                 , p_c010				=> c_rspnsble.CDGO_TPO_RSPNSBLE',
'                                 , p_c011				=> c_rspnsble.PRCNTJE_PRTCPCION',
'                                 , p_c012				=> c_rspnsble.ORGEN_DCMNTO',
'                                 , p_c013				=> c_rspnsble.ID_PAIS_NTFCCION',
'                                 , p_c014				=> c_rspnsble.ID_DPRTMNTO_NTFCCION',
'                                 , p_c015				=> c_rspnsble.ID_MNCPIO_NTFCCION',
'                                 , p_c016				=> c_rspnsble.DRCCION_NTFCCION',
'                                 , p_c017				=> c_rspnsble.EMAIL',
'                                 , p_c018				=> c_rspnsble.TLFNO',
'                                 , p_c019				=> c_rspnsble.CLLAR',
'                                 , p_c020				=> c_rspnsble.ACTVO',
'                                 , p_c021				=> c_rspnsble.ID_TRCRO',
'                                 , p_c022				=> ''EXISTENTE'');',
'    end loop;  */',
'end;    '))
,p_process_error_message=>'#SQLERRM# #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152068478429490011)
,p_process_sequence=>80
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n de Sucursales')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_total number;',
'begin',
'   ',
'      insert into muerto(v_001,v_002) values(''Entro a coleccion SUCURSALES :F_ID_INSTNCIA_FLJO :'', :F_ID_INSTNCIA_FLJO); commit;',
' ',
' ',
'    if (not apex_collection.collection_exists(p_collection_name => ''SUCURSALES'') ) then',
'        apex_collection.create_collection( p_collection_name => ''SUCURSALES'');',
'    end if;',
'',
'    select count(*)',
'    into v_total',
'    from gn_g_temporal',
'    where n001 =  :F_ID_INSTNCIA_FLJO',
'      and c023 = ''SUCURSAL_NOVEDADES_PERSONA'';',
'',
'',
'    if v_total > 0 then',
'',
'      for c_scrsal in (select * ',
'                         from gn_g_temporal a',
'                         where n001 =  :F_ID_INSTNCIA_FLJO',
'                              and c023 = ''SUCURSAL_NOVEDADES_PERSONA''',
'                              and c004  not in (select c004 ',
'                                                from apex_collections    m',
'                                               where collection_name     = ''SUCURSALES'' ',
'                                                 and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop',
'',
'          apex_collection.add_member(p_collection_name 	=> ''SUCURSALES''',
'                                     , p_n001               => :F_ID_INSTNCIA_FLJO',
'                                     , p_c001				=> c_scrsal.c001',
'									 , p_c002				=> c_scrsal.c002',
'								--	 , p_c003				=> c_scrsal.PRNCPAL_S_N',
'									 , p_c004				=> c_scrsal.c004',
'									 , p_c005				=> c_scrsal.c005',
'									 , p_c006				=> c_scrsal.c006',
'									 , p_c007				=> c_scrsal.c007',
'									 , p_c008				=> c_scrsal.c008',
'									 , p_c009				=> c_scrsal.c009',
'									 , p_c010				=> c_scrsal.c010',
'									 , p_c011				=> c_scrsal.c011	  ',
'                                     , p_c012				=> c_scrsal.c012);',
'                                     ',
'      end loop;',
'    end if;',
'',
'end;    '))
,p_process_error_message=>'#SQLERRM# #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152068742616491080)
,p_process_sequence=>90
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n de Adjuntos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_total    number := 0;',
'',
'begin',
'',
'   insert into muerto(v_001,v_002) values(''Entro a coleccion ADJUNTOS_NOVEDADES_PERSONA :F_ID_INSTNCIA_FLJO :'', :F_ID_INSTNCIA_FLJO); commit;',
' ',
'    ',
'    if (not apex_collection.collection_exists(p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'') ) then',
'        apex_collection.create_collection( p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'');',
'    end if;',
'',
'    select count(*)',
'    into v_total',
'    from gn_g_temporal',
'    where n001 =  :F_ID_INSTNCIA_FLJO',
'        and c023 = ''ADJUNTOS_NOVEDADES_PERSONA'';',
'    ',
'    if v_total > 0 then',
'         for c_adjnto in (select * ',
'                         from gn_g_temporal a',
'                         where n001 =  :F_ID_INSTNCIA_FLJO',
'                                and c023 = ''ADJUNTOS_NOVEDADES_PERSONA''',
'                                and c004  not in (select c004 ',
'                                                    from apex_collections    m',
'                                                    where collection_name     = ''ADJUNTOS_NOVEDADES_PERSONA'' ',
'                                                       and m.n001              = :F_ID_INSTNCIA_FLJO) ) loop ',
'',
'             apex_collection.add_member( p_collection_name   => ''ADJUNTOS_NOVEDADES_PERSONA''',
'                                      , p_n001              => :F_ID_INSTNCIA_FLJO',
'                                      , p_n002              => c_adjnto.n002',
'                                      , p_c002              => c_adjnto.c002',
'                                      , p_c003              => c_adjnto.c003',
'                                      , p_blob001           => c_adjnto.blob001 );',
'            end loop;    ',
'    end if;',
'  ',
'end;    '))
,p_process_error_message=>'#SQLERRM# #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69679473162417504)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registro de Novedad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta                number;',
'    v_mnsje_rspsta               varchar2(1000);',
'    v_id_nvdad_prsona            number;',
'    v_id_instncia_trnscion       number; ',
'    v_id_sjto_impsto             number; ',
'    v_id_impsto_sbmpsto          number; ',
'    ',
'begin',
'',
'',
'      --insert into muerto2 (v_001, v_002, t_001) values (''registrar novedad P30_ID_SJTO_IMPSTO '',:P30_ID_SJTO_IMPSTO,SYSDATE); commit;',
'      --insert into muerto2 (v_001, v_002, t_001) values (''registrar novedad P28_ID_SJTO_IMPSTO '',:P28_ID_SJTO_IMPSTO,SYSDATE); commit;',
' ',
'     -- En calidad todo funciono, al pasar a produccion el P30_ID_SJTO_IMPSTO tomaba el valor de la observacion',
'     -- No se por donde lo hacia, por eso lo vuelvo a buscar dentro del proceso de registrar',
'        begin',
'            select id_instncia_trnscion',
'            into v_id_instncia_trnscion',
'            from wf_g_instancias_transicion',
'            where  id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'            and id_fljo_trea_orgen = :F_ID_FLJO_TREA; ',
'        exception',
'            when others then',
'               raise_application_error(-20003, ''Error al consultar la transicion de la instancia flujo : '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);   ',
'        end;',
'        ',
'',
'       begin',
'            select vlor',
'            into v_id_sjto_impsto ',
'            from wf_g_instancias_item_valor',
'            where  id_instncia_trnscion = v_id_instncia_trnscion',
'            and nmbre_item =  ''P30_ID_SJTO_IMPSTO'';',
'',
'            :P29_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'            :P34_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'            :P30_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'            :P28_ID_SJTO_IMPSTO := v_id_sjto_impsto;  ',
'        ',
'        exception',
'            when others then',
'               raise_application_error(-20003, ''Error al consultar el sujeto impuesto de la transicion de la instancia flujo : '' ||:F_ID_INSTNCIA_FLJO ||'' y del flujo tarea : ''|| :F_ID_FLJO_TREA);     ',
'        end;',
' ',
' ',
'    --insert into muerto2 (v_001, v_002, t_001) values (''Antes registrar novedad P30_ID_SJTO_IMPSTO '',:P30_ID_SJTO_IMPSTO,SYSDATE); commit;',
'    --insert into muerto2 (v_001, v_002, t_001) values (''Antes registrar novedad P28_ID_SJTO_IMPSTO '',:P28_ID_SJTO_IMPSTO,SYSDATE); commit;',
'',
'         ',
'    pkg_si_novedades_persona.prc_rg_novedad_persona(p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'                                                    p_ssion                 => :APP_SESSION,',
'									                p_id_impsto			    => nvl(:P30_ID_IMPSTO,:P28_ID_IMPSTO),',
'									                p_id_impsto_sbmpsto     => nvl(:P30_ID_IMPSTO_SBMPSTO,:P28_ID_IMPSTO_SBMPSTO),',
'									                p_id_sjto_impsto		=> nvl(:P30_ID_SJTO_IMPSTO,:P28_ID_SJTO_IMPSTO),',
'									                p_id_instncia_fljo	    => :F_ID_INSTNCIA_FLJO,',
'									                p_cdgo_nvdad_tpo		=> nvl(:P30_CDGO_NVDAD_TPO,:P28_CDGO_NVDAD_TPO),',
'									                p_obsrvcion			    => :P30_OBSRVCION,',
'									                p_id_usrio_rgstro		=> :F_ID_USRIO,',
'                                                     -- Datos de Inscripcion --',
'                                                    p_tpo_prsna				    => nvl(:P34_TPO_PRSNA,''N''),',
'                                                    p_cdgo_idntfccion_tpo		=> :P34_CDGO_IDNTFCCION_TPO,',
'                                                    p_idntfccion				=> :P34_IDNTFCCION,',
'                                                    p_prmer_nmbre				=> :P34_PRMER_NMBRE,',
'                                                    p_sgndo_nmbre				=> :P34_SGNDO_NMBRE,',
'                                                    p_prmer_aplldo			    => :P34_PRMER_APLLDO,',
'                                                    p_sgndo_aplldo			    => :P34_SGNDO_APLLDO,',
'                                                    p_nmbre_rzon_scial		    => :P34_NMBRE_RZON_SCIAL,',
'                                                    p_drccion					=> :P34_DRCCION,',
'                                                    p_id_dprtmnto				=> :P34_ID_DPRTMNTO,',
'                                                    p_id_mncpio				    => :P34_ID_MNCPIO,',
'                                                    p_drccion_ntfccion		    => :P34_DRCCION_NTFCCION,',
'                                                    p_id_dprtmnto_ntfccion	    => :P34_ID_DPRTMNTO_NTFCCION,',
'                                                    p_id_mncpio_ntfccion		=> :P34_ID_MNCPIO_NTFCCION,',
'                                                    p_email					    => :P34_EMAIL,',
'                                                    p_tlfno					    => :P34_TLFNO,',
'                                                    p_nmro_rgstro_cmra_cmrcio	=> :P34_NMRO_RGSTRO_CMRA_CMRCIO,',
'                                                    p_fcha_rgstro_cmra_cmrcio	=> :P34_FCHA_RGSTRO_CMRA_CMRCIO,',
'                                                    p_fcha_incio_actvddes	    => :P34_FCHA_INCIO_ACTVDDES,',
'                                                    p_nmro_scrsles			    => :P34_NMRO_SCRSLES,',
'                                                    p_drccion_cmra_cmrcio	    => :P34_DRCCION_CMRA_CMRCIO,',
'                                                    p_id_actvdad_ecnmca		    => :P34_ID_ACTVDAD_ECNMCA,',
'                                                    p_id_sjto_tpo			    => :P34_ID_SJTO_TPO,',
'									                o_id_nvdad_prsna		    => :P30_ID_NVDAD_PRSNA,',
'									                o_cdgo_rspsta			    => v_cdgo_rspsta,',
'									                o_mnsje_rspsta		        => :P30_RSPSTA);',
'                                                   ',
'                                                   :P29_OBSRVCION := null;',
'                                                   :P29_ID_NVDAD_PRSNA_ADJNTO_TPO := null;',
'',
'     if v_cdgo_rspsta <> 0 then ',
'        raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '','' || :P30_RSPSTA);   ',
'    end if;',
'    ',
'exception',
'    when others then ',
'        raise_application_error(-20003, ''Senor(a). '' || :F_NMBRE_USRIO || '','' || :P30_RSPSTA);  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69679355770417503)
,p_process_success_message=>'&P30_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(69794927352733801)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Novedad'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'                       ',
'declare',
'    v_cdgo_rspsta      number;',
'    v_id_nvdad_prsona  number;',
'    v_mnsje_rspsta     varchar2(1000);',
'    ',
'begin',
'    pkg_si_novedades_persona.prc_ap_novedad_persona(p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'									                p_id_nvdad_prsna		=> :P30_ID_NVDAD_PRSNA,',
'									                p_id_usrio        		=> :F_ID_USRIO,',
'									                o_cdgo_rspsta			=> v_cdgo_rspsta,',
'									                o_mnsje_rspsta		    => v_mnsje_rspsta);',
'',
'    :P29_OBSRVCION := null;',
'    :P29_ID_NVDAD_PRSNA_ADJNTO_TPO := null;',
'    ',
'    if v_cdgo_rspsta <> 0 then ',
'        raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '','' || v_mnsje_rspsta);  ',
'    else',
'        :P30_RSPSTA    := v_mnsje_rspsta;',
'    end if;',
'exception',
'    when others then ',
'        raise_application_error(-20003, ''Sr(a). '' || :F_NMBRE_USRIO || '','' || v_mnsje_rspsta);  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(69767590745157801)
,p_process_success_message=>'&P30_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(152072699115541101)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar colecciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if  apex_collection.collection_exists (p_collection_name => ''RESPONSABLES'') then',
'    apex_collection.delete_collection (p_collection_name => ''RESPONSABLES'');',
'end if;',
'if  apex_collection.collection_exists (p_collection_name => ''SUCURSALES'') then',
'    apex_collection.delete_collection (p_collection_name => ''SUCURSALES'');',
'end if;',
'if  apex_collection.collection_exists (p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'') then',
'    apex_collection.delete_collection (p_collection_name => ''ADJUNTOS_NOVEDADES_PERSONA'');',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
