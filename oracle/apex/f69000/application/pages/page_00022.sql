prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Gesti\00F3n de Novedades Predial')
,p_step_title=>unistr('Gesti\00F3n de Novedades Predial')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function iniciar_flujo(id_instancia) {',
'    var data = await apex.server.process("IniciarFlujo", { f01: id_instancia });',
'    ',
'    if (data.type === ''OK'') {',
'        window.localStorage.clear();',
'        window.location.href = data.url;',
'    } else {',
'        apex.message.showErrors({',
'            type: apex.message.TYPE.ERROR,',
'            location: ["page"],',
'            message: data.msg,',
'            unsafe: false',
'        });',
'    }',
'}'))
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_css_classes=>'parametroBusqueda2'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(88632095060928477)
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20201215145220'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48241913761623605)
,p_plug_name=>'Opciones '
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
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
 p_id=>wwv_flow_api.id(48242056525623606)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
' <b>',
'  <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> ',
' </b>',
'</h5>',
'<i>',
' Funcionalidad que permite:',
' Gestionar los flujos de Novedades Predial registrados.',
'</i> ',
'<br>',
'<br>',
unistr('<i><p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p></i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(48242232206623608)
,p_plug_name=>unistr('Gesti\00F3n de Novedades Predial')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select a.id_instncia_fljo',
'         , b.idntfccion_sjto_frmtda',
'         , a.dscrpcion_acto_tpo',
'         , a.dscrpcion_entdad_nvdad',
'         , a.nmro_dcmto_sprte',
'         , a.fcha_dcmnto_sprte',
'         , a.obsrvcion',
'         , a.fcha_incio_aplccion',
'         , a.fcha_rgstro',
'         , b.dscrpcion_nvdad_estdo',
'      from v_si_g_novedades_predio         a',
'      join v_si_g_novedades_predio_dtlle   b on a.id_nvdad_prdio = b.id_nvdad_prdio',
'     where a.cdgo_clnte                  = :F_CDGO_CLNTE    ',
'       and a.id_impsto                   = :P22_ID_IMPSTO',
'       and a.id_impsto_sbmpsto           = :P22_ID_IMPSTO_SBMPSTO',
'      and ((trunc(a.fcha_rgstro)        between :P22_FCHA_INCIAL      and :P22_FCHA_FNAL)',
'       or (trunc(a.fcha_rgstro) >= :P22_FCHA_INCIAL and :P22_FCHA_FNAL is null) ',
'       or (trunc(a.fcha_rgstro) <= :P22_FCHA_FNAL and :P22_FCHA_INCIAL  is null)',
'       or(:P22_FCHA_INCIAL is null and :P22_FCHA_FNAL is null ))',
'       and a.fcha_incio_aplccion         = nvl(:P22_FCHA_INCIO_APLCCION, a.fcha_incio_aplccion)',
'       and a.id_acto_tpo                 = nvl(:P22_ID_ACTO_TPO, a.id_acto_tpo)',
'       and a.id_entdad_nvdad             = nvl(:P22_ID_ENTDAD_NVDAD, a.id_entdad_nvdad)   ',
'       and b.idntfccion_sjto             = nvl(:P22_IDNTFCCION_SJTO, b.idntfccion_sjto );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48243758396623623)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'RIGHT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button onclick="iniciar_flujo(&ID_INSTNCIA_FLJO.)" style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton">Ir a flujo &ID_INSTNCIA_FLJO.',
'    <span class="fa fa-external-link-square"></span>',
'</button>'))
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(48243810954623624)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(48243907707623625)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(48244040646623626)
,p_name=>'DSCRPCION_ENTDAD_NVDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ENTDAD_NVDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entidad Novedad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(48244155185623627)
,p_name=>'NMRO_DCMTO_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_DCMTO_SPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Documento Soporte'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>15
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
 p_id=>wwv_flow_api.id(48244242004623628)
,p_name=>'FCHA_DCMNTO_SPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_DCMNTO_SPRTE'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Documento Soporte '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(48244373935623629)
,p_name=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSRVCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Observaci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>500
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
 p_id=>wwv_flow_api.id(48244470361623630)
,p_name=>'FCHA_INCIO_APLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_INCIO_APLCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Inicio Aplicaci\00F3n ')
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
 p_id=>wwv_flow_api.id(48244536715623631)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(48244682490623632)
,p_name=>'DSCRPCION_NVDAD_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_NVDAD_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(48243656761623622)
,p_internal_uid=>48243656761623622
,p_is_editable=>false
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
 p_id=>wwv_flow_api.id(48433268908439845)
