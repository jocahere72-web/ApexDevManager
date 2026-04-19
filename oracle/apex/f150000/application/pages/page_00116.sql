prompt --application/pages/page_00116
begin
wwv_flow_api.create_page(
 p_id=>116
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Consulta de Acuerdo de Pago'
,p_step_title=>'Consulta de Acuerdo de Pago'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function descargar_plan_pago(id_rpte, nmbre_rprte, id_cnvnio) {',
'    console.log(id_rpte);',
'    var popup = apex.widget.waitPopup();',
'    var v_app_id = $v(''pFlowId''),',
'        v_page_id = $v(''pFlowStepId''),',
'        v_session = $v(''pInstance'');',
'    try {',
'         console.log(id_rpte);',
'        $s(''P116_ID_RPRTE'', id_rpte);',
'        $s(''P116_NMBRE_RPRTE'', nmbre_rprte);',
'        $s(''P116_ID_CNVNIO'', id_cnvnio);',
'        await apex.server.process(''set_session'', {pageItems: ''#P116_ID_RPRTE,#P116_NMBRE_RPRTE,#P116_ID_CNVNIO''});',
'        ',
'        var url = `f?p=${v_app_id}:${v_page_id}:${v_session}:APPLICATION_PROCESS=DOWNLOADFILE:NO:RP:::`;',
'        ',
'        await fetch(url, {',
'            method: ''GET'',',
'            cache: ''default''',
'        }).then(resp => {',
'            return resp.blob()',
'        }).then(resp => {',
'            let a = document.createElement("a");',
'            document.body.appendChild(a);',
'            let v_url = window.URL.createObjectURL(resp);',
'            a.download = nmbre_rprte + ".pdf";',
'            a.href = v_url;',
'            a.click();',
'            document.body.removeChild(a);',
'            window.URL.revokeObjectURL(v_url);',
'        });',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        popup.remove();',
'    }',
'}'))
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210118073043'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(128322140111246403)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(128368480826580595)
,p_plug_name=>'Solicitudes de Acuerdo de Pago'
,p_region_name=>'solicitudes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select distinct a.id_cnvnio',
'        , a.idntfccion_sjto_frmtda                   idntfccion_sjto',
'        , a.nmro_cnvnio',
'        , a.fcha_slctud',
'        , a.nmro_cta',
'        , a.fcha_prmra_cta',
'        , a.cdgo_cnvnio_estdo',
'        , a.dscrpcion_cnvnio_estdo',
'        , 1 Plan_pago',
'        , a.dscrpcion_cnvnio_tpo',
'        , a.nmbre_impsto_sbmpsto',
'        , a.nmbre_impsto',
'        , a.id_instncia_fljo_hjo',
'        , 204 id_rprte',
'        , ''PLAN_PAGO_''|| a.nmro_cnvnio               nmbre_rprte',
'        , ''<P_ID_IMPSTO>''||a.id_impsto ||''</P_ID_IMPSTO><P_ID_CNVNIO>''||a.id_cnvnio ||''</P_ID_CNVNIO><P_ID_RPRTE>204</P_ID_RPRTE>'' pmtro_rprte',
'        , ''<id_slctud>''||a.id_slctud||''</id_slctud>'' prmtro_rdcdo',
'        , ''RADICADO_''|| a.nmro_cnvnio                nmbre_rprte_rdcdo',
'        , 212                                        id_rprte_rdcdo',
'        , 1                                          rprte_rdcdo',
'      from v_gf_g_convenios            a',
'      join wf_g_instancias_transicion  b on a.id_instncia_fljo_hjo = b.id_instncia_fljo ',
'      join pq_g_solicitudes            c on a.id_slctud            = c.id_slctud',
'     where a.cdgo_clnte                = :F_CDGO_CLNTE    ',
'       and a.id_impsto                 = :P116_ID_IMPSTO',
'       and a.nmro_cnvnio               = :P116_NMRO_CNVNIO',
'       and (a.id_cnvnio_tpo            = :P116_ID_CNVNIO_TPO         or :P116_ID_CNVNIO_TPO         is null)',
'       and (a.idntfccion_sjto          = :P116_IDNTFCCION_SJTO       or :P116_IDNTFCCION_SJTO       is null) ',
'       and (a.cdgo_cnvnio_estdo        = :P116_ESTADO                or :P116_ESTADO                is null) ',
'       and ((trunc(fcha_slctud)        between :P116_FCHA_INCIO      and :P116_FCHA_FNAL)',
'       or (trunc(a.fcha_slctud)        >= :P116_FCHA_INCIO           and :P116_FCHA_FNAL            is null) ',
'       or (trunc(a.fcha_slctud)        <= :P116_FCHA_FNAL            and :P116_FCHA_INCIO           is null)',
'       or(:P116_FCHA_INCIO             is null                       and :P116_FCHA_FNAL            is null ))    '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(77360245295422253)
,p_name=>'RPRTE_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RPRTE_RDCDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
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
 p_id=>wwv_flow_api.id(81041602693173895)
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
 p_id=>wwv_flow_api.id(81041662907173896)
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
 p_id=>wwv_flow_api.id(81041758567173897)
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
 p_id=>wwv_flow_api.id(81041882295173898)
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
,p_display_condition_type=>'SQL_EXPRESSION'
,p_display_condition=>'1=2'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(166525355971485093)
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
 p_id=>wwv_flow_api.id(166525911611485098)
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
 p_id=>wwv_flow_api.id(166525958160485099)
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
 p_id=>wwv_flow_api.id(166526031216485100)
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
 p_id=>wwv_flow_api.id(166526129047485101)
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
 p_id=>wwv_flow_api.id(166526280358485102)
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
 p_id=>wwv_flow_api.id(166526715842485106)
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
 p_id=>wwv_flow_api.id(166526787482485107)
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
 p_id=>wwv_flow_api.id(166526835663485108)
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
,p_link_target=>'javascript:descargar_plan_pago(&ID_RPRTE.,"&NMBRE_RPRTE.",&ID_CNVNIO.);'
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
 p_id=>wwv_flow_api.id(166527467998485114)
