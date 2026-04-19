prompt --application/pages/page_00234
begin
wwv_flow_api.create_page(
 p_id=>234
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Consulta de Acuerdo de Pago'
,p_step_title=>'Consulta de Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20210611160858'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55005442222051353)
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
 p_id=>wwv_flow_api.id(55051782937385545)
,p_plug_name=>'Solicitudes de Acuerdo de Pago'
,p_region_name=>'solicitudes'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  ',
'    select distinct a.id_cnvnio,',
'           a.idntfccion_sjto_frmtda idntfccion_sjto,',
'           a.nmro_cnvnio,',
'           a.fcha_slctud,',
'           a.nmro_cta,',
'           a.fcha_prmra_cta,',
'           a.ttal_cnvnio,',
'           a.cdgo_cnvnio_estdo,',
'           a.dscrpcion_cnvnio_estdo,',
'           a.nmro_idntfccion_slctnte,',
'           a.nmbre_slctnte,',
'           1 Plan_pago,',
'           a.dscrpcion_cnvnio_tpo,',
'           a.nmbre_impsto_sbmpsto,',
'           a.nmbre_impsto,',
'           a.id_instncia_fljo_hjo,',
'           204 id_rprte,',
'           ''PLAN_PAGO_''|| a.nmro_cnvnio nmbre_rprte,',
'           ''<P_ID_IMPSTO>''||a.id_impsto ||''</P_ID_IMPSTO><P_ID_CNVNIO>''||a.id_cnvnio ||''</P_ID_CNVNIO><P_ID_RPRTE>204</P_ID_RPRTE>'' pmtro_rprte,',
'           ''<id_slctud>''||a.id_slctud||''</id_slctud>'' prmtro_rdcdo,',
'           ''RADICADO_''|| a.nmro_cnvnio nmbre_rprte_rdcdo,',
'           212 id_rprte_rdcdo,',
'           1 rprte_rdcdo,',
'           sum(decode(c.estdo_cta, ''PAGADA'', 1, 0)) pagada,',
'           sum(decode(c.estdo_cta, ''VENCIDA'', 1, 0)) vencida,',
'           sum(decode(c.estdo_cta, ''ADEUDADA'', 1, 0)) adeudada ,',
'           sum(decode(c.estdo_cta, ''PAGADA'', c.vlor_ttal, 0)) vlor_pgdo,',
'                (select sum(d.vlor_dbe)',
'                   from gf_g_movimientos_financiero f',
'                   join gf_g_movimientos_detalle d',
'                     on d.id_mvmnto_fncro = f.id_mvmnto_fncro',
'                   join gf_g_convenios_cartera c',
'                     on c.id_cnvnio = a.id_cnvnio',
'                    and c.vgncia = d.vgncia',
'                    and c.id_prdo = d.id_prdo',
'                    and c.id_cncpto = d.id_cncpto',
'                    and d.cdgo_mvmnto_orgn = ''LQ''',
'                  where f.id_sjto_impsto = a.id_sjto_impsto) -',
'                a.ttal_cnvnio pago_inicial',
'      from v_gf_g_convenios a',
'       join v_gf_g_convenios_extracto c  on c.id_cnvnio = a.id_cnvnio and c.actvo = ''S''',
'     where a.CDGO_CLNTE                  = :F_CDGO_CLNTE    ',
'       and (a.id_impsto                  = :P234_ID_IMPSTO             )',
'       and (a.id_impsto_sbmpsto          = :P234_ID_IMPSTO_SBMPSTO     or :P234_ID_IMPSTO_SBMPSTO     is null)',
'       and (a.id_cnvnio_tpo              = :P234_ID_CNVNIO_TPO         or :P234_ID_CNVNIO_TPO         is null)',
'       and (a.cdgo_sjto_tpo              = :P234_CDGO_SJTO_TPO         or :P234_CDGO_SJTO_TPO         is null)',
'       and (a.idntfccion_sjto            = :P234_IDNTFCCION_SJTO       or :P234_IDNTFCCION_SJTO       is null) ',
'       and (a.nmro_idntfccion_slctnte    = :P234_IDNTFCCION_SLCTNTE    or :P234_IDNTFCCION_SLCTNTE    is null) ',
'       and (a.cdgo_cnvnio_estdo          = :P234_ESTADO                or :P234_ESTADO                is null)  ',
'       and (a.nmro_cnvnio              = :P234_NMRO_CNVNIO           or :P234_NMRO_CNVNIO           is null)              ',
'      and ((trunc(a.fcha_slctud)    between :P234_FCHA_INCIO and :P234_FCHA_FNAL)',
'       or (trunc(a.fcha_slctud) >= :P234_FCHA_INCIO and :P234_FCHA_FNAL is null) ',
'       or (trunc(a.fcha_slctud) <= :P234_FCHA_FNAL and :P234_FCHA_INCIO  is null)',
'       or(:P234_FCHA_INCIO is null and :P234_FCHA_FNAL is null ))',
'   GROUP BY a.id_cnvnio,',
'          a.idntfccion_sjto_frmtda,',
'          a.nmro_cnvnio,',
'          a.fcha_slctud,',
'          a.nmro_cta,',
'          a.fcha_prmra_cta,',
'          a.cdgo_cnvnio_estdo,',
'          a.dscrpcion_cnvnio_estdo,',
'          a.nmro_idntfccion_slctnte,',
'          a.nmbre_slctnte,',
'          a.dscrpcion_cnvnio_tpo,',
'          a.nmbre_impsto_sbmpsto,',
'          a.nmbre_impsto,',
'          a.id_instncia_fljo_hjo,',
'          a.id_impsto,',
'          a.ttal_cnvnio,',
'          a.id_slctud,',
'          a.id_sjto_impsto',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4043547406227203)
,p_name=>'RPRTE_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RPRTE_RDCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
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
 p_id=>wwv_flow_api.id(7724904803978845)
