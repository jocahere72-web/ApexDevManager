prompt --application/pages/page_00079
begin
wwv_flow_api.create_page(
 p_id=>79
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Declaraciones Periodos Formularios'
,p_step_title=>'Declaraciones Periodos Formularios'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251111170936'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18681730239427142)
,p_plug_name=>unistr('Opciones de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18682201830427147)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
 p_id=>wwv_flow_api.id(18682321516427148)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
'<i>',
unistr('Funcionalidad que permite gestionar los formulario asociados a un per\00EDodo.'),
'</i>',
'<br><br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(18682476711427149)
,p_plug_name=>'Formularios por Periodo'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion_vgncia_frmlrio,',
'        a.id_dclrcion_tpo_vgncia,',
'        a.id_frmlrio,',
'        a.cdgo_vslzcion,',
'        a.cdgo_tpo_dscnto_crrccion,',
'        a.actvo,',
'        a.alias,',
'        a.ind_aplca_dclrcion,',
'        a.indcdr_aplca_dscnto_actl,',
'        a.cdgo_tpo_autrzcion,',
'        a.indcdor_adjntos,',
'        a.indcdor_dlneacion,',
'        a.undad_drcion, ',
'        a.drcion, ',
'        a.dia_tpo',
'from    gi_d_dclrcnes_vgncias_frmlr a',
'where   exists(select       1',
'               from         gi_d_declaraciones_tipo     b',
'               inner join   gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcn_tpo =   b.id_dclrcn_tpo',
'               inner join   df_s_vigencias              d   on  d.vgncia        =   c.vgncia',
'               where        b.cdgo_clnte                =   :F_CDGO_CLNTE',
'               and          b.id_dclrcn_tpo             =   :P79_ID_DCLRCN_TPO',
'               and          c.id_dclrcion_tpo_vgncia    =   nvl(:P79_ID_DCLRCION_TPO_VGNCIA, c.id_dclrcion_tpo_vgncia)',
'               and          d.vgncia                    =   nvl(:P79_VGNCIA, d.vgncia)',
'               and          c.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'              )',
'and     a.id_frmlrio    =   nvl(:P79_ID_FRMLRIO, a.id_frmlrio);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4256236416896006)
,p_name=>'INDCDOR_DLNEACION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_DLNEACION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFAplica<br>Delineaci\00F3n Urbana?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(4256332907896007)
,p_name=>'UNDAD_DRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNDAD_DRCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unidad'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>unistr('STATIC:Minutos;MN,Horas;HR,D\00EDas;DI,Semanas;SM,Meses;MS')
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4256491635896008)
,p_name=>'DRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tiempo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_item_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
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
 p_id=>wwv_flow_api.id(4256502705896009)
,p_name=>'DIA_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIA_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Tipo de D\00EDas')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Habiles;H,Calendario;C'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18818982716494309)
,p_name=>'INDCDR_APLCA_DSCNTO_ACTL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDR_APLCA_DSCNTO_ACTL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Indicador Aplica <br>Descuento Actual'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Si;S,No;N'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18884211216829501)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18884385941829502)
,p_name=>'ID_DCLRCION_TPO_VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_TPO_VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.vgncia || '' - '' || b.prdo || '' - '' || b.dscrpcion,',
'            a.id_dclrcion_tpo_vgncia',
'from        gi_d_dclrcnes_tpos_vgncias  a',
'inner join  df_i_periodos               b   on  b.id_prdo   =   a.id_prdo',
'where   exists(select       1',
'               from         gi_d_declaraciones_tipo     c',
'               inner join   gi_d_dclrcnes_tpos_vgncias  d   on  d.id_dclrcn_tpo =   c.id_dclrcn_tpo',
'               inner join   df_s_vigencias              e   on  e.vgncia        =   d.vgncia',
'               where        c.cdgo_clnte                =   :F_CDGO_CLNTE',
'               and          c.id_dclrcn_tpo             =   :P79_ID_DCLRCN_TPO',
'               and          d.id_dclrcion_tpo_vgncia    =   nvl(:P79_ID_DCLRCION_TPO_VGNCIA, d.id_dclrcion_tpo_vgncia)',
'               and          e.vgncia                    =   nvl(:P79_VGNCIA, e.vgncia)',
'               and          d.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'              )',
'order by b.vgncia desc, b.prdo, b.dscrpcion;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P79_ID_DCLRCION_TPO_VGNCIA'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18884458462829503)
,p_name=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Formulario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_frmlrio || '' - '' || a.dscrpcion,',
'        a.id_frmlrio',
'from    gi_d_formularios    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     a.id_frmlrio    =   nvl(:P79_ID_FRMLRIO, a.id_frmlrio)',
'order by  a.cdgo_frmlrio, a.dscrpcion;'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P79_ID_FRMLRIO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18884590784829504)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFActivo?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>true
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
,p_default_type=>'STATIC'
,p_default_expression=>'S'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18884621679829505)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18884723409829506)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18885034085829509)
,p_name=>'CDGO_VSLZCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_VSLZCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Visualizaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Todos;T,Funcionarios;F,Contribuyentes;C'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31680094879798606)
,p_name=>'CDGO_TPO_AUTRZCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_AUTRZCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Tipo de<br>Autorizaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d,',
'       a.cdgo_tpo_autrzcion r',
'from gi_d_dclrcn_vgnc_frmlr_aut_tpo a',
'where a.actvo = ''S'''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(31680181696798607)
,p_name=>'INDCDOR_ADJNTOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_ADJNTOS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFCargar<br>Adjuntos?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(31710192432255801)
,p_name=>'IND_APLCA_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IND_APLCA_DCLRCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>unistr('\00BFAplica<br>Declaraci\00F3n?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'A'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'R'
,p_attribute_05=>'No'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(40837166454418613)
,p_name=>'ACTO_CNCPTO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Acto<br>Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.:RP,114:P114_ID_DCLRCION_VGNCIA_FRMLRIO,P114_ALIAS:&ID_DCLRCION_VGNCIA_FRMLRIO.,&ALIAS.'
,p_link_text=>'Ver<span class="fa fa-eye" aria-hidden="true"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(46754457017840913)
,p_name=>'RPRTE'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Reporte'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.:RP,116:P116_ID_DCLRCION_VGNCIA_FRMLRIO:&ID_DCLRCION_VGNCIA_FRMLRIO.'
,p_link_text=>'<span class="fa fa-print" aria-hidden="true"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_display_condition_type=>'NEVER'
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(50098390715119001)
,p_name=>'CDGO_TPO_DSCNTO_CRRCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_TPO_DSCNTO_CRRCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Aplicaci\00F3n Descuentos<br>de Correcci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'CENTER'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Porcentaje;P,Valor;V'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Seleccionar-'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(148714794629015828)
,p_name=>'ALIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALIAS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Alias'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.alias||'' - ''||a.id    as,',
'       a.alias      as r',
'from apex_190100.wwv_flow_steps a',
'where --a.flow_id = 150000 and ',
'upper(a.alias) like ''%DL_FRM%''',
'order by 1'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(18682575369427150)
,p_internal_uid=>18682575369427150
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
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
 p_id=>wwv_flow_api.id(18889841832830165)
