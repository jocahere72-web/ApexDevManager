prompt --application/pages/page_00202
begin
wwv_flow_api.create_page(
 p_id=>202
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Consulta De Gesti\00F3n De Remanentes')
,p_step_title=>unistr('Gesti\00F3n De Remanentes')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonEmbargos() {',
'    ',
'    console.log (''Entrando'');',
'    ',
'    var region = apex.region(''embargos'');',
'    ',
'    if(region) {',
'        ',
'        var view = apex.region("embargos").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        //var records = model._data;//view.view$.grid("getSelectedRecords");',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonEmbargos = records.map((embargos) => {',
'            return {"ID_EMBRGOS_RMNTE" : model.getValue(embargos, "ID_EMBRGOS_RMNTE")',
'                   }; ',
'            });',
'        $s(''P202_ID_EMBRGOS_RMNTE'', JSON.stringify(jsonEmbargos));',
'        //console.log(''jsonEmbargos: ''+JSON.stringify(jsonEmbargos)) ',
'        apex.region(''desembargo'').refresh();',
'    }',
'};',
'',
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
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20240609202556'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22770183363713001)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'<p>Esta funcionalidad permite visualizar la gestion de los embargos remamentes.</p>',
unistr('<p><b>Nota:</b> La busqueda se puede realizar por diferentes par\00E1metros </p>'),
unistr('<p>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(233378425212465234)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(233481205563752329)
,p_plug_name=>'Tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(17363723095919377)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(233410864916934356)
,p_plug_name=>'<b>Embargos Remanentes</b>'
,p_region_name=>'embargos'
,p_parent_plug_id=>wwv_flow_api.id(233481205563752329)
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
'        ,to_char(a.fcha_ofcio,''DD/MM/YYYY'') as fcha_ofcio',
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
'        ,a.id_slctud',
'        ,decode(a.cdgo_tpo_idntfccn_dmndt, a.cdgo_tpo_idntfccn_dmndt, d.dscrpcion_idntfccion_tpo , ''-'') as cdgo_tpo_idntfccn_dmndt',
'        ,decode(a.cdgo_estdo_embrgo, a.cdgo_estdo_embrgo, e.dscrpcion , ''-'') as cdgo_estdo_embrgo',
'from mc_g_embargos_remanente a',
'join df_s_entidades b on b.id_entdad = a.id_entdad',
'join mc_d_procesos_remanente c on c.cdgo_tpo_prcso = a.cdgo_tpo_prcso',
'join df_s_identificaciones_tipo d on d.cdgo_idntfccion_tpo = a.cdgo_tpo_idntfccn_dmndt',
'join mc_d_remanentes_rspsta e on e.cdgo_rspsta = a.cdgo_estdo_embrgo',
'where a.nmro_rslcn = nvl(:P202_NMRO_RSLCN, a.nmro_rslcn)',
'  and ((a.fcha_rslcn between :P202_FCHA_RSLCN_INCIO and :P202_FCHA_RSLCN_FIN)',
'       or (a.fcha_rslcn >= :P202_FCHA_RSLCN_INCIO and :P202_FCHA_RSLCN_FIN is null) ',
'       or (a.fcha_rslcn <= :P202_FCHA_RSLCN_FIN and :P202_FCHA_RSLCN_INCIO  is null)',
'       or(:P202_FCHA_RSLCN_INCIO is null and :P202_FCHA_RSLCN_FIN is null ))',
'  and a.nro_oficio = nvl(:P202_NRO_OFICIO, a.nro_oficio)',
'  and a.nro_pqr = nvl(:P202_NRO_PQR, a.nro_pqr)',
'  and a.id_entdad = nvl(:P202_ENTDAD, a.id_entdad)',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22799465567227026)
,p_name=>'ID_EMBRGOS_RMNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RMNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(23047596433007701)
,p_name=>'ID_ENTDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ENTDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entidad'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(23047698420007702)
,p_name=>'CDGO_TPO_IDNTFCCN_DMNDT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_IDNTFCCN_DMNDT'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Tipo<br>Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
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
 p_id=>wwv_flow_api.id(23047792399007703)
,p_name=>'CDGO_ESTDO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ESTDO_EMBRGO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
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
 p_id=>wwv_flow_api.id(23047946303007705)
,p_name=>'FCHA_OFCIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(214959454764729328)
,p_name=>'Flujo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#" onclick="irFlujo(&ID_INSTNCIA_FLJO.)" style="color:blue" >',
'    <span class="fa fa-eye"></span>',
'</a>',
'',
'<!--<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Ir a flujo<span class="fa fa-external-link-square"></span></button>-->'))
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(214959578608729329)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(214960016519729334)
,p_name=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCNRIO'
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
 p_id=>wwv_flow_api.id(217813894939922115)
,p_name=>'NMRO_RSLCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RSLCN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('No.<br>Resoluci\00F3n ')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(217814208198922119)
,p_name=>'FCHA_RSLCN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RSLCN'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Fecha<br>Resoluci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(217814309860922120)
,p_name=>'NRO_OFICIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_OFICIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217814670599922123)
,p_name=>'NRO_OFCIO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_OFCIO_JZGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Oficio<br>Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(217814713659922124)
,p_name=>'FCHA_OFCIO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_OFCIO_JZGDO'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Oficio<br>Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(217814823252922125)
,p_name=>'RDCDO_JZGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RDCDO_JZGDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Radicado<br>Juzgado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(217814908204922126)
,p_name=>'CDGO_TPO_PRCSO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_PRCSO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo<br>Proceso'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217815065263922127)
,p_name=>'IDNTFCCION_DMNDTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Identificacion<br>Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217815136033922128)
,p_name=>'NMBRE_DMNDTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nombre<br>Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217815270872922129)
,p_name=>'NRO_PQR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_PQR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. PQR'
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
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217815353732922130)
,p_name=>'FCHA_PQR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PQR'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
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
 p_id=>wwv_flow_api.id(217815430371922131)