,p_name=>'DSCRPCION_CNVNIO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo <br> Acuerdo de Pago'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(170324504987298483)
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
 p_id=>wwv_flow_api.id(170324724437298486)
,p_name=>'Ver Acuerdo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_01=>'<span class="fa fa-eye">&EMPLOYEE_STATUS.</span>'
,p_link_target=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,117:P117_ID_CNVNIO,P117_ID_INSTNCIA_FLJO,P117_BRANCH:&ID_CNVNIO.,&ID_INSTNCIA_FLJO_HJO.,&APP_PAGE_ID.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(170324914202298487)
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
 p_id=>wwv_flow_api.id(170638573565460090)
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
 p_id=>wwv_flow_api.id(171384014313147487)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(196695949920314703)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
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
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P116_ID_IMPSTO'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(196696080104314704)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P116_ID_IMPSTO_SBMPSTO'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(166525231774485092)
,p_internal_uid=>166525231774485092
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
 p_id=>wwv_flow_api.id(166626305334247640)
,p_interactive_grid_id=>wwv_flow_api.id(166525231774485092)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(166626352935247640)
,p_report_id=>wwv_flow_api.id(166626305334247640)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77367929796432393)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(77360245295422253)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77411391997439742)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(170324724437298486)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(77420403800599522)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(166527467998485114)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>254
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81086894892403150)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(81041602693173895)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81087350923403154)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(81041662907173896)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81087828441403155)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(81041758567173897)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81089770544406685)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(81041882295173898)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166626904427247641)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(166525355971485093)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166629413275247649)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(166525911611485098)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166629853556247650)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(166525958160485099)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166630343214247651)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(166526031216485100)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>73
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166630830366247652)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(166526129047485101)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166631405359247653)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(166526280358485102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166633339557247658)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(166526715842485106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166633914142247659)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(166526787482485107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(166634361542247660)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(166526835663485108)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(170330479772300882)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(170324504987298483)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(170524477081521477)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(170324914202298487)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>233
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(170797189658993852)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(170638573565460090)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(171400933484236565)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(171384014313147487)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196781647467408358)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(196695949920314703)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(196782249387408361)
,p_view_id=>wwv_flow_api.id(166626352935247640)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(196696080104314704)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>178
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(218433607752718399)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(73317268410195078)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(128322140111246403)
,p_button_name=>'BTN_BUSCAR'
,p_button_static_id=>'BTN_BUSCAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(75044960011310001)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(128368480826580595)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73193162672844415)
,p_name=>'P116_ID_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(128368480826580595)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73193216436844416)
,p_name=>'P116_NMBRE_RPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(128368480826580595)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73193361106844417)
,p_name=>'P116_ID_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(128368480826580595)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73317653427195086)
,p_name=>'P116_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(128322140111246403)
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
,p_grid_column=>2
,p_display_when=>'P116_ID_IMPSTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tributo del que desea consultar acuerdos de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73318475917195133)
,p_name=>'P116_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(128322140111246403)
,p_prompt=>'Sub Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P116_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P116_ID_IMPSTO'
,p_ajax_items_to_submit=>'P116_ID_IMPSTO_SBMPSTO,P116_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_display_when=>'P116_ID_IMPSTO_SBMPSTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Sub Tributo del que desea consultar acuerdos de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73319386561195133)
,p_name=>'P116_IDNTFCCION_SJTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(128322140111246403)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al que se le realiz\00F3 la solicitud de acuerdo de pago.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73320291411195134)
,p_name=>'P116_ID_CNVNIO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(128322140111246403)
,p_prompt=>'Tipo de Acuerdo de Pago'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion                as d,',
'       id_cnvnio_tpo            as r',
'  from gf_d_convenios_tipo      a ',
'  join df_c_impuestos           b on a.cdgo_clnte = b.cdgo_clnte',
'   and a.cdgo_sjto_tpo          = b.cdgo_sjto_tpo',
'   and b.id_impsto              = :P116_ID_IMPSTO',
' where a.cdgo_clnte             = :F_CDGO_CLNTE',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Seleccione el tipo de acuerdo de pago con el que registr\00F3 la solicitud.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73322018373195135)
,p_name=>'P116_ESTADO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(128322140111246403)
,p_prompt=>'Estado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ESTADO_CONVENIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(dscrpcion) as d,',
'       cdgo_cnvnio_estdo as r',
'  from gf_d_convenios_estado',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el estado en que se encuentra el o los acuerdos de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73323813419195136)
,p_name=>'P116_FCHA_INCIO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(128322140111246403)
,p_prompt=>'Fecha Incio - Solicitud'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>22
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente  al registro de la solicitud de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73324735973195138)
,p_name=>'P116_FCHA_FNAL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(128322140111246403)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select LAST_DAY(SYSDATE)',
'   from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Fecha Final - Solicitud'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>22
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente  al registro de la solicitud de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73325640108195139)
,p_name=>'P116_NMRO_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(128322140111246403)
,p_prompt=>unistr('N\00B0 Acuerdo de Pago')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73336717194195245)
,p_name=>'Al seleccionar un registros'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(128368480826580595)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73337263959195258)
,p_event_id=>wwv_flow_api.id(73336717194195245)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//AprobarConvenios();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73337681998195262)
,p_name=>'cerrar modal'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73338107500195263)
,p_event_id=>wwv_flow_api.id(73337681998195262)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(128368480826580595)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73193428582844418)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOADFILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob          blob;',
'    v_gn_d_reportes gn_d_reportes%rowtype;    ',
'begin',
'    begin',
'        apex_session.attach( p_app_id     => 66000',
'                           , p_page_id    => 2',
'                           , p_session_id => v(''APP_SESSION'') );',
'',
'        --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = :P116_ID_RPRTE;',
'',
'',
'        --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO                    ',
'        apex_util.set_session_state(''P2_XML'', ''<P_ID_IMPSTO>'' ||:P116_ID_IMPSTO || ''</P_ID_IMPSTO><P_ID_CNVNIO>'' || :P116_ID_CNVNIO || ''</P_ID_CNVNIO><P_ID_RPRTE>''|| :P116_ID_RPRTE || ''</P_ID_RPRTE>'');',
'        apex_util.set_session_state(''P2_PRMTRO_1'', :P116_ID_CNVNIO);',
'        apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE);',
'        ',
'        v_blob := apex_util.get_print_document( p_application_id     => 66000, ',
'                                                p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'                                                p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'                                                p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'                                                p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'        htp.init;',
'        owa_util.mime_header(''application/pdf'', FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' || :P116_NMBRE_RPRTE || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_blob);',
'        apex_application.stop_apex_engine;',
'        ',
'       ',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73193509990844419)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set_session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'apex_json.write(''type'', ''OK'');',
'apex_json.close_object;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
