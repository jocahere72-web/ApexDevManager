prompt --application/pages/page_00249
begin
wwv_flow_api.create_page(
 p_id=>249
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n T\00EDtulos Judiciales')
,p_step_title=>unistr('Gesti\00F3n T\00EDtulos Judiciales')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*function irFlujo(id_instancia){',
'    ',
'    if (!id_instancia || id_instancia === null || id_instancia === undefined) {',
unistr('        console.warn("ID_INSTANCIA_FLJO es nulo o inv\00E1lido");'),
'        return;',
'    }',
'    ',
'    apex.server.process("IniciarFlujo", {f01: id_instancia}).then(function(data){',
'        if (data.type === ''OK'') {',
'            window.localStorage.clear();',
'            console.log(''url: ''+data.url);',
'            localStorage.setItem("pagina_origen", window.location.href);',
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
'*/',
'',
'function irFlujo(id_instancia){',
'   ',
'    if (!id_instancia || id_instancia === null || id_instancia === undefined) {',
unistr('        console.warn("ID_INSTANCIA_FLJO es nulo o inv\00E1lido");'),
'        return;',
'    }',
'',
'    apex.server.process("IniciarFlujo", ',
'        { f01: id_instancia }, ',
'        { dataType: "json" }',
'    ).then(function(data){',
'',
'        if (!data) {',
unistr('            apex.message.alert("No se recibi\00F3 respuesta del servidor.");'),
'            return;',
'        }',
'',
'        if (data.type === ''OK'') {',
'',
'            window.localStorage.clear();',
'            localStorage.setItem("pagina_origen", window.location.href);',
'',
'            if (data.url) {',
'                window.location.href = data.url;',
'            } else {',
unistr('                apex.message.alert("No se recibi\00F3 URL de redirecci\00F3n.");'),
'            }',
'',
'        } else {',
'',
'            apex.message.showErrors({',
'                type: apex.message.TYPE.ERROR,',
'                location: ["page"],',
'                message: data.msg || "Error inesperado",',
'                unsafe: false',
'            });',
'',
'        }',
'',
'    }).catch(function(error){',
'        console.error("Error Ajax:", error);',
unistr('        apex.message.alert("Error de comunicaci\00F3n con el servidor.");'),
'    });',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''BTN_SLCTUD_DVLCION'').hide(); ',
'apex.item(''BTN_CNFRMCION_DVLCION'').hide();  '))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_protection_level=>'C'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20260225220837'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18345285495609230)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'<i>',
'Esta funcionalidad permite:<br><br>',
unistr('<b>1.</b> Consultar los t\00EDtulos judiciales gestionados por el funcionario, seg\00FAn los par\00E1metros de b\00FAsqueda previamente seleccionados.<br><br>'),
unistr('<b>2.</b> Acceder al flujo del proceso correspondiente al t\00EDtulo judicial seleccionado y visualizar su detalle.<br><br>'),
unistr('<b>3.</b> Instanciar el flujo del proceso puntual de t\00EDtulos judiciales.<br><br>'),
unistr('<!--<b>4.</b> Procesar los flujos del proceso masivo de t\00EDtulos judiciales.<br><br>'),
unistr('<b>5.</b> Registrar las solicitudes de t\00EDtulos judiciales.<br><br>-->'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18757463994205258)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18760865309206529)
,p_plug_name=>unistr('<b>T\00EDtulos Judiciales</b>')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_ttlo_jdcial',
'       ,c.idntfccion_sjto_frmtda',
'       ,k.dscrpcion  dscrpcion_ttlo_estdo',
'       ,a.cdgo_ttlo_jdcial_estdo',
'       ,a.nmbre_dmnddo',
'       ,a.id_instncia_fljo',
'       ,a.fcha_cnsttcion',
'       ,a.idntfccion_dmnddo',
'       ,c.nmbre_impsto',
'       ,c.nmbre_impsto_sbmpsto',
'       ,a.id_ttlo_jdcial',
'       ,d.id_ttlo_jdcial_slctud',
'       ,a.vlor ',
'       ,j.dscrpcion dscrpcion_ttlo_estdo_incial',
'from gf_g_titulos_judicial            a',
'left join gf_d_titulos_judicial_estdo        j on j.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo_incial',
'join gf_d_titulos_judicial_estdo        k on k.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'left join v_gf_g_titulos_jdcial_impsto  c on a.id_instncia_fljo = c.id_instncia_fljo                                          ',
'left join gf_g_ttlos_jdcl_slctd_dtll    d on a.id_ttlo_jdcial = d.id_ttlo_jdcial',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_ttlo_jdcial_estdo not in (''RCH'',''TRO'')',
'and a.nmro_ttlo_jdcial = nvl(:P249_NMRO_TTLO, a.nmro_ttlo_jdcial)',
'and a.idntfccion_dmnddo = nvl(:P249_IDNTFCCION_DMNDDO, a.idntfccion_dmnddo)',
'and a.cdgo_ttlo_jdcial_estdo = nvl(:P249_CDGO_TTLO_JDCIAL_ESTDO, a.cdgo_ttlo_jdcial_estdo)',
'and ((a.fcha_cnsttcion between :P249_FCHA_INCIO and :P249_FCHA_FNAL)',
'       or (a.fcha_cnsttcion >= :P249_FCHA_INCIO and :P249_FCHA_FNAL is null) ',
'       or (a.fcha_cnsttcion <= :P249_FCHA_FNAL and :P249_FCHA_INCIO  is null)',
'       or(:P249_FCHA_INCIO is null and :P249_FCHA_FNAL is null ));'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(10497866587617103)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha <br>Constituci\00F3n')
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
 p_id=>wwv_flow_api.id(12537387918542601)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('N\00B0 T\00EDtulo <br> Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12537406225542602)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
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
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(12537525913542603)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n <br> Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
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
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13607738661819702)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(13621814956992901)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(13622088914992903)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(16582292276785004)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18349057876200001)
,p_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO_FRMTDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(18349110292200002)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(18349223965200003)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(18349395723200004)
,p_name=>'ID_TTLO_JDCIAL_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_SLCTUD'
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
 p_id=>wwv_flow_api.id(18836036674060122)