,p_interactive_grid_id=>wwv_flow_api.id(48243656761623622)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(48433380685439845)
,p_report_id=>wwv_flow_api.id(48433268908439845)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48433845177439854)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(48243758396623623)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129.333
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48434269936439857)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(48243810954623624)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>226.111
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48434770327439859)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(48243907707623625)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>174
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48435294168439861)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(48244040646623626)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142.333
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48435729884439862)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(48244155185623627)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>158.889
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48436277608439863)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(48244242004623628)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48436766951439866)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(48244373935623629)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>331.889
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48437215107439867)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(48244470361623630)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48437733672439869)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(48244536715623631)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159.888916015625
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(48438223079439870)
,p_view_id=>wwv_flow_api.id(48433380685439845)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(48244682490623632)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142.6700954437256
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(154104759560938220)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48242147093623607)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(48241913761623605)
,p_button_name=>'Btn_Nuevo'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Novedad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=62000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_PRCSO:74'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(48410031512262417)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(154104759560938220)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48410468509262421)
,p_name=>'P22_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(154104759560938220)
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
,p_lov_null_text=>'Seleccione Tributo'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Tributo a consular de la lista.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48411321156262431)
,p_name=>'P22_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(154104759560938220)
,p_prompt=>'Sub-Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d',
'    , id_impsto_sbmpsto as r',
' from df_i_impuestos_subimpuesto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  and id_impsto  = :P22_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Sub-Impuesto'
,p_lov_cascade_parent_items=>'P22_ID_IMPSTO'
,p_ajax_items_to_submit=>'P22_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Sub-Tributo a consular de la lista.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48412245952262431)
,p_name=>'P22_ID_ACTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(154104759560938220)
,p_prompt=>'Tipo de Acto:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion, id_acto_tpo',
'from gn_d_actos_tipo',
'where cdgo_acto_tpo in (''ACD'',''ACE'',''ACU'')',
'and cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Tipo Acto'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione un Tipo de Acto a consular de la lista.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48413186347262432)
,p_name=>'P22_ID_ENTDAD_NVDAD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(154104759560938220)
,p_prompt=>'Entidad:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion',
'    , a.id_entdad_nvdad',
' from df_i_entidades_novedad a',
'where exists (',
'                   select 1',
'                     from df_i_entidades_nvdd_act_tpo b',
'                    where b.id_entdad_nvdad = a.id_entdad_nvdad',
'                      and b.id_acto_tpo     = :P22_ID_ACTO_TPO',
'             )'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione una Entidad'
,p_lov_cascade_parent_items=>'P22_ID_ACTO_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione una Entidad a consular de la lista.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48414061970262433)
,p_name=>'P22_FCHA_INCIO_APLCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(154104759560938220)
,p_prompt=>unistr('Fecha de Aplicaci\00F3n:')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione una fecha de aplicaci\00F3n a consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48414943832262434)
,p_name=>'P22_IDNTFCCION_SJTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(154104759560938220)
,p_prompt=>unistr('Identificaci\00F3n:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_tag_attributes=>' onkeypress="return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto a consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101411782831026801)
,p_name=>'P22_FCHA_INCIAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(154104759560938220)
,p_prompt=>'Fecha de Registo   Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione una fecha de aplicaci\00F3n a consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101411820290026802)
,p_name=>'P22_FCHA_FNAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(154104759560938220)
,p_prompt=>'Fecha de Registro Final:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88587919064834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione una fecha de aplicaci\00F3n a consultar.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48244848356623634)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    ',
'begin',
'    ',
'    apex_util.set_session_state(''F_BRANCH_PAGE'', :APP_PAGE_ID );',
'    apex_util.set_session_state(''F_BRANCH_APP'', :APP_ID );',
'    begin',
'        apex_json.initialize_output( p_http_cache => false );',
'        owa_util.mime_header(''application/json'', false);',
'        htp.p(''cache-control: no-cache'');',
'        htp.p(''pragma: no-cache'');',
'        owa_util.http_header_close;',
'        apex_json.open_object();  ',
'    ',
'    begin',
'    ',
'        select a.id_fljo_trea_orgen ',
'          into v_id_fljo_trea',
'          from wf_g_instancias_transicion a',
'         where a.id_instncia_fljo = v_id_instncia_fljo',
'           and a.id_estdo_trnscion in (1,2);',
'           ',
'    exception ',
'        when no_data_found then',
'              ',
'              begin                   ',
'                  select id_fljo_trea_orgen',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo',
'                   order by id_instncia_trnscion desc ',
'                   fetch first 1 rows only;',
'                   ',
'              exception ',
'                  when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea ); ',
'            ',
'            v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                          p_id_fljo_trea     => v_id_fljo_trea,',
'                                                          p_clear_session    => ''S'');',
'        ',
'            apex_json.write(''type'', ''OK'');',
'            apex_json.write(''msg'', ''Url generada exitosamente'');',
'            apex_json.write(''url'', v_url);',
'        ',
'        else',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'', ''No existe tarea destino'');',
'        ',
'        end if;',
'        apex_json.close_object();',
'    ',
'    exception when others then ',
'      apex_json.open_object();',
'      apex_json.write(''type'', ''OK'');',
'      apex_json.write(''msg'',apex_escape.html(sqlerrm));',
'      apex_json.close_object();',
'  end;',
'  ',
'  apex_json.close_all();',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