,p_name=>'OBSERVACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBSERVACION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(217815539180922132)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
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
 p_id=>wwv_flow_api.id(233562516783093229)
,p_name=>'Apexselector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(233410977652934357)
,p_internal_uid=>233410977652934357
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
 p_id=>wwv_flow_api.id(233488041287843589)
,p_interactive_grid_id=>wwv_flow_api.id(233410977652934357)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(233488071588843591)
,p_report_id=>wwv_flow_api.id(233488041287843589)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22818218299425935)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>62
,p_column_id=>wwv_flow_api.id(22799465567227026)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23053579954009548)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(23047596433007701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23054073441009550)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(23047698420007702)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23054544380009552)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(23047792399007703)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23073894708098527)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(23047946303007705)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(215020908721952133)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(214959454764729328)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(215022869393108291)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(214959578608729329)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(215025389786108302)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(214960016519729334)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217829046061392033)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(217813894939922115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217838323293720791)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(217814208198922119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217838889652720793)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(217814309860922120)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217840336034720806)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(217814670599922123)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217840811859720808)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(217814713659922124)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217841392039720810)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(217814823252922125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217841797719720812)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(217814908204922126)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217842225701720814)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(217815065263922127)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217842720812720816)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(217815136033922128)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217843220017720818)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(217815270872922129)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217843711333720824)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(217815353732922130)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217844228148720827)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>54
,p_column_id=>wwv_flow_api.id(217815430371922131)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(217844780724720828)
,p_view_id=>wwv_flow_api.id(233488071588843591)
,p_display_seq=>55
,p_column_id=>wwv_flow_api.id(217815539180922132)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(233412703660934374)
,p_plug_name=>'<b>Desembargo de Remanente</b>'
,p_region_name=>'desembargo'
,p_parent_plug_id=>wwv_flow_api.id(233481205563752329)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_dsmbrgos_rmnte',
'        ,a.id_embrgo_rmnte',
'        /*,a.nmro_rslcn',
'        ,a.fcha_rslcn',
'        ,a.nro_oficio',
'        ,a.fcha_ofcio',
'        ,a.nro_pqr',
'        ,a.fcha_pqr',
'        ,a.cdgo_estdo_embrgo',
'        ,a.cdgo_tpo_idntfccn_dmndt',
'        ,a.idntfccion_dmndte',
'        ,a.nmbre_dmndte*/',
'        ,a.id_fncnrio',
'        ,a.id_instncia_fljo',
'        ,a.id_slctud',
'        ,a.nmro_rdcdo_dsplay',
'        ,a.fcha_rdcdo',
'from v_mc_g_dsmbrgs_remanente a',
'--where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
';   '))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(233410864916934356)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(22798749171227019)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
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
 p_id=>wwv_flow_api.id(22798854674227020)