,p_name=>'DSCRPCION_TTLO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TTLO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
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
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18837554848060137)
,p_name=>'ver'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver <br> Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#" onclick="irFlujo(&ID_INSTNCIA_FLJO.)" style="color:blue" >',
'    <span class="fa fa-eye"></span>',
'</a>',
''))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21383102969753201)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor T\00EDtulo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FML999G999G999G999G990D00'
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
 p_id=>wwv_flow_api.id(21530462237243801)
,p_name=>'DSCRPCION_TTLO_ESTDO_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TTLO_ESTDO_INCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Solicitud'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(18761041398206530)
,p_internal_uid=>18761041398206530
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
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
 p_id=>wwv_flow_api.id(18776779201301694)
,p_interactive_grid_id=>wwv_flow_api.id(18761041398206530)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>20
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(18776921195301694)
,p_report_id=>wwv_flow_api.id(18776779201301694)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(120685000034)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(13607738661819702)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(10512501749217230)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(10497866587617103)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12543219841542998)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(12537387918542601)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12543600612543160)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(12537406225542602)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>244
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(12544160287543162)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(12537525913542603)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13627818755993657)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(13621814956992901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(13642553686633094)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(13622088914992903)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(16621234285474791)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(16582292276785004)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18355027587200195)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(18349057876200001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18355419590200204)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(18349110292200002)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18355949103200206)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(18349223965200003)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18356439007200209)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(18349395723200004)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18842016623060180)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(18836036674060122)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>183
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18886796333230809)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(18837554848060137)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>50
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21389105935753392)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(21383102969753201)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21536496796243985)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21530462237243801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>202
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(45215000000)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_execution_seq=>7.5
,p_name=>'Apto para Consignar'
,p_background_color=>'#99FF99'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(18836036674060122)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'APTO PARA CONSIGNAR'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(100485000001)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_execution_seq=>5
,p_name=>'Fraccionamiento'
,p_background_color=>'#99CCFF'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(18836036674060122)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'FRACCIONAMIENTO'
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_highlight(
 p_id=>wwv_flow_api.id(108468000000)
,p_view_id=>wwv_flow_api.id(18776921195301694)
,p_execution_seq=>10
,p_name=>'Enviado a Consignar'
,p_background_color=>'#FFDD44'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_api.id(18836036674060122)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'ENVIADO A CONSIGNAR'
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13622904672992912)
,p_plug_name=>'Tipo Solicitud'
,p_parent_plug_id=>wwv_flow_api.id(18760865309206529)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(392373712662702259)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16582096520785002)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(392373712662702259)
,p_button_name=>'BTN_NUEVO_TJ'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Registrar T\00EDtulos')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:390:&SESSION.::&DEBUG.:RP,390::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9680736043195133)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(392373712662702259)
,p_button_name=>'BTN_NUEVO_REGISTRO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Instanciar Flujo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=62000:17:&SESSION.::&DEBUG.:RP,17:P17_ID_PRCSO:35'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10497610761617101)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(392373712662702259)
,p_button_name=>'BTN_PRCSAR_CRGUE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Gesti\00F3n Masiva <br> T\00EDtulos Judiciales')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:240:&SESSION.::&DEBUG.:RP,240::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-folder-arrow-up'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10992951801614002)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(392373712662702259)
,p_button_name=>'BTN_SLCTUD_RGSTRO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Solicitud Registro'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12005502558945401)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(392373712662702259)
,p_button_name=>'BTN_SLCTUD_DVLCION'
,p_button_static_id=>'BTN_SLCTUD_DVLCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>unistr('Solicitar Devoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13621948793992902)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(392373712662702259)
,p_button_name=>'BTN_CNFRMCION_DVLCION'
,p_button_static_id=>'BTN_CNFRMCION_DVLCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>unistr('Confirmar Devoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10521714713531701)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18757463994205258)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12006102128945407)
,p_branch_name=>unistr('Ir a p\00E1gina 253')
,p_branch_action=>'f?p=&APP_ID.:253:&SESSION.::&DEBUG.:RP,253:P253_CDGO_TTLO_JDCIAL_ESTDO,P253_JSON_PAGINA,P253_PAGINA,P253_CDGO_TTLO_JDCIAL_SLCTUD_TPO:SDT,P249_JSON_SLCTUD_DVLCION,&APP_PAGE_ID.,&P249_CDGO_TTLO_JDCIAL_SLCTUD_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(12005502558945401)
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P249_CDGO_TTLO_JDCIAL_SLCTUD_TPO'
,p_branch_condition_text=>'SDT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13622302980992906)
,p_branch_name=>unistr('Ir a P\00E1gina 253')
,p_branch_action=>'f?p=&APP_ID.:253:&SESSION.::&DEBUG.:RP,253:P253_CDGO_TTLO_JDCIAL_ESTDO,P253_JSON_PAGINA,P253_PAGINA:CDT,P249_JSON_SLCTUD_DVLCION,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(13621948793992902)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10455569936046602)
,p_name=>'P249_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18757463994205258)
,p_prompt=>'<b>Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10455638101046603)
,p_name=>'P249_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18757463994205258)
,p_prompt=>'<b>Sub - Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where id_impsto = :P249_ID_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P249_ID_IMPSTO'
,p_ajax_items_to_submit=>'P249_ID_IMPSTO,P249_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10466209710053264)
,p_name=>'P249_NMRO_TTLO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(18757463994205258)
,p_prompt=>unistr('<b>T\00EDtulo No. </b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10466602091053264)
,p_name=>'P249_IDNTFCCION_DMNDDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(18757463994205258)
,p_prompt=>unistr('<b>Identificaci\00F3n Demandado</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10467084004053264)
,p_name=>'P249_CDGO_TTLO_JDCIAL_ESTDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(18757463994205258)
,p_prompt=>unistr('<b>Estado T\00EDtulo</b>')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TITULOS_ESTADOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_ttlo_jdcial_estdo as r',
'  from gf_d_titulos_judicial_estdo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10467411875053265)
,p_name=>'P249_FCHA_INCIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(18757463994205258)
,p_prompt=>unistr('<b>Fecha Desde - Constituci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10467825114053265)
,p_name=>'P249_FCHA_FNAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(18757463994205258)
,p_prompt=>unistr('<b>Fecha Hasta - Constituci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13608118077819706)
,p_name=>'P249_JSON_SLCTUD_DVLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18757463994205258)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13622713448992910)
,p_name=>'P249_CDGO_TTLO_JDCIAL_SLCTUD_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(13622904672992912)
,p_prompt=>'Tipo de Solicitud'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TITULOS_SOLICITUD_TIPOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d',
'       , cdgo_ttlo_jdcial_slctud_tpo r',
'  from gf_d_ttlos_jdcial_slctud_tp',
' where cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(13623158153992914)
,p_validation_name=>'Valida Tipo de Solcitud'
,p_validation_sequence=>20
,p_validation=>'P249_CDGO_TTLO_JDCIAL_SLCTUD_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione Tipo de Solicitud!')
,p_when_button_pressed=>wwv_flow_api.id(12005502558945401)
,p_associated_item=>wwv_flow_api.id(13622713448992910)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10059384082869201)
,p_name=>'Al Cerrar Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10455714659046604)
,p_name=>'Al cambiar tributo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P249_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10455836461046605)
,p_event_id=>wwv_flow_api.id(10455714659046604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select min(id_impsto_sbmpsto)',
'      into :P249_ID_IMPSTO_SBMPSTO       ',
'      from df_i_impuestos_subimpuesto',
'     where id_impsto = :P249_ID_IMPSTO;',
'end;'))
,p_attribute_02=>'P249_ID_IMPSTO,P249_ID_IMPSTO_SBMPSTO'
,p_attribute_03=>'P249_ID_IMPSTO_SBMPSTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13607958859819704)
,p_name=>'Al seleccionar registro'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(18760865309206529)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13608001691819705)
,p_event_id=>wwv_flow_api.id(13607958859819704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (this.data.selectedRecords.length >= 0 ){',
'    var model = this.data.model;',
'    var records = this.data.selectedRecords;',
'    records = records.filter(function (record) {',
'        return false;   ',
'    });',
'    ',
'   //apex.region("titulos").widget().interactiveGrid("setSelectedRecords", records);',
'    console.log(this);',
'}else{',
'    apex.item(''BTN_SLCTUD_DVLCION'').hide(); ',
'    apex.item(''BTN_CNFRMCION_DVLCION'').hide(); ',
'}',
'/*',
'if (this.data.selectedRecords.length > 0 ){',
'    const unique = (value, index, self) => {',
'      return self.indexOf(value) === index',
'    }',
'    ',
'    var model = this.data.model;',
'    var r = ''000'';',
'    var records = this.data.selectedRecords;',
'    ',
'    records = records.filter(function (record) {',
'        /*var valor = '''';',
'        valor = model.getValue(record, "ID_TTLO_JDCIAL_SLCTUD");',
'        console.log(valor == '''');',
'        return false;',
'        //return (model.getValue(record, "CDGO_TTLO_JDCIAL_ESTDO") !== ''ASD'').v || (model.getValue(record, "CDGO_TTLO_JDCIAL_ESTDO").v === ''ASD'' && model.getValue(record, "ID_TTLO_JDCIAL_SLCTUD").v == '''');',
'    });  ',
'    ',
'    var json = records.map(function (record) { return {"ID_TTLO_JDCIAL": model.getValue(record, "ID_TTLO_JDCIAL"),',
'                                                       "ID_TTLO_JDCIAL_SLCTUD": model.getValue(record, "ID_TTLO_JDCIAL_SLCTUD")}});',
'    ',
'    window.localStorage.setItem(''jsonTitulos'', json.length > 0 ? JSON.stringify(json) : '''');',
'    apex.region("titulos").widget().interactiveGrid("setSelectedRecords", records);',
'    ',
'    var rs  = records.map(function (record) { return model.getValue(record, "CDGO_TTLO_JDCIAL_ESTDO")});',
'    var dc  = records.map(function (record) { return model.getValue(record, "IDNTFCCION_DMNDDO")});',
'       ',
'    const uniqueDC = dc.filter(unique); ',
'    r = rs.reduce(function(x, y){',
'        return x === y && x === ''ASD'' ? x : ''000'';',
'    });',
'    ',
'    $s(''P249_JSON_SLCTUD_DVLCION'', JSON.stringify(json));',
'    if ( r === ''000'' || r !== ''ASD'' ){ ',
'        apex.item(''BTN_SLCTUD_DVLCION'').hide();      ',
'    } else {        ',
'        apex.item(''BTN_SLCTUD_DVLCION'').show();   ',
'    }',
'    s = rs.reduce(function(x, y){',
'        return x === y && x === ''SDT'' ? x : ''000'';',
'    });',
'    if ( s === ''000'' || s !== ''SDT'' || uniqueDC.length !== 1){ ',
'        apex.item(''BTN_CNFRMCION_DVLCION'').hide();      ',
'    } else {',
'        apex.item(''BTN_CNFRMCION_DVLCION'').show();   ',
'    }',
'}else{',
'    apex.item(''BTN_SLCTUD_DVLCION'').hide(); ',
'    apex.item(''BTN_CNFRMCION_DVLCION'').hide();  ',
'   // $s(''P249_JSON_SLCTUD_DVLCION'', null);',
'}',
'*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11230799725730401)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Envio de Alerta de Solicitud de Registro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dstntrios                 pkg_ma_envios.g_dstntrios;',
'    ',
'begin',
'    --Inicializamos los arreglos',
'   v_dstntrios         :=  pkg_ma_envios.g_dstntrios();',
'  ',
'    ',
'    select a.id_usrio, null, null, null',
'      bulk collect into v_dstntrios',
'      from v_sg_g_usuarios a ',
'      join df_c_oficinas b on a.id_ofcna = b.id_ofcna',
'     where b.nmbre_ofcna = ''TESORERIA''',
'       and a.cdgo_clnte = :F_CDGO_CLNTE;',
'    ',
'    pkg_ma_envios.prc_co_envio_programado(',
'                       p_cdgo_clnte                => :F_CDGO_CLNTE,',
'                       p_idntfcdor                 => '''',--v_dstntrios,',
'                       --p_nmbre_up                  => ''SOLICITUD_REGISTRO_TITULO'',',
'                       p_json_prmtros              => null',
'                       ',
'                       ',
'                     );',
'     ',
'exception ',
'    when others then',
'        raise_application_error(-20000, ''Error al enviar alerta'');',
'end;  ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(10992951801614002)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10498051688617105)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IniciarFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_id_instncia_fljo number := apex_application.g_f01(1);',
'    v_id_fljo_trea number;',
'    v_url varchar2(4000);',
'    v_url_tmp varchar2(4000);',
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
'            v_url := replace(v_url,''257::'',''257:''||''P257_ID_IMPSTO:'');',
'            ',
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