,p_name=>'PRMTRO_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRMTRO_RDCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
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
 p_id=>wwv_flow_api.id(7724965017978846)
,p_name=>'NMBRE_RPRTE_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE_RDCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
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
 p_id=>wwv_flow_api.id(7725060677978847)
,p_name=>'ID_RPRTE_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE_RDCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(7725184405978848)
,p_name=>'RDCDO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_XML:&ID_RPRTE_RDCDO.,&NMBRE_RPRTE_RDCDO.,&PRMTRO_RDCDO.'
,p_link_text=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(49244681118622701)
,p_name=>'PAGADA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGADA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Pagada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(49244766734622702)
,p_name=>'VENCIDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VENCIDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vencida'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(49244816051622703)
,p_name=>'ADEUDADA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADEUDADA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Adeudada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(49244900966622704)
,p_name=>'TTAL_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTAL_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor<br>Convenio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(62643953267304701)
,p_name=>'VLOR_PGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_PGDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor<br>Pagado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(62644050222304702)
,p_name=>'PAGO_INICIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAGO_INICIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Pago<br>Inicial'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(93208658082290043)
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
 p_id=>wwv_flow_api.id(93209213722290048)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 Acuerdo <br> de Pago')
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
 p_id=>wwv_flow_api.id(93209260271290049)
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
 p_id=>wwv_flow_api.id(93209333327290050)
,p_name=>'NMRO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0 <br>Cuotas')
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
 p_id=>wwv_flow_api.id(93209431158290051)
,p_name=>'FCHA_PRMRA_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PRMRA_CTA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br> 1\00AA Cuota ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(93209582469290052)
,p_name=>'DSCRPCION_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(93209688750290053)
,p_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_IDNTFCCION_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br>Solicitante')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(93209747340290054)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93210017953290056)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(93210089593290057)
,p_name=>'PMTRO_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMTRO_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(93210137774290058)
,p_name=>'PLAN_PAGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLAN_PAGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Plan Pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(93210770109290064)
,p_name=>'DSCRPCION_CNVNIO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo <br> Acuerdo de Pago'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97007807098103433)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(97008026548103436)
,p_name=>'Ver Acuerdo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-eye">&EMPLOYEE_STATUS.</span>'
,p_link_target=>'f?p=&APP_ID.:283:&SESSION.::&DEBUG.:RP,283:P283_ID_CNVNIO,P283_ID_INSTNCIA_FLJO,P283_BRANCH:&ID_CNVNIO.,&ID_INSTNCIA_FLJO_HJO.,&APP_PAGE_ID.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97008216313103437)
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
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(97321875676265040)
,p_name=>'ID_INSTNCIA_FLJO_HJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_HJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98067316423952437)
,p_name=>'CDGO_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNVNIO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(123379252031119653)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
 p_id=>wwv_flow_api.id(123379382215119654)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(93208533885290042)
,p_internal_uid=>93208533885290042
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
 p_id=>wwv_flow_api.id(93309607445052590)