,p_name=>'ID_FNCNRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FNCNRIO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(22798951125227021)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(22858586307836102)
,p_name=>'Flujo'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver Flujo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#" onclick="irFlujo(&ID_INSTNCIA_FLJO.)" style="color:blue" >',
'    <span class="fa fa-eye"></span>',
'</a>',
'',
'<!--<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Ir a flujo<span class="fa fa-external-link-square"></span></button>-->'))
,p_link_target=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:RP:P162_ID_INSTNCIA_FLJO:&ID_INSTNCIA_FLJO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23048374234007709)
,p_name=>'ID_DSMBRGOS_RMNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DSMBRGOS_RMNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
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
 p_id=>wwv_flow_api.id(23048473173007710)
,p_name=>'ID_EMBRGO_RMNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RMNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(22799465567227026)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23049524583007721)
,p_name=>'NMRO_RDCDO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RDCDO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
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
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23049642003007722)
,p_name=>'FCHA_RDCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RDCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Fecha Radicado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(233412804027934375)
,p_internal_uid=>233412804027934375
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
 p_id=>wwv_flow_api.id(233501680624860067)
,p_interactive_grid_id=>wwv_flow_api.id(233412804027934375)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(233501754960860067)
,p_report_id=>wwv_flow_api.id(233501680624860067)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22811804071227329)
,p_view_id=>wwv_flow_api.id(233501754960860067)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(22798749171227019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22812308059227330)
,p_view_id=>wwv_flow_api.id(233501754960860067)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(22798854674227020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22812839847227332)
,p_view_id=>wwv_flow_api.id(233501754960860067)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(22798951125227021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(22863759649856249)
,p_view_id=>wwv_flow_api.id(233501754960860067)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(22858586307836102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88.555
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23089158342194007)
,p_view_id=>wwv_flow_api.id(233501754960860067)
,p_display_seq=>34
,p_column_id=>wwv_flow_api.id(23048374234007709)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23089679608194009)
,p_view_id=>wwv_flow_api.id(233501754960860067)
,p_display_seq=>35
,p_column_id=>wwv_flow_api.id(23048473173007710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23114961471401313)
,p_view_id=>wwv_flow_api.id(233501754960860067)
,p_display_seq=>46
,p_column_id=>wwv_flow_api.id(23049524583007721)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23115453718401314)
,p_view_id=>wwv_flow_api.id(233501754960860067)
,p_display_seq=>47
,p_column_id=>wwv_flow_api.id(23049642003007722)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(672515352325775127)
,p_plug_name=>'<b>Embargos Asociados a Remanente</b>'
,p_parent_plug_id=>wwv_flow_api.id(233481205563752329)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_embrgos_rslcion,',
'       a.cnsctvo_embrgo as consecutivo,',
'       to_char(a.fcha_rgstro_embrgo, ''DD/MM/YYYY'') as Fecha_Embargo,',
'       t.dscrpcion as Estado_Cartera,',
'       a.vgncias as Vigencias,',
'       a.dscrpcion_tipo_embargo as Tipo_Embargo,',
'       y.id_embrgos_rmnte,',
'       c.idntfccion',
'  from v_mc_g_embargos_resolucion a',
'  join mc_g_embargos_responsable c',
'    on c.id_embrgos_crtra = a.id_embrgos_crtra',
'  join v_sg_g_usuarios b',
'    on b.id_fncnrio = a.id_fncnrio',
'  join mc_d_estados_cartera t',
'    on t.id_estdos_crtra = a.id_estdos_crtra',
'   --and t.cdgo_estdos_crtra != ''D''',
'  join mc_g_embrgo_remnte_dtlle z',
'    on z.id_embrgos_rslcion = a.id_embrgos_rslcion',
'  join mc_g_embargos_remanente y',
'    on y.id_embrgos_rmnte = z.id_embrgos_rmnte',
'   and ltrim(y.idntfccion_dmnddo, ''0'') = ltrim(c.idntfccion, ''0'')',
'',
'--where rtrim(ltrim(c.idntfccion)) = rtrim(ltrim(:P202_IDNTFCCION_DMNDTE))',
'  /*and a.id_embrgos_rslcion  in  (select z.id_embrgos_rslcion',
'                                    from mc_g_embrgo_remnte_dtlle z',
'                                    join mc_g_embargos_remanente y on y.id_embrgos_rmnte = z.id_embrgos_rmnte',
'                                   where y.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'                                  )*/',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_api.id(233410864916934356)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(23130401592297806)
,p_name=>'ID_EMBRGOS_RMNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGOS_RMNTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_api.id(22799465567227026)
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28984438285643201)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Idntfccion'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(672515575987775129)
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
 p_id=>wwv_flow_api.id(672515629704775130)
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
 p_id=>wwv_flow_api.id(672515761935775131)
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
 p_id=>wwv_flow_api.id(672515879101775132)
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
 p_id=>wwv_flow_api.id(672515977151775133)
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
 p_id=>wwv_flow_api.id(672516013910775134)
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
 p_id=>wwv_flow_api.id(672515411398775128)
