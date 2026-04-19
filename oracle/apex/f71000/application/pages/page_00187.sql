prompt --application/pages/page_00187
begin
wwv_flow_api.create_page(
 p_id=>187
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n de Modificaci\00F3n de Acuerdos de Pago')
,p_step_title=>unistr('Gesti\00F3n de Modificaci\00F3n de Acuerdos de Pago')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*function obtenerConvenioModificacion() { ',
'    var convenios = [], region_mdfccion = apex.region("modificacion"); ',
'    if (region_mdfccion) {',
'        var view = region_mdfccion.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if ($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                convenios.push({"ID_CNVNIO_MDFCCION":model.getValue(records[i], "ID_CNVNIO_MDFCCION").trim()});',
'            }',
'             $s("P187_ID_CNVNIO_MDFCCION",JSON.stringify(convenios));',
'        }else{',
'            $s("P187_ID_CNVNIO_MDFCCION", null);',
'        }      ',
'   }    ',
'}*/',
'function irFlujo(id_instancia){',
'    apex.server.process("IniciarFlujo", {f01: id_instancia}).then(function(data){',
'        if (data.type === ''OK'') {',
'            window.localStorage.clear();',
'            window.location.href = data.url;',
'        }else{',
'            apex.message.showErrors({',
'                type: apex.message.TYPE.ERROR,',
'                location: ["page"],',
'                message: data.msg,',
'                unsafe: false',
'            });',
'        }',
'    }); ',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''BTN_APROBAR_ACUERDO'').hide();',
'apex.item(''BTN_APLICAR_ACUERDO'').hide();',
'apex.item(''BTN_RECHAZAR_ACUERDO'').hide();'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191211114624'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(158500279300735927)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(158550566293078318)
,p_plug_name=>'Solicitudes de Acuerdo de Pago'
,p_region_name=>'modificacion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select distinct a.id_cnvnio,',
'           a.idntfccion_sjto_frmtda idntfccion_sjto,',
'           a.nmro_cnvnio,',
'           a.fcha_rgstro,',
'           a.cdgo_cnvnio_mdfccion_estdo,',
'           a.dscrpcn_cnvnio_mdfccion_estdo,',
'           a.nmro_idntfccion_slctnte,',
'           a.nmbre_slctnte,  ',
'           a.dscrpcion_cnvnio_mdfccion_tpo,',
'           a.id_cnvnio_mdfccion,',
'           a.nmbre_impsto,',
'           a.nmbre_impsto_sbmpsto,',
'           a.id_instncia_fljo_hjo,',
'           ''ACT_MOD_''||a.nmro_cnvnio nmbre_rprte,           ',
'           ''<data><id_acto>''||a.id_acto||''</id_acto>',
'                   <id_cnvnio>''||a.id_cnvnio||''</id_cnvnio>',
'                   <cod_clnte>''||a.cdgo_clnte||''</cod_clnte>',
'                   <p_id_rprte>''||c.id_rprte||''</p_id_rprte>',
'                   <id_plntlla>''||c.id_plntlla||''</id_plntlla></data>'' pmtro_rprte,',
'           c.id_rprte,       ',
'           1 acto',
'      from v_gf_g_convenios_modificacion a',
'      join wf_g_instancias_transicion b on a.id_instncia_fljo_hjo = b.id_instncia_fljo ',
'                                       and b.id_usrio = :F_ID_USRIO',
' left join gf_g_convenios_documentos c on a.id_cnvnio = c.id_cnvnio and a.id_acto = c.id_acto        ',
'     where a.CDGO_CLNTE = :F_CDGO_CLNTE',
'       and (a.idntfccion_sjto = :P187_IDNTFCCION_SJTO or :P187_IDNTFCCION_SJTO is null) ',
'       and (a.nmro_idntfccion_slctnte = :P187_IDNTFCCION_SLCTNTE or :P187_IDNTFCCION_SLCTNTE is null) ',
'       and (a.cdgo_cnvnio_mdfccion_estdo = :P187_CDGO_MDFCCION_ESTDO or :P187_CDGO_MDFCCION_ESTDO is null)                ',
'       and ((trunc(a.fcha_rgstro) between :P187_FCHA_INCIO and :P187_FCHA_FNAL)',
'       or (trunc(a.fcha_rgstro) >= :P187_FCHA_INCIO and :P187_FCHA_FNAL is null) ',
'       or (trunc(a.fcha_rgstro) <= :P187_FCHA_FNAL and :P187_FCHA_INCIO  is null)',
'       or(:P187_FCHA_INCIO is null and :P187_FCHA_FNAL is null))   '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(107535053834029301)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(107535399318029304)
,p_name=>'CDGO_CNVNIO_MDFCCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNVNIO_MDFCCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(107535409156029305)
,p_name=>'DSCRPCN_CNVNIO_MDFCCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCN_CNVNIO_MDFCCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(107535585012029306)
,p_name=>'DSCRPCION_CNVNIO_MDFCCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_MDFCCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Tipo<br>Modificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>1000
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
 p_id=>wwv_flow_api.id(108014373339807104)
,p_name=>'ID_CNVNIO_MDFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO_MDFCCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
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
 p_id=>wwv_flow_api.id(113287578186330936)
,p_name=>'Ver Acuerdo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver <br> Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#" onclick="irFlujo(&ID_INSTNCIA_FLJO_HJO.)" style="color:blue" >',
'    <span class="fa fa-eye"></span>',
'</a>'))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(119358182931894533)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
 p_id=>wwv_flow_api.id(119358243407894534)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(120619503355139104)
