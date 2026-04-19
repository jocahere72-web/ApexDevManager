prompt --application/pages/page_00245
begin
wwv_flow_api.create_page(
 p_id=>245
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Finalizaci\00F3n Titulos')
,p_step_title=>unistr('Finalizaci\00F3n Titulos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACONDE'
,p_last_upd_yyyymmddhh24miss=>'20250619144945'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87964473893694378)
,p_plug_name=>unistr('T\00EDtulos Registrados')
,p_region_name=>'titulos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   a.id_ttlo_jdcial',
'        ,a.cdgo_clnte',
'        ,a.id_ttlo_jdcial_crgdo',
'        ,a.nmro_ttlo_jdcial',
'        ,a.fcha_cnsttcion',
'        ,a.vlor',
'        --,a.idntfccion_dmndnte',
'        --,a.nmbre_dmndnte',
'        ,decode(a.id_ttlo_jdcial_area,a.id_ttlo_jdcial_area, c.nmbre_area , ''-'') as id_ttlo_jdcial_area',
'        ,decode(a.cdgo_idntfccion_tpo_dmnddo, a.cdgo_idntfccion_tpo_dmnddo, b.dscrpcion_idntfccion_tpo, ''-'') as cdgo_idntfccion_tpo_dmnddo',
'        ,a.idntfccion_dmnddo',
'        ,a.nmbre_dmnddo',
'        ,a.nmro_ttlo_pdre',
'        ,a.id_ttlo_pdre',
'        ,a.cdgo_entdad_cnsgnnte||'' - ''||d.nmbre_bnco as cdgo_entdad_cnsgnnte',
'        ,a.id_bnco_cnsgnnte',
'        ,decode(a.cdgo_ttlo_jdcial_estdo, a.cdgo_ttlo_jdcial_estdo, f.dscrpcion, ''-'') as cdgo_ttlo_jdcial_estdo',
'        ,a.id_embrgo_rslcion',
'        ,a.id_instncia_fljo_pdre',
'        ,a.id_instncia_fljo',
'        ,a.id_slctud',
'        ,a.cdgo_entdad_rcddr||'' - ''||e.nmbre_bnco as cdgo_entdad_rcddr',
'        ,a.id_bnco_rcddr',
'        ,a.cnsctvo_embrgo',
'from gf_g_titulos_judicial a',
'join df_s_identificaciones_tipo b on b.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'join df_c_areas c on c.id_area = a.id_ttlo_jdcial_area',
'join df_c_bancos d on d.id_bnco = a.id_bnco_cnsgnnte',
'join df_c_bancos e on e.id_bnco = a.id_bnco_rcddr',
'left join gf_d_titulos_judicial_estdo f on f.cdgo_ttlo_jdcial_estdo = a.cdgo_ttlo_jdcial_estdo',
'--left join mc_g_embargos_resolucion g on g.id_embrgos_rslcion = a.id_embrgo_rslcion',
'--where a.id_instncia_fljo is null',
'where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'--and a.idntfccion_dmnddo = :P245_IDNTFCCION'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(5560762318461403)
,p_name=>'ACTOS'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver Actos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" >Actos',
'<span class="fa fa-external-link-square"></span>',
'</button>'))
,p_link_target=>'f?p=&APP_ID.:2025031:&SESSION.::&DEBUG.:RP,2025031:P2025031_ID_TTLO_JDCIAL,P2025031_NMRO_TTLO_JDCIAL:&ID_TTLO_JDCIAL.,&NMRO_TTLO_JDCIAL.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87964611723694380)
,p_name=>'ID_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(87964757270694381)
,p_name=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CLNTE'
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
 p_id=>wwv_flow_api.id(87964840476694382)
,p_name=>'ID_TTLO_JDCIAL_CRGDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_CRGDO'
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
 p_id=>wwv_flow_api.id(87964934796694383)
,p_name=>'NMRO_TTLO_JDCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_JDCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87965041330694384)
,p_name=>'FCHA_CNSTTCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNSTTCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Fecha<br>Constituci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87965179301694385)
,p_name=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Valor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(87965424954694388)
,p_name=>'ID_TTLO_JDCIAL_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_JDCIAL_AREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('\00C1rea')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87965592635694390)
,p_name=>'IDNTFCCION_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Identificaci\00F3n<br>Demandado')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87965711544694391)
,p_name=>'NMBRE_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Nombre<br>Demandado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87965879613694392)
,p_name=>'NMRO_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_TTLO_PDRE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('N\00FAmero T\00EDtulo<br>Judicial Padre')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87965929628694393)
,p_name=>'ID_TTLO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_TTLO_PDRE'
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
 p_id=>wwv_flow_api.id(87966049315694394)