,p_internal_uid=>672515411398775128
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
 p_id=>wwv_flow_api.id(672530172982802239)
,p_interactive_grid_id=>wwv_flow_api.id(672515411398775128)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(672530241141802246)
,p_report_id=>wwv_flow_api.id(672530172982802239)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(23163977829497862)
,p_view_id=>wwv_flow_api.id(672530241141802246)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(23130401592297806)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28990414896643517)
,p_view_id=>wwv_flow_api.id(672530241141802246)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(28984438285643201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(672530721694802260)
,p_view_id=>wwv_flow_api.id(672530241141802246)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(672515575987775129)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(672531131161802265)
,p_view_id=>wwv_flow_api.id(672530241141802246)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(672515629704775130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(672531667891802267)
,p_view_id=>wwv_flow_api.id(672530241141802246)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(672515761935775131)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(672532108405802269)
,p_view_id=>wwv_flow_api.id(672530241141802246)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(672515879101775132)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(672532604730802272)
,p_view_id=>wwv_flow_api.id(672530241141802246)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(672515977151775133)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(672533100724802274)
,p_view_id=>wwv_flow_api.id(672530241141802246)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(672516013910775134)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(233573638205260528)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(214263225634239628)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(233378425212465234)
,p_button_name=>'btn_cnsltar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_column_attributes=>'style="top:25px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23129943758297801)
,p_name=>'P202_FCHA_RSLCN_INCIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(233378425212465234)
,p_prompt=>'<b>Fecha Inicio Res. Remanente</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha inicio de resoluci\00F3n de embargo remanente.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23130095875297802)
,p_name=>'P202_FCHA_RSLCN_FIN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(233378425212465234)
,p_prompt=>'<b>Fecha Fin Res. Remanente</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_tag_attributes=>'onkeypress="return false "'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha fin de resoluci\00F3n de embargo remanente.')
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23130300478297805)
,p_name=>'P202_ENTDAD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(233378425212465234)
,p_prompt=>'<b>Entidad</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.nmbre_rzon_scial as d ,b.id_entdad as r',
'from df_s_entidades b',
'where b.cdgo_entdad_tpo = ''JZG'''))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Entidad que solicita el embargo remanente.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'180'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(214263656508239628)
,p_name=>'P202_NRO_PQR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(233378425212465234)
,p_prompt=>'<b>No. PQR</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>26
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Numero de solicitud PQR del embargo remanente.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(214264535359239639)
,p_name=>'P202_NMRO_RSLCN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(233378425212465234)
,p_prompt=>'<b>No. Res. Remanente</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Numero de resoluci\00F3n de embargo remanente.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(214265405972239640)
,p_name=>'P202_NRO_OFICIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(233378425212465234)
,p_prompt=>'<b>No. Oficio</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Numero de oficio de respuesta del embargo remanente.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23130133983297803)
,p_name=>'Al cambiar fecha desde'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P202_FCHA_RSLCN_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23130238401297804)
,p_event_id=>wwv_flow_api.id(23130133983297803)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P202_FCHA_RSLCN_FIN").datepicker( ''option'' , ''minDate'' , $("#P202_FCHA_RSLCN_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(23122462042654601)
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