,p_interactive_grid_id=>wwv_flow_api.id(18682575369427150)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(18889968149830166)
,p_report_id=>wwv_flow_api.id(18889841832830165)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3982813283578)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(31680094879798606)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4593382283587)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(31680181696798607)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(6659210013745)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(31710192432255801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4323777000377003)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(4256236416896006)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4380538317005122)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(4256332907896007)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4381160932005127)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(4256491635896008)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4381759119005129)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(4256502705896009)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18890478436830178)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(18884211216829501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18890981677830190)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(18884385941829502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18891488196830194)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(18884458462829503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>217
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18891992669830195)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(18884590784829504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18894618255836575)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(18884621679829505)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18912203918228286)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(18885034085829509)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(24806200836601595)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(18818982716494309)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(40846707439453699)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(40837166454418613)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(46769324423894365)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(46754457017840913)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(50104340899119175)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(50098390715119001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(148954309542378476)
,p_view_id=>wwv_flow_api.id(18889968149830166)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(148714794629015828)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16413861562495831)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18682201830427147)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(18682164681427146)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(18681730239427142)
,p_button_name=>'BTN_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16413979561495832)
,p_branch_action=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:RP,69::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16413861562495831)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18681848011427143)
,p_name=>'P79_ID_DCLRCN_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(18681730239427142)
,p_prompt=>unistr('Tipo de Declaraci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_dclrcn_tpo',
'from gi_d_declaraciones_tipo a',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.actvo = ''S''',
'   or a.cdgo_dclrcn_tpo in (''RTS'')',
' order by a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18681938884427144)
,p_name=>'P79_VGNCIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(18681730239427142)
,p_prompt=>'Vigencia'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.vgncia text,',
'        a.vgncia value',
'from    df_s_vigencias  a',
'where   exists(select       1',
'               from         gi_d_declaraciones_tipo     b',
'               inner join   gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcn_tpo =   b.id_dclrcn_tpo',
'               where        b.id_dclrcn_tpo =   :P79_ID_DCLRCN_TPO',
'               and          c.vgncia        =   a.vgncia',
'              )',
'order by a.vgncia desc;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P79_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P79_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18682051546427145)
,p_name=>'P79_ID_DCLRCION_TPO_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(18681730239427142)
,p_prompt=>'Periodo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.prdo || '' '' || b.dscrpcion,',
'            a.id_dclrcion_tpo_vgncia',
'from        gi_d_dclrcnes_tpos_vgncias  a',
'inner join  df_i_periodos               b   on  b.id_prdo   =   a.id_prdo',
'where       a.id_dclrcn_tpo =   :P79_ID_DCLRCN_TPO',
'and         a.vgncia        =   nvl(:P79_VGNCIA, a.vgncia)',
'order by    a.vgncia desc, b.prdo, b.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P79_VGNCIA'
,p_ajax_items_to_submit=>'P79_ID_DCLRCION_TPO_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18884916926829508)
,p_name=>'P79_ID_FRMLRIO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(18681730239427142)
,p_prompt=>'Formulario'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_frmlrio || '' - '' || a.dscrpcion,',
'        a.id_frmlrio',
'from    gi_d_formularios    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'order by  a.cdgo_frmlrio, a.dscrpcion;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18884884598829507)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(18682476711427149)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>unistr('Formularios por Periodo: Guardar Datos de Cuadr\00EDcula Interactiva')
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