,p_name=>'CDGO_ENTDAD_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_CNSGNNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Consignante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87966148833694395)
,p_name=>'ID_BNCO_CNSGNNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_CNSGNNTE'
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87966275521694396)
,p_name=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TTLO_JDCIAL_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Estado T\00EDtulo<br>Judicial')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Consignar;CNS,Devolver;DVL,Fraccionar;FRC,Rechazar;RCH'
,p_lov_display_extra=>true
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87966304417694397)
,p_name=>'ID_EMBRGO_RSLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_EMBRGO_RSLCION'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(87966406030694398)
,p_name=>'ID_INSTNCIA_FLJO_PDRE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_PDRE'
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
 p_id=>wwv_flow_api.id(87966570454694399)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(87966638609694400)
,p_name=>'ID_SLCTUD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SLCTUD'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Id Solicitud<br>PQR'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87966760253694401)
,p_name=>'CDGO_ENTDAD_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ENTDAD_RCDDR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Entidad<br>Recaudadora'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(87966804173694402)
,p_name=>'ID_BNCO_RCDDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_BNCO_RCDDR'
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88112454027350185)
,p_name=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_IDNTFCCION_TPO_DMNDDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Tipo<br>Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(88141482737964507)
,p_name=>'CNSCTVO_EMBRGO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CNSCTVO_EMBRGO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Consecutivo<br>Embargo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(87964566173694379)
,p_internal_uid=>87964566173694379
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
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
 p_id=>wwv_flow_api.id(87973636083718708)
,p_interactive_grid_id=>wwv_flow_api.id(87964566173694379)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(87973733920718710)
,p_report_id=>wwv_flow_api.id(87973636083718708)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(5569268850525534)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(5560762318461403)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(71267251388164961)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(88112454027350185)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87974261444718712)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(87964611723694380)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87974788973718714)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(87964757270694381)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87975206845718715)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(87964840476694382)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87975741034718717)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(87964934796694383)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87976278666718719)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(87965041330694384)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87976775006718720)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(87965179301694385)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87978229457718725)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(87965424954694388)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87979285174718728)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(87965592635694390)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87979715113718729)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(87965711544694391)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>163
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87980254809718731)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(87965879613694392)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87980753862718732)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(87965929628694393)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87981230892718734)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(87966049315694394)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87981700677718735)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(87966148833694395)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87982277632718737)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(87966275521694396)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>154
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87982718514718738)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(87966304417694397)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87983208358718740)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(87966406030694398)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87983789951718743)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(87966570454694399)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87984223341718745)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(87966638609694400)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87984790839718747)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(87966760253694401)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>131
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(87985206209718749)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(87966804173694402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(88239155208867917)
,p_view_id=>wwv_flow_api.id(87973733920718710)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(88141482737964507)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(427479722797929941)
,p_plug_name=>unistr('<b>Proceso Puntual T\00EDtulo Judicial  No.  &P245_NMRO_TTLO_JDCIAL.</b>')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
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
 p_id=>wwv_flow_api.id(458344412669921099)
,p_plug_name=>unistr('Datos T\00EDtulo')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(658040384449126912)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(16016579397849605)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(658040384449126912)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:249:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16008906362840603)
,p_name=>'P245_AREA_DMNDNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_prompt=>'Demandante'
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
 p_id=>wwv_flow_api.id(16009686151840659)
,p_name=>'P245_NMBRE_DMNDDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_prompt=>'Demandado'
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
 p_id=>wwv_flow_api.id(16010090898840660)
,p_name=>'P245_NMRO_TTLO_JDCIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_prompt=>unistr('N\00B0 T\00EDtulo')
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
 p_id=>wwv_flow_api.id(16010447628840668)
,p_name=>'P245_FCHA_CNSTTCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_prompt=>unistr('Fecha Constituci\00F3n')
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
 p_id=>wwv_flow_api.id(16010808009840668)
,p_name=>'P245_CDGO_TTLO_JDCIAL_ESTDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_prompt=>'Estado'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_TITULOS_ESTADOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_ttlo_jdcial_estdo as r',
'  from gf_d_titulos_judicial_estdo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16011297383840669)
,p_name=>'P245_NMBRE_BNCO_CNSGNNTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_prompt=>'Banco Consignante'
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
 p_id=>wwv_flow_api.id(16011610855840671)
,p_name=>'P245_VLOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_prompt=>'Valor'
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
 p_id=>wwv_flow_api.id(16012026044840671)