,p_name=>'ID_INSTNCIA_FLJO_HJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_HJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(121165944677622301)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
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
 p_id=>wwv_flow_api.id(121166024588622302)
,p_name=>'PMTRO_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMTRO_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
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
 p_id=>wwv_flow_api.id(121166121690622303)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
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
 p_id=>wwv_flow_api.id(121166207399622304)
,p_name=>'ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_XML:&ID_RPRTE.,&NMBRE_RPRTE.,&PMTRO_RPRTE.'
,p_link_text=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_display_condition_type=>'PLSQL_EXPRESSION'
,p_display_condition=>'(:P187_CDGO_MDFCCION_ESTDO = ''APL'' or :P187_CDGO_MDFCCION_ESTDO = ''RCH'')'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(196707441437982816)
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
 p_id=>wwv_flow_api.id(196707997077982821)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero <br>Acuerdo')
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
 p_id=>wwv_flow_api.id(196708472105982826)
,p_name=>'NMRO_IDNTFCCION_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_IDNTFCCION_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br> Solicitante')
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
 p_id=>wwv_flow_api.id(196708530695982827)
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
 p_id=>wwv_flow_api.id(200506999668796210)
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
 p_id=>wwv_flow_api.id(201565962418645209)
,p_name=>'Selecrtor'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(196707317240982815)
,p_internal_uid=>196707317240982815
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
 p_id=>wwv_flow_api.id(196808390800745363)
