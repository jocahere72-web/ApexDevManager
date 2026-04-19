prompt --application/pages/page_00047
begin
wwv_flow_api.create_page(
 p_id=>47
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Solicitudes de Acuerdo de Pago'
,p_step_title=>unistr('Gesti\00F3n de Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''BTN_APROBAR_ACUERDO'').hide();',
'apex.item(''BTN_RECHAZAR_ACUERDO'').hide();',
'apex.item(''BTN_APLICAR_ACUERDO'').hide();',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210503083818'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(50983120199826221)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51029460915160413)
,p_plug_name=>'Solicitudes de Acuerdo de Pago'
,p_region_name=>'solicitudes'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select distinct a.id_cnvnio,',
'           a.idntfccion_sjto_frmtda idntfccion_sjto,',
'           a.nmro_cnvnio,',
'           a.fcha_slctud,',
'           a.nmro_cta,',
'           a.fcha_prmra_cta,',
'           a.cdgo_cnvnio_estdo,',
'           a.dscrpcion_cnvnio_estdo,',
'           a.nmro_idntfccion_slctnte,',
'           a.nmbre_slctnte,',
'           1 Plan_pago,',
'           a.dscrpcion_cnvnio_tpo,',
'           upper(a.nmbre_impsto_sbmpsto) nmbre_impsto_sbmpsto,',
'           upper(a.nmbre_impsto) nmbre_impsto,',
'           a.id_instncia_fljo_hjo,',
'           204 id_rprte,',
'           ''PLAN_PAGO_''|| a.nmro_cnvnio nmbre_rprte,',
'           ''<P_ID_IMPSTO>''||a.id_impsto ||''</P_ID_IMPSTO><P_ID_CNVNIO>''||a.id_cnvnio ||''</P_ID_CNVNIO><P_ID_RPRTE>204</P_ID_RPRTE>'' pmtro_rprte,',
'           ''<id_slctud>''||a.id_slctud||''</id_slctud>'' prmtro_rdcdo,',
'           ''RADICADO_''|| a.nmro_cnvnio nmbre_rprte_rdcdo,',
'           212 id_rprte_rdcdo,',
'           1 rdcdos,',
'           a.nmro_acto',
'      from v_gf_g_convenios a',
'      join wf_g_instancias_transicion b on a.id_instncia_fljo_hjo = b.id_instncia_fljo ',
'                                       and (b.id_usrio = :F_ID_USRIO or :F_ID_USRIO in (select a.id_usrio',
'                                                                                          from v_sg_g_perfiles_usuario a',
'                                                                                          join sg_g_perfiles           b on a.id_prfil = b.id_prfil',
'                                                                                           and b.indcdor_prfil_admnstdor  = ''S''))',
'     where a.cdgo_clnte = :F_CDGO_CLNTE',
'       and a.cdgo_cnvnio_estdo in (''SLC'', ''APB'')',
'       and (a.id_impsto = :P47_ID_IMPSTO or :P47_ID_IMPSTO is null)',
'       and (a.id_impsto_sbmpsto = :P47_ID_IMPSTO_SBMPSTO or :P47_ID_IMPSTO_SBMPSTO is null)',
'       and (a.idntfccion_sjto = :P47_IDNTFCCION_SJTO or :P47_IDNTFCCION_SJTO is null) ',
'       and (a.nmro_cnvnio = :P47_NMRO_CNVNIO or :P47_NMRO_CNVNIO is null)',
'       and (a.id_cnvnio_tpo = :P47_ID_CNVNIO_TPO or :P47_ID_CNVNIO_TPO is null)',
'       and (a.cdgo_sjto_tpo = :P47_CDGO_SJTO_TPO or :P47_CDGO_SJTO_TPO is null)       ',
'       and (a.nmro_idntfccion_slctnte = :P47_IDNTFCCION_SLCTNTE or :P47_IDNTFCCION_SLCTNTE is null) ',
'       and (a.cdgo_cnvnio_estdo = :P47_ESTADO or :P47_ESTADO is null)                ',
'       and ((trunc(a.fcha_slctud) between :P47_FCHA_INCIO and :P47_FCHA_FNAL)',
'        or (trunc(a.fcha_slctud) >= :P47_FCHA_INCIO and :P47_FCHA_FNAL is null) ',
'        or (trunc(a.fcha_slctud) <= :P47_FCHA_FNAL and :P47_FCHA_INCIO  is null)',
'        or (:P47_FCHA_INCIO is null and :P47_FCHA_FNAL is null ))    '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3702582781753713)
,p_name=>'PRMTRO_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRMTRO_RDCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(3702642995753714)
,p_name=>'NMBRE_RPRTE_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE_RDCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(3702738655753715)
,p_name=>'ID_RPRTE_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE_RDCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(3702862383753716)
,p_name=>'RDCDO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_XML:&ID_RPRTE_RDCDO.,&NMBRE_RPRTE_RDCDO.,&PRMTRO_RDCDO.'
,p_link_text=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(11447532366976404)
,p_name=>'RDCDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RDCDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(47081702631846404)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(47081890843846405)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
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
 p_id=>wwv_flow_api.id(56880379465055018)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00B0 Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
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
 p_id=>wwv_flow_api.id(89186336060064911)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89186891700064916)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Acuerdo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(89186938249064917)