,p_name=>'P245_ID_INSTNCIA_FLJO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16012475003840671)
,p_name=>'P245_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(87964473893694378)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16013217936840673)
,p_name=>'P245_SLDO_MDDA_CTLAR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16013647746840673)
,p_name=>'P245_VLOR_TTLO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16014098507840673)
,p_name=>'P245_JSON'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(87964473893694378)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16014424680840673)
,p_name=>'P245_ID_SJTO_IMPSTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16014883328840674)
,p_name=>'P245_ID_IMPSTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16015282526840674)
,p_name=>'P245_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(458344412669921099)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18047396902086494)
,p_name=>'P245_IDNTFCCION_DMNDDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(87964473893694378)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18047703199086495)
,p_name=>'P245_ID_TTLO_JDCIAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(87964473893694378)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16015694330843076)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue de Datos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     select ',
'            --id_ttlo_jdcial',
'              nmro_ttlo_jdcial',
'            /*, upper(nmbre_dmndnte) nmbre_dmndnte',
'            , idntfccion_dmnddo',
'            , upper(nmbre_dmnddo) nmbre_dmnddo',
'            , nmro_ttlo_jdcial',
'            , fcha_cnsttcion',
'            , cdgo_ttlo_jdcial_estdo',
'            , nmbre_bnco_cnsgnnte',
'            , to_char(vlor, :F_FRMTO_MNDA) vlor',
'            , id_instncia_fljo',
'            , id_ttlo_jdcial',
'            , vlor vlor_ttlo*/',
'            --, id_embrgo_rslcion',
'        into --:P245_ID_TTLO_JDCIAL',
'             :P245_NMRO_TTLO_JDCIAL',
'            /*,:P245_AREA_DMNDNTE',
'            ,:P245_IDNTFCCION_DMNDDO',
'            ,:P245_NMBRE_DMNDDO',
'            ,:P245_NMRO_TTLO_JDCIAL',
'            ,:P245_FCHA_CNSTTCION',
'            ,:P245_CDGO_TTLO_JDCIAL_ESTDO',
'            ,:P245_NMBRE_BNCO_CNSGNNTE',
'            ,:P245_VLOR ',
'            ,:P245_ID_INSTNCIA_FLJO',
'            ,:P245_VLOR_TTLO*/',
'            --,:P245_ID_EMBRGOS_RSLCION',
'       from v_gf_g_titulos_judicial',
'      where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'fetch first 1 rows only  ;',
' ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'F_ID_INSTNCIA_FLJO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18119178372783301)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Construir JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'        select json_arrayagg(',
'                   json_object (',
'                       ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                   )',
'               ) as json_titulos',
'        into :P245_JSON',
'        from (',
'            select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'            where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'        );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18119214449783302)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar estado final'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_cdgo_ttlo_jdcial_estdo    varchar2(1000);',
'begin',
'   ',
'    for c_ttlos in (select id_ttlo_jdcial',
'                    from json_table(:P245_JSON, ''$[*]'' columns (id_ttlo_jdcial         varchar2 path ''$.id_ttlo_jdcial''))',
'    ) loop',
'        begin',
'            select a.cdgo_ttlo_jdcial_estdo',
'            into v_cdgo_ttlo_jdcial_estdo',
'            from gf_g_titulos_judicial a',
'            where a.id_ttlo_jdcial = c_ttlos.id_ttlo_jdcial;',
'        end;',
'        if v_cdgo_ttlo_jdcial_estdo = ''CNS'' then',
'           pkg_gf_titulos_judicial.prc_ac_estdo_titulo_fnal(p_cdgo_clnte	    => :F_CDGO_CLNTE,',
'                                                            p_id_ttlo_jdcial    => c_ttlos.id_ttlo_jdcial,',
'                                                            p_estdo             => ''ATJ'',',
'                                                            p_id_usrio		    => :F_ID_USRIO,',
'                                                            o_cdgo_rspsta	    => v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta	    => :P245_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P245_RSPSTA);',
'            end if;',
'        elsif v_cdgo_ttlo_jdcial_estdo in (''SDT'', ''CDT'') then',
'           pkg_gf_titulos_judicial.prc_ac_estdo_titulo_fnal(p_cdgo_clnte	=> :F_CDGO_CLNTE,',
'                                                            p_id_ttlo_jdcial    => c_ttlos.id_ttlo_jdcial,',
'                                                            p_estdo             => ''DVL'',',
'                                                            p_id_usrio		=> :F_ID_USRIO,',
'                                                            o_cdgo_rspsta	=> v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta	=> :P245_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P245_RSPSTA);',
'            end if;',
'        elsif v_cdgo_ttlo_jdcial_estdo = ''FRC'' then',
'           pkg_gf_titulos_judicial.prc_ac_estdo_titulo_fnal(p_cdgo_clnte	=> :F_CDGO_CLNTE,',
'                                                            p_id_ttlo_jdcial    => c_ttlos.id_ttlo_jdcial,',
'                                                            p_estdo             => ''FRD'',',
'                                                            p_id_usrio		=> :F_ID_USRIO,',
'                                                            o_cdgo_rspsta	=> v_cdgo_rspsta,',
'                                                            o_mnsje_rspsta	=> :P245_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P245_RSPSTA);',
'            end if;',
'        end if;',
'    end loop;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