,p_interactive_grid_id=>wwv_flow_api.id(196707317240982815)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(196808438401745363)
,p_report_id=>wwv_flow_api.id(196808390800745363)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23454070134641)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(107535585012029306)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107541103317029557)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(107535053834029301)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107542649288029563)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(107535399318029304)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107543107421029564)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(107535409156029305)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108026200708888281)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(108014373339807104)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(113384521494526246)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(113287578186330936)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119500148005298658)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(119358182931894533)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119500628084298659)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(119358243407894534)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120656382989516969)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(120619503355139104)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121172028772622539)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(121165944677622301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121172417244622543)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(121166024588622302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121172963506622545)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(121166121690622303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(121173428913622546)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(121166207399622304)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196808989893745364)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(196707441437982816)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196811498741745372)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(196707997077982821)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196813990010745378)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(196708472105982826)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196814467431745379)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(196708530695982827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(200706562548019200)
,p_view_id=>wwv_flow_api.id(196808438401745363)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(200506999668796210)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>220
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(202553385987521867)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
 p_id=>wwv_flow_api.id(261738257503549961)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('<b>1.</b> Consultar las solicitudes de modificaci\00F3n de acuerdos de pago.<br><br>'),
unistr('<b>2.</b> Visualizar el flujo de modificaci\00F3n de acuerdo de pago.<br><br>'),
unistr('<b>3.</b> Ver el detalle de cada tipo de modificaci\00F3n de Acuerdo de Pago, asi como aprobar, aplicar o rechazar la solicitud.<br><br>'),
'',
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107986003805537937)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(202553385987521867)
,p_button_name=>'BTN_APROBAR_CVN_MDFCCION'
,p_button_static_id=>'BTN_APROBAR_ACUERDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aprobar Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P187_CDGO_MDFCCION_ESTDO'
,p_button_condition2=>'RGS'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108199742207108402)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(202553385987521867)
,p_button_name=>'BTN_APLICAR_CVN_MDFCCION'
,p_button_static_id=>'BTN_APLICAR_ACUERDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aplicar Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P187_CDGO_MDFCCION_ESTDO'
,p_button_condition2=>'APB'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108199637542108401)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(202553385987521867)
,p_button_name=>'BTN_RECHAZAR_CVN_MDFCCION'
,p_button_static_id=>'BTN_RECHAZAR_ACUERDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>unistr('Rechazar Modificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'(:P187_CDGO_MDFCCION_ESTDO = ''APB'' or :P187_CDGO_MDFCCION_ESTDO = ''RGS'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107517434333909709)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(158500279300735927)
,p_button_name=>'BTN_BUSCAR'
,p_button_static_id=>'BTN_BUSCAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(109049961161485501)
,p_branch_name=>unistr('Ir a P\00E1gina 190')
,p_branch_action=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.:RP,190:P190_CDGO_ACTO_TPO:RMA&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(108199637542108401)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(110028890044947202)
,p_branch_name=>'Ir a Pagina 194'
,p_branch_action=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:RP,194:P194_CDGO_ACTO_TPO:AMA&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(108199742207108402)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47596076755179002)
,p_name=>'P187_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(158500279300735927)
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
,p_help_text=>unistr('Seleccione el tributo correspondiente al proceso de modificaci\00F3n de acuerdos de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47596117918179003)
,p_name=>'P187_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(158500279300735927)
,p_prompt=>'Sub Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P187_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el sub tributo correspondiente al proceso de modificaci\00F3n de acuerdos de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107518681351909718)
,p_name=>'P187_CDGO_MDFCCION_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(158500279300735927)
,p_item_default=>'RGS'
,p_prompt=>'Estado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_MODIFICACION_ESTADO'
,p_lov=>'select d.dscrpcion,d.cdgo_cnvnio_mdfccion_estdo from gf_d_convenios_mdfccn_estdo d;'
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione el estado del proceso de modificaci\00F3n de acuerdo de pago.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107519052548909718)
,p_name=>'P187_IDNTFCCION_SJTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(158500279300735927)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realiz\00F3 la solicitud de modificaci\00F3n de acuerdo de pago.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107519407228909718)
,p_name=>'P187_IDNTFCCION_SLCTNTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(158500279300735927)
,p_prompt=>unistr('Identificaci\00F3n Solicitante')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraNumero'');" onkeyup="campoMayuscula(this)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del solicitante que inici\00F3 proceso de modificaci\00F3n de acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107519843684909718)
,p_name=>'P187_FCHA_INCIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(158500279300735927)
,p_prompt=>'Fecha Inicio - Registro'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente  al registro de la solicitud de modificaci\00F3n de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107520249613909718)
,p_name=>'P187_FCHA_FNAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(158500279300735927)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Final - Registro'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente  al registro de la solicitud de modificaci\00F3n de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107529233072917924)
,p_name=>'P187_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(158500279300735927)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108164012655594901)
,p_name=>'P187_ID_CNVNIO_MDFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(158550566293078318)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(120833888116612803)
,p_validation_name=>'Acuerdos Modificados Seleccionados'
,p_validation_sequence=>10
,p_validation=>'P187_ID_CNVNIO_MDFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione Acuerdo(s) de Pago!'
,p_always_execute=>'Y'
,p_validation_condition=>'BTN_APROBAR_CVN_MDFCCION,BTN_APLICAR_CVN_MDFCCION,BTN_RECHAZAR_CVN_MDFCCION'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(108164012655594901)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108060506254242301)
,p_name=>'al seleccionar registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(158550566293078318)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108060625540242302)
,p_event_id=>wwv_flow_api.id(108060506254242301)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'obtenerConvenioModificacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(109050980628485511)
,p_name=>'Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(109051052670485512)
,p_event_id=>wwv_flow_api.id(109050980628485511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(158550566293078318)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(121113945253570701)
,p_name=>'borrar sesion'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(107517434333909709)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121114088059570702)
,p_event_id=>wwv_flow_api.id(121113945253570701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P187_ID_CNVNIO_MDFCCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(121114129180570703)
,p_event_id=>wwv_flow_api.id(121113945253570701)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108014590374807106)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Aprobado Modificaci\00F3n de Acuerdo de pagos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_cdgo_rspsta  number;',
'',
'begin',
' ',
'    prc_ap_mdfccion_acrdo_pgo_msvo(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                   p_json_cnvnio        => :P187_ID_CNVNIO_MDFCCION,',
'                                   o_cdgo_rspsta        => v_cdgo_rspsta, ',
'                                   o_mnsje_rspsta       => :P187_RSPSTA); ',
'                                   ',
'     apex_util.set_session_state(''P187_ID_CNVNIO_MDFCCION'','''');                            ',
'end ; '))
,p_process_error_message=>'&P187_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107986003805537937)
,p_process_success_message=>'&P187_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(121026495834441501)
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
'    begin',
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
'    exception when no_data_found then',
'              ',
'              begin                   ',
'                  select distinct first_value(id_fljo_trea_orgen) over(order by id_instncia_trnscion desc) ',
'                    into v_id_fljo_trea',
'                    from wf_g_instancias_transicion ',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception when no_data_found  then',
'                        v_id_fljo_trea := null;',
'              end;',
'    end;',
'    ',
'        if nvl(v_id_fljo_trea, -1) > 0 then',
'            apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea );            	',
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