,p_interactive_grid_id=>wwv_flow_api.id(93208533885290042)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(93309655046052590)
,p_report_id=>wwv_flow_api.id(93309607445052590)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2461716012407)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(49244900966622704)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10779449115348)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(62643953267304701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(11358139115352)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(62644050222304702)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4051231907237343)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(4043547406227203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4094694108244692)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(97008026548103436)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4103705911404472)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(93210770109290064)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>254
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7770197003208100)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(7724904803978845)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7770653034208104)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(7724965017978846)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7771130552208105)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(7725060677978847)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7773072655211635)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(7725184405978848)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49250847754622953)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(49244681118622701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49251543275622957)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(49244766734622702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(49252270589622960)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(49244816051622703)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93310206538052591)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(93208658082290043)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93312715386052599)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(93209213722290048)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93313155667052600)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(93209260271290049)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93313645325052601)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(93209333327290050)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93314132477052602)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(93209431158290051)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93314707470052603)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(93209582469290052)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93315206655052605)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(93209688750290053)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93315684076052606)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(93209747340290054)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93316641668052608)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(93210017953290056)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93317216253052609)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(93210089593290057)
,p_is_visible=>true
,p_is_frozen=>false
);
end;
/
begin
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(93317663653052610)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(93210137774290058)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97013781883105832)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(97007807098103433)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97207779192326427)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(97008216313103437)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97480491769798802)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(97321875676265040)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98084235595041515)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(98067316423952437)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123464949578213308)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(123379252031119653)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>100
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(123465551498213311)
,p_view_id=>wwv_flow_api.id(93309655046052590)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(123379382215119654)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>178
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(145116909863523349)
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
'Esta funcionalidad permite<br><br>',
'    <b>1.</b> Consultar las solicitudes de acuerdo de pago <br><br>',
'    <b>2.</b> Descargar el plan de pago.<br><br>',
'    <b>3.</b> Descargar radicado de PQR.<br><br>',
'    <b>4.</b> Ver el detalle de cada solictud de acuerdo de pago.<br><br>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4022936837225137)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(55005442222051353)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3003062584605417)
,p_name=>'P234_NMRO_CNVNIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>unistr('<b>N\00B0 Acuerdo de Pago</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la n\00FAmero del Acuerdo de Pago que desea consultar.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4023379925225139)
,p_name=>'P234_ID_CNVNIO_TPO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>'<b>Tipo de Acuerdo de Pago</b>'
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
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de acuerdo de pago con el que registr\00F3 la solicitud.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4023727937225142)
,p_name=>'P234_CDGO_SJTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>'<b>Tipo Sujeto</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TPO_SJTO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_sjto_tpo as d, ',
'       cdgo_sjto_tpo as r ',
'  from df_s_sujetos_tipo',
'order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de sujeto sobre el que registr\00F3 la solicitud de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4024125677225142)
,p_name=>'P234_IDNTFCCION_SJTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>unistr('<b>Identificaci\00F3n Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>5
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realiz\00F3 la solicitud de acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4024513117225142)
,p_name=>'P234_IDNTFCCION_SLCTNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>unistr('<b>Identificaci\00F3n Solicitante</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"onkeypress="return validarExpresion(event, ''letraNumero'');"'
,p_begin_on_new_line=>'N'
,p_grid_column=>3
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del solicitante al que se le realiz\00F3 la solicitud de acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4024980195225143)
,p_name=>'P234_ESTADO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>'<b>Estado</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ESTADO_CONVENIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(dscrpcion) as d,',
'       cdgo_cnvnio_estdo as r',
'  from gf_d_convenios_estado',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>11
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el estado en que se encuentra el o los acuerdos de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4025361214225143)
,p_name=>'P234_FCHA_INCIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>'<b>Fecha Incio - Solicitud</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>22
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente  al registro de la solicitud de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4025737227225143)
,p_name=>'P234_FCHA_FNAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select LAST_DAY(SYSDATE)',
'   from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'<b>Fecha Final - Solicitud</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>22
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_grid_column=>11
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente  al registro de la solicitud de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47152718210556502)
,p_name=>'P234_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>'<b> Tributo </b> '
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
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tributo del que desea consultar acuerdos de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47152844686556503)
,p_name=>'P234_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(55005442222051353)
,p_prompt=>'<b> Sub Tributo </b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P234_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P234_ID_IMPSTO'
,p_ajax_items_to_submit=>'P234_ID_IMPSTO_SBMPSTO,P234_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Sub Tributo del que desea consultar acuerdos de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4040748601225189)
,p_name=>'Al seleccionar un registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(55051782937385545)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4041282479225190)
,p_event_id=>wwv_flow_api.id(4040748601225189)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//AprobarConvenios();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4041695137225190)
,p_name=>'cerrar modal'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4042143831225191)
,p_event_id=>wwv_flow_api.id(4041695137225190)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(55051782937385545)
,p_stop_execution_on_error=>'Y'
);
end;
/