,p_name=>'FCHA_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_SLCTUD'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha <br>Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(89187011305064918)
,p_name=>'NMRO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Cuotas')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(89187109136064919)
,p_name=>'FCHA_PRMRA_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRMRA_CTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br> 1\00AA Cuota ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(89187260447064920)
,p_name=>'DSCRPCION_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89187366728064921)
,p_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_IDNTFCCION_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89187425318064922)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>404
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
 p_id=>wwv_flow_api.id(89187695931064924)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89187767571064925)
,p_name=>'PMTRO_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMTRO_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89187815752064926)
,p_name=>'PLAN_PAGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLAN_PAGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Plan Pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_XML,P2_PRMTRO_1:&ID_RPRTE.,&NMBRE_RPRTE.,&PMTRO_RPRTE.,&ID_CNVNIO.#ID_RPRTE#,#NMBRE_RPRTE#,#PRMTROS_RPRTE#'
,p_link_text=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(89188448087064932)
,p_name=>'DSCRPCION_CNVNIO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo <br> Acuerdo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(92985485075878301)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92985704525878304)
,p_name=>'Ver Acuerdo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-eye">&EMPLOYEE_STATUS.</span>'
,p_link_target=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP,54:P54_ID_CNVNIO,P54_ID_INSTNCIA_FLJO,P54_BRANCH:&ID_CNVNIO.,&ID_INSTNCIA_FLJO_HJO.,&APP_PAGE_ID.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(92985894290878305)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(93299553654039908)
,p_name=>'ID_INSTNCIA_FLJO_HJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_HJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94044857040727304)
,p_name=>'Selecrtor'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(94044994401727305)
,p_name=>'CDGO_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNVNIO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(89186211863064910)
,p_internal_uid=>89186211863064910
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
' config.initialSelection = false;',
' return config;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(89287285422827458)
,p_interactive_grid_id=>wwv_flow_api.id(89186211863064910)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(89287333023827458)
,p_report_id=>wwv_flow_api.id(89287285422827458)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6159628006604)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(47081702631846404)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>100
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6769924006611)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(47081890843846405)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>200
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(72372086019560)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(92985704525878304)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81383889179340)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(89188448087064932)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3747874980982968)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(3702582781753713)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3748331011982972)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(3702642995753714)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3748808529982973)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(3702738655753715)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3750750632986503)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(3702862383753716)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>175
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11453928306001555)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(11447532366976404)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(56939844863241789)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(56880379465055018)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89287884515827459)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(89186336060064911)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89290393363827467)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(89186891700064916)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89290833644827468)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(89186938249064917)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89291323302827469)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(89187011305064918)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89291810454827470)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(89187109136064919)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89292385447827471)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(89187260447064920)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89292884632827473)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(89187366728064921)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89293362053827474)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(89187425318064922)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89294319645827476)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(89187695931064924)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89294894230827477)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(89187767571064925)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(89295341630827478)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(89187815752064926)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(92991459860880700)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(92985485075878301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93185457170101295)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(92985894290878305)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>264
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93458169747573670)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(93299553654039908)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94061913572816383)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(94044994401727305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(74618000001)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_execution_seq=>5
,p_name=>'Rechazado'
,p_background_color=>'#FFD4D4'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(89187260447064920)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Rechazado'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(411498009617)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_execution_seq=>10
,p_name=>'Solicitud'
,p_background_color=>'#F9FFC9'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(89187260447064920)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Solicitud'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(582500013004)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_execution_seq=>15
,p_name=>'Aplicado'
,p_background_color=>'#DCFAD5'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(89187260447064920)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Aplicado'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(821272020433)
,p_view_id=>wwv_flow_api.id(89287333023827458)
,p_execution_seq=>20
,p_name=>'Aprobado'
,p_background_color=>'#C7D6F5'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(89187260447064920)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Aprobado'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(95020712726589781)
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
 p_id=>wwv_flow_api.id(141094587841298217)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Funcionalidad que permite<br><br>',
'    <b>1.</b> Consultar las solicitudes de acuerdos de pago a las que no se les ha dado respuesta.<br><br>',
'    <b>2.</b> Descargar el plan de pago.<br><br>',
'    <b>3.</b> Descargar el radicado de la solicitud.<br><br>',
'    <b>4.</b> Ver el detalle de cada solictud de acuerdo de pago y aprobar, aplicar o rechazar la misma.<br><br>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94045012029727306)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(95020712726589781)
,p_button_name=>'BTN_APROBAR_ACUERDO'
,p_button_static_id=>'BTN_APROBAR_ACUERDO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar Acuerdo(s)'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Aprobar los Acuerdo(s) de Pago Seleccionado(s)?'',''BTN_APROBAR_ACUERDO'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95267729405573820)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(95020712726589781)
,p_button_name=>'BTN_APLICAR_ACUERDO'
,p_button_static_id=>'BTN_APLICAR_ACUERDO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Acuerdo(s)'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Aplicar los Acuerdo(s) de Pago Seleccionado(s)?'',''BTN_APLICAR_ACUERDO'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95033231292393804)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(95020712726589781)
,p_button_name=>'BTN_RECHAZAR_ACUERDO'
,p_button_static_id=>'BTN_RECHAZAR_ACUERDO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Rechazar Acuerdo(s)'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Rechazar los Acuerdo(s) de Pago Seleccionado(s)?'',''BTN_RECHAZAR_ACUERDO'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32846718977497810)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(95020712726589781)
,p_button_name=>'BTN_CNSLTAR_FLJO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Flujos Asociados'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-external-link-square'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(50983623692826226)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(50983120199826221)
,p_button_name=>'BTN_BUSCAR'
,p_button_static_id=>'BTN_BUSCAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95160155845915002)
,p_branch_name=>'Ir  Rechazo Masivo'
,p_branch_action=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49:P49_BRANCH:&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(95033231292393804)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(95267985406573822)
,p_branch_name=>'Ir a Aplicar Masivo'
,p_branch_action=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP,74:P74_BRANCH:&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(95267729405573820)
,p_branch_sequence=>30
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(32846872552497811)
,p_branch_name=>'Ir a Consulta Flujo'
,p_branch_action=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.:RP,149:P149_APP,P149_PAGE:&APP_ID.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(32846718977497810)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26645015403003102)
,p_name=>'P47_NMRO_CNVNIO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_prompt=>unistr('N\00B0 Acuerdo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_cMaxlength=>12
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Dig\00EDte el n\00FAmero de acuerdo de pago para detallarlo.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47153336689556508)
,p_name=>'P47_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_prompt=>'Tributo'
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
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tributo por el que elabor\00F3 el acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47153455170556509)
,p_name=>'P47_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_prompt=>'Sub Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P47_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P47_ID_IMPSTO'
,p_ajax_items_to_submit=>'P47_ID_IMPSTO_SBMPSTO,P47_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el sub tributo por el que elabor\00F3 el acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50983227846826222)
,p_name=>'P47_ID_CNVNIO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_prompt=>'Tipo de Acuerdo de Pago'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de acuerdo de pago con el que registr\00F3 la solicitud.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50983395164826223)
,p_name=>'P47_CDGO_SJTO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_prompt=>'Tipo Sujeto'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TPO_SJTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_sjto_tpo as d, ',
'       cdgo_sjto_tpo as r ',
'  from df_s_sujetos_tipo',
'order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de sujeto sobre el que registr\00F3 la solicitud de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50983466281826224)
,p_name=>'P47_FCHA_INCIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select to_date (''01/'' || extract(MONTH from sysdate) || ''/'' || extract(year from sysdate)) fcha_incio',
'    from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Incio - Solicitud'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>22
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente  al registro de la solicitud de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50983533088826225)
,p_name=>'P47_FCHA_FNAL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select LAST_DAY(SYSDATE)',
'   from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Final - Solicitud'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>22
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente  al registro de la solicitud de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50983719468826227)
,p_name=>'P47_IDNTFCCION_SJTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realiz\00F3 la solicitud de acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(72785633013872802)
,p_name=>'P47_ESTADO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_prompt=>'Estado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ESTADO_CONVENIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(dscrpcion) as d,',
'       cdgo_cnvnio_estdo as r',
'  from gf_d_convenios_estado',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el estado en que se encuentra el o los acuerdos de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75438115599168111)
,p_name=>'P47_IDNTFCCION_SLCTNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(50983120199826221)
,p_prompt=>unistr('Identificaci\00F3n Solicitante')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del solicitante al que se le realiz\00F3 la solicitud de acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83240852317429602)
,p_name=>'P47_RSPTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51029460915160413)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(94044705518727303)
,p_name=>'P47_CNVNIOS_APRBDOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(51029460915160413)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111251215797782302)
,p_name=>'P47_ERROR_APRBAR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(51029460915160413)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95160704851915008)
,p_validation_name=>'Solicitudes Seleccionadas'
,p_validation_sequence=>10
,p_validation=>'P47_CNVNIOS_APRBDOS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe Seleccionar una o mas Solicitudes de Acuerdos de Pago.'
,p_validation_condition=>'BTN_APROBAR_ACUERDO,BTN_RECHAZAR_ACUERDO,BTN_APLICAR_ACUERDO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(111251186261782301)
,p_validation_name=>unistr('Validar Aprobaci\00F3n y Aplicaci\00F3n Acuerdos')
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_cdna      clob:= null;',
'begin',
'',
'    for c_convenios in (select count(*) nmro_ctas, nmro_cnvnio',
'                         from v_gf_g_convenios_extracto a',
'                         join (select id_cnvnio',
'                                 from json_table(:P47_CNVNIOS_APRBDOS,''$[*]''columns id_cnvnio path ''$.ID_CNVNIO'')',
'                                ) b on a.id_cnvnio = b.id_cnvnio',
'                        where nmro_cta = 1  ',
'                          and estdo_cta = ''VENCIDA''',
'                        group by nmro_cnvnio',
'                        ) loop',
'                      ',
'        if  c_convenios.nmro_ctas > 0 then',
'            v_cdna := c_convenios.nmro_cnvnio || '', '' || v_cdna;',
'        end if;',
'         ',
'    end loop;',
'    if v_cdna is not null then',
'        v_cdna := substr(v_cdna,1,length(v_cdna)-2); ',
'        :P47_ERROR_APRBAR := ''Acuerdo(s) de Pago No. '' ||v_cdna||'' con fecha vencida'';',
'        return false;',
'    else',
'        return true;',
'    end if;     ',
'    ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'&P47_ERROR_APRBAR.'
,p_validation_condition=>'BTN_APROBAR_ACUERDO,BTN_RECHAZAR_ACUERDO,BTN_APLICAR_ACUERDO'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94044583327727301)
,p_name=>'Al seleccionar un registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(51029460915160413)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94044612055727302)
,p_event_id=>wwv_flow_api.id(94044583327727301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var records = this.data.selectedRecords;',
'apex.item(''BTN_APROBAR_ACUERDO'').hide();',
'apex.item(''BTN_RECHAZAR_ACUERDO'').hide();',
'apex.item(''BTN_APLICAR_ACUERDO'').hide();',
'',
'if(records.length > 0){',
'    var model = this.data.model;',
'    // crea un array de objetos de estados y luego trae otro sin objetos iguales',
'    var estados = records.map(function(record){',
'        return model.getValue(record, ''CDGO_CNVNIO_ESTDO'');',
'    }).filter( function (obj, pos, record){',
'        return (record.indexOf(obj) === pos)',
'    });',
'    // valida que exista un unico estado seleccionado',
'    if(estados.length === 1){        ',
'        records = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_ESTDO'') == ''SLC'' || model.getValue(record, ''CDGO_CNVNIO_ESTDO'') == ''APB'')',
'        });',
'',
'        var json = records.map(function (record){',
'            return {''ID_CNVNIO'': model.getValue(record, ''ID_CNVNIO'')};',
'        });',
'        ',
'        // valida que existan revocatorias en estado registrado',
'        var registrados = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_ESTDO'') == ''SLC'');',
'        });',
'        ',
'         // valida que existan revocatorias en estado aplicado',
'        var aprobados = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_ESTDO'') == ''APB'');',
'        });',
'        ',
'        // valida si hay registros seleccionados',
'        if(json.length > 0){   ',
'            $s(''P47_CNVNIOS_APRBDOS'', JSON.stringify(json));',
'            if (registrados.length > 0){',
'                apex.item(''BTN_APROBAR_ACUERDO'').show();',
'                apex.item(''BTN_RECHAZAR_ACUERDO'').show();',
'            }',
'            if(aprobados.length > 0) {',
'                apex.item(''BTN_RECHAZAR_ACUERDO'').show();',
'                apex.item(''BTN_APLICAR_ACUERDO'').show();',
'            }',
'        }',
'    }',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96521205523829313)
,p_name=>'cerrar modal'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96521343322829314)
,p_event_id=>wwv_flow_api.id(96521205523829313)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(51029460915160413)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94045138352727307)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar Acuerdos de Pagos Masivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_rspsta     number;',
'    ',
'begin',
'    pkg_gf_convenios.prc_ap_aprobar_acrdo_pgo_msvo (p_cdgo_clnte	=> :F_CDGO_CLNTE,',
'											        p_cdna_cnvnio   => :P47_CNVNIOS_APRBDOS,',
'                                                    p_id_usrio      => :F_ID_USRIO,',
'											        o_cdgo_rspsta	=> v_cdgo_rspsta,',
'											        o_mnsje_rspsta	=> :P47_RSPTA);',
'    if (v_cdgo_rspsta != 0) then',
'        raise_application_error(-20001, :P47_RSPTA);',
'    end if;',
'end;',
''))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94045012029727306)
,p_process_success_message=>'&P47_RSPTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4312476497604502)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Acuerdos de Pagos Masivos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  declare',
'      v_cdgo_rspsta     number;',
'      v_id_plntlla    number;',
'',
'  begin',
'      ',
'    /*  begin ',
'          select a.id_plntlla',
'             into v_id_plntlla',
'            from gn_d_plantillas a',
'            join gn_d_reportes b',
'              on a.id_rprte = b.id_rprte',
'           where a.cdgo_clnte = :F_CDGO_CLNTE',
'            and a.id_prcso in (select id_prcso',
'                                 from df_s_procesos ',
'                                where id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente (:F_CDGO_CLNTE, ''ACP'', ''APL''));',
'    exception',
'        when others then ',
unistr('        :P47_RSPTA    := ''No se encontro plantilla parametrizada para la aplicaci\00F3n de acuerdo de pago'';'),
'    end;',
'    */',
'    pkg_gf_convenios.prc_ap_aplicar_acrdo_pgo_msvo (p_cdgo_clnte      =>  :F_CDGO_CLNTE,',
'                                                    p_cdna_cnvnio    =>  :P47_CNVNIOS_APRBDOS,',
'                                                    p_id_usrio       =>  :F_ID_USRIO,                                       ',
'                                                    p_id_plntlla     =>  225,--v_id_plntlla,  SE CONSULTA DENTRO DE LA UP YA QUE DEPENDE DEL TIPO DE CONVENIO A APLICAR',
'                                                    o_cdgo_rspsta    =>  v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta   =>  :P47_RSPTA);',
'',
'  end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(95267729405573820)
,p_process_success_message=>'&P47_RSPTA.'
);
end;
/
