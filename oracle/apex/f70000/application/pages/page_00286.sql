prompt --application/pages/page_00286
begin
wwv_flow_api.create_page(
 p_id=>286
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n Archivo Declaraciones')
,p_step_title=>unistr('Gesti\00F3n Archivo Declaraciones')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function buildJsonCandidatos(){',
'',
'    var region = apex.region(''detalle'');',
'    ',
'    if(region){',
'        ',
'        var view = apex.region("detalle").widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        var jsonCandidatos = records.map((carga) => {',
'            return {"id_dcl_crga" : model.getValue(carga, "ID_DCLRCNES_CRGA"),',
'                   "id_frmlrio": model.getValue(carga, "ID_FRMLRIO")}; ',
'        });',
'        ',
'       ',
'        ',
'        console.log(jsonCandidatos[0].id_dcl_crga);',
'        $s(''P286_ID_DCL_CRGA'',jsonCandidatos[0].id_dcl_crga);',
'        $s(''P286_ID_DCL_FRMLRIO'',jsonCandidatos[0].id_frmlrio);',
'        window.localStorage.setItem(''jsonCandidatos'', JSON.stringify(jsonCandidatos));',
'        ',
'        //localStorage.getItem( ''id_dcl_crga'' );',
'        ',
'      ',
'    }',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20251119084241'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35170364078725102)
,p_plug_name=>'Declaraciones Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35170450333725103)
,p_plug_name=>'Detalle'
,p_region_name=>'detalle'
,p_parent_plug_id=>wwv_flow_api.id(35170364078725102)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  a.id_dclrcnes_crga, ',
'        a.id_dclrcion_vgncia_frmlrio, ',
'        b.dscrpcion_dclrcion_tpo, ',
'        b.vgncia,',
'        b.dscrpcion_prdcdad,',
'        b.dscrpcion_frmlrio,',
'        c.nmbre_bnco,',
'        d.nmro_cnta',
'from    v_gi_g_dclrcnes_vgncias_frmlr    b ',
'join    gi_g_dclrcnes_crga               a on a.id_dclrcion_vgncia_frmlrio = b.id_dclrcion_vgncia_frmlrio',
'join    df_c_bancos                      c on a.id_bnco = c.id_bnco',
'join    df_c_bancos_cuenta               d on a.id_bnco_cnta = d.id_bnco_cnta',
'where   a.id_crga = :P286_ID_CRGA;',
'*/',
'',
'',
'select ',
'id_dclrcnes_crga, 		',
'         id_dclrcion_vgncia_frmlrio,  ',
'		 		dscrpcion_dclrcion_tpo,	',
'        vgncia, 	 ',
'         dscrpcion_prdcdad,		 ',
'        			dscrpcion_frmlrio, ',
'        nmbre_bnco,',
'        nmro_cnta,',
'        id_frmlrio',
'',
'from(',
'',
'select  a.id_dclrcnes_crga, 		',
'        null id_dclrcion_vgncia_frmlrio,  ',
'		b.dscrpcion 		dscrpcion_dclrcion_tpo,	',
'        a.vgncia, 	 ',
'        null dscrpcion_prdcdad,		 ',
'        c.dscrpcion			dscrpcion_frmlrio, ',
'        d.nmbre_bnco,',
'        e.nmro_cnta,',
'        c.id_frmlrio',
'from    gi_g_dclrcnes_crga               a --on a.id_dclrcion_vgncia_frmlrio = b.id_dclrcion_vgncia_frmlrio',
'join    gi_d_declaraciones_tipo          b on a.id_dclrcn_tpo = b.id_dclrcn_tpo',
'join	gi_d_formularios                 c on a.id_frmlrio = c.id_frmlrio',
'join    df_c_bancos                      d on a.id_bnco = d.id_bnco',
'join    df_c_bancos_cuenta               e on a.id_bnco_cnta = e.id_bnco_cnta',
'where   a.cdgo_clnte = :F_CDGO_CLNTE',
'and     a.id_crga    = :P286_ID_CRGA',
'order by a.id_dclrcnes_crga desc)',
' fetch first 1 row only;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P286_ID_CRGA'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35170608625725105)
,p_name=>'ID_DCLRCNES_CRGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCNES_CRGA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'N'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35170772491725106)
,p_name=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_VGNCIA_FRMLRIO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(35170894106725107)
,p_name=>'DSCRPCION_DCLRCION_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_DCLRCION_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(35170973802725108)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
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
 p_id=>wwv_flow_api.id(35171008633725109)
,p_name=>'DSCRPCION_PRDCDAD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDCDAD'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35171149924725110)
,p_name=>'DSCRPCION_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_FRMLRIO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Formulario'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(35171204026725111)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(35171396083725112)
,p_name=>'NMRO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Cuenta')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(126350321196990903)
,p_name=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FRMLRIO'
,p_data_type=>'NUMBER'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(35170553206725104)
,p_internal_uid=>35170553206725104
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
 p_id=>wwv_flow_api.id(35252818711588487)
,p_interactive_grid_id=>wwv_flow_api.id(35170553206725104)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(35252995481588489)
,p_report_id=>wwv_flow_api.id(35252818711588487)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35253434517588491)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(35170608625725105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35253981620588493)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(35170772491725106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35254494817588495)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(35170894106725107)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>300
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35254967551588497)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(35170973802725108)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35255462077588498)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(35171008633725109)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35255970319588500)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(35171149924725110)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>290
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35256443571588502)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(35171204026725111)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35256990090588504)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(35171396083725112)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(126528685041766715)
,p_view_id=>wwv_flow_api.id(35252995481588489)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(126350321196990903)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35711773999562820)
,p_plug_name=>'Declaraciones No procesadas'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_crga as Id_Carga,',
'       b.nmbre_crga as Carga,',
'       a.ID_INTRMDIA_DIAN as Id_Intermedia_Dian,',
'       a.VGNCIA_GRVBLE as Vigencia,',
'       a.PRDO_GRVBLE as Periodo,',
'       a.TPO_IDNTFCCION as Tipo,',
unistr('       a.IDNTFCCION as Identificaci\00F3n,'),
unistr('       a.RZON_SCIAL as Raz\00F3n_Social,'),
'       a.MNSJE_PRCSDO as Mensaje',
'from gi_g_intermedia_dian a',
'     join v_et_g_procesos_carga b on a.id_prcso_crga= b.id_prcso_crga ',
'    where a.MNSJE_PRCSDO is not null ',
'    and a.indcdor_prcsdo in (''E'',''D'')',
'    and b.id_crga=:P286_ID_CRGA;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35710880847562811)
,p_plug_name=>'Declaraciones No procesadas'
,p_parent_plug_id=>wwv_flow_api.id(35711773999562820)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_crga as Id_Carga,',
'       b.nmbre_crga as Carga,       ',
'       a.VGNCIA_GRVBLE as Vigencia,',
'       a.PRDO_GRVBLE as Periodo,',
'       a.TPO_IDNTFCCION as Tipo,',
unistr('       a.IDNTFCCION as Identificaci\00F3n,'),
unistr('       a.RZON_SCIAL as Raz\00F3n_Social,'),
'       a.MNSJE_PRCSDO as Mensaje',
'from gi_g_intermedia_dian a',
'     join v_et_g_procesos_carga b on a.id_prcso_crga= b.id_prcso_crga ',
'    where a.MNSJE_PRCSDO is not null ',
'    and a.indcdor_prcsdo in (''E'',''D'')',
'    and b.id_crga=:P286_ID_CRGA;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(35712005629562823)
,p_name=>'VIGENCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VIGENCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
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
 p_id=>wwv_flow_api.id(35712105436562824)
,p_name=>'PERIODO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PERIODO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(35712271602562825)
,p_name=>'TIPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(35712381927562826)
,p_name=>unistr('IDENTIFICACI\00D3N')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('IDENTIFICACI\00D3N')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_api.id(35712490125562827)
,p_name=>unistr('RAZ\00D3N_SOCIAL')
,p_source_type=>'DB_COLUMN'
,p_source_expression=>unistr('RAZ\00D3N_SOCIAL')
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(35712572821562828)
,p_name=>'MENSAJE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MENSAJE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Mensaje'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(35713318419562836)
,p_name=>'ID_CARGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CARGA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(35713418510562837)
,p_name=>'CARGA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CARGA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(35710968308562812)
,p_internal_uid=>35710968308562812
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
 p_id=>wwv_flow_api.id(35728481032731070)
,p_interactive_grid_id=>wwv_flow_api.id(35710968308562812)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(35728523106731070)
,p_report_id=>wwv_flow_api.id(35728481032731070)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35771872547328891)
,p_view_id=>wwv_flow_api.id(35728523106731070)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(35712005629562823)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35772328160328893)
,p_view_id=>wwv_flow_api.id(35728523106731070)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(35712105436562824)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35772833305328895)
,p_view_id=>wwv_flow_api.id(35728523106731070)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(35712271602562825)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35773390018328897)
,p_view_id=>wwv_flow_api.id(35728523106731070)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(35712381927562826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35773885189328901)
,p_view_id=>wwv_flow_api.id(35728523106731070)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(35712490125562827)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35774258420328903)
,p_view_id=>wwv_flow_api.id(35728523106731070)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(35712572821562828)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35787744592329708)
,p_view_id=>wwv_flow_api.id(35728523106731070)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(35713318419562836)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(35788295254329712)
,p_view_id=>wwv_flow_api.id(35728523106731070)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(35713418510562837)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100855935298418603)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(100856952314421965)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <center>',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'        </b>',
'    </center>',
'</h5>',
'<p>',
'<b><i></i></b>Esta funcionalidad permite Parametrizar un proceso de carga del ETL, contando con las siguientes opciones:<br><br>',
'',
'<b><i>1.</i></b>Consultar los procesos de carga ya parametrizados.<br><br>',
'',
'<b><i>2.</i></b>Insertar nuevas parametrizaciones.',
'</p>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248649404928783699)
,p_plug_name=>'Procesamiento de Archivo de Declaraciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35524286119959876)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(100855935298418603)
,p_button_name=>'btn_rgstrar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35711890859562821)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(100855935298418603)
,p_button_name=>'btn_prcsr'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Registar No Procesadas'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_crga as Id_Carga,',
'       b.nmbre_crga as Carga,',
'       a.ID_INTRMDIA_DIAN as Id_Intermedia_Dian,',
'       a.VGNCIA_GRVBLE as Vigencia,',
'       a.PRDO_GRVBLE as Periodo,',
'       a.TPO_IDNTFCCION as Tipo,',
unistr('       a.IDNTFCCION as Identificaci\00F3n,'),
unistr('       a.RZON_SCIAL as Raz\00F3n_Social,'),
'       a.MNSJE_PRCSDO as Mensaje',
'from gi_g_intermedia_dian a',
'     join v_et_g_procesos_carga b on a.id_prcso_crga= b.id_prcso_crga ',
'    where a.MNSJE_PRCSDO is not null ',
'    and a.indcdor_prcsdo in (''E'',''D'')',
'    and b.id_crga=:P286_ID_CRGA;'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(190246295137622177)
,p_branch_name=>'Branch'
,p_branch_action=>'f?p=&P286_BRANCH_APP.:&P286_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP,123::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P286_BRANCH_PAGE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(190246698344622177)
,p_branch_name=>'Branch'
,p_branch_action=>'f?p=&APP_ID.:286:&SESSION.::&DEBUG.:RP,123::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NULL'
,p_branch_condition=>'P286_BRANCH_PAGE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35170254565725101)
,p_name=>'P286_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_prompt=>'Sub Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P286_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P286_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35530327615984043)
,p_name=>'P286_RGSTRR_CRRCCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_item_default=>'N'
,p_prompt=>unistr('Registrar duplicados c\00F3mo Correcci\00F3n?')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Si;S,No;N'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35712641947562829)
,p_name=>'P286_PRCSDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(125708655830171610)
,p_name=>'P286_ID_DCL_CRGA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(126350463874990904)
,p_name=>'P286_ID_DCL_FRMLRIO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(126350592141990905)
,p_name=>'P286_PRDCDD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_prompt=>'PERIODICIDAD'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  dscrpcion d, cdgo_prdcdad r',
'from   df_s_periodicidad',
'',
''))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190243082696622146)
,p_name=>'P286_ID_CRGA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_prompt=>'Proceso'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crga,',
'       id_crga',
'  from et_g_carga ',
'  where not id_crga in (',
'                          select id_crga ',
'                            from df_s_resolucion_carga',
'                      )',
' order by nmbre_crga'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190243373966622152)
,p_name=>'P286_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto  as d,',
'       id_impsto as r',
'  from df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and cdgo_impsto = ''ICA''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190244551109622157)
,p_name=>'P286_ARCHIVO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_prompt=>'Archivo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'      , a.id_prcso_crga as r',
'   from v_et_g_procesos_carga a',
'  where a.cdgo_clnte        = :F_CDGO_CLNTE',
'    and a.id_impsto         = :P286_IMPSTO',
'    and a.id_impsto_sbmpsto = :P286_IMPSTO_SBMPSTO',
'    and a.id_crga           = :P286_ID_CRGA',
'    and a.indcdor_prcsdo    = ''N''',
'    and exists( select 1',
'                from   gi_g_intermedia_dian c',
'                where  c.id_prcso_crga = a.id_prcso_crga',
'                group by a.id_prcso_crga',
'              );'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P286_ID_CRGA,P286_IMPSTO,P286_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P286_ID_CRGA,P286_IMPSTO,P286_IMPSTO_SBMPSTO,P286_ARCHIVO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190244950930622157)
,p_name=>'P286_BRANCH_APP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190245315628622158)
,p_name=>'P286_BRANCH_PAGE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(248649404928783699)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(35171418019725113)
,p_name=>'Al cambiar seleccion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P286_ARCHIVO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35171554713725114)
,p_event_id=>wwv_flow_api.id(35171418019725113)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P286_ARCHIVO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(35241951114975649)
,p_event_id=>wwv_flow_api.id(35171418019725113)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(125708404984171608)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(35170450333725103)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(125708549028171609)
,p_event_id=>wwv_flow_api.id(125708404984171608)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'buildJsonCandidatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(190245783612622175)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_cdgo_rspsta    number;',
'     v_mnsje_rspsta   varchar2(4000);',
'     --V_FRMLRIO        NUMBER;',
'     V_ID_BNCO        NUMBER;',
'     V_ID_BNCO_CNTA   NUMBER;',
'begin',
'    ',
'    ',
'    if  (:P286_IMPSTO is null or :P286_IMPSTO_SBMPSTO is null or :P286_ID_CRGA is null or :P286_ARCHIVO  is null) then',
unistr('        raise_application_error( -20001 , ''Error al registrar la informaci\00F3n. Diligencie todos los campos obligatorios! '' );'),
'    ',
'    ',
'    else',
'      begin      ',
'            ',
'            select  ',
'                c.id_bnco,',
'                d.id_bnco_cnta',
'            into',
'                v_id_bnco,',
'                v_id_bnco_cnta',
'            from    gi_g_dclrcnes_crga               a ',
'            join    df_c_bancos                      c on a.id_bnco = c.id_bnco',
'            join    df_c_bancos_cuenta               d on a.id_bnco_cnta = d.id_bnco_cnta',
'            where   a.id_dclrcnes_crga = :P286_ID_DCL_CRGA;',
'     exception',
'            when too_many_rows then',
unistr('                  raise_application_error( -20001 , ''Se encontr\00F3 mas de un registro'' );'),
'            when others then',
unistr('                  raise_application_error( -20001 , ''Error al procesar la informaci\00F3n'' );'),
'     end;',
'    ',
'   ',
'    pkg_gi_declaraciones_utlddes.prc_rg_declaracion_externa ( p_cdgo_clnte         => :F_CDGO_CLNTE',
'                                                             , p_id_impsto         => :P286_IMPSTO',
'                                                             , p_id_impsto_sbmpsto => :P286_IMPSTO_SBMPSTO                                      ',
'                                                             , p_id_usrio          => :F_ID_USRIO',
'                                                             , p_id_dcl_crga       => :P286_ID_DCL_CRGA',
'                                                             , p_id_frmlrio        => :P286_ID_DCL_FRMLRIO',
'                                                             , p_prdcdd            => :P286_PRDCDD',
'                                                             , p_id_prcso_crga     => :P286_ARCHIVO ',
'                                                             , p_id_dclrcion_vgncia_frmlrio => null',
'                                                             , p_id_bnco           => V_ID_BNCO                                   ',
'                                                             , p_id_bnco_cnta      => V_ID_BNCO_CNTA',
'                                                             , p_indcdor_prcsdo    =>''N''',
'                                                             , p_id_vld_dplcdo     => :P286_RGSTRR_CRRCCION',
'                                                             , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                                             , o_mnsje_rspsta      => v_mnsje_rspsta  );',
'   ',
'        if (v_cdgo_rspsta <> 0) then',
'            raise_application_error( -20001 , v_mnsje_rspsta );',
'        end if;',
'    ',
'    end if;',
'  end;',
''))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35524286119959876)
,p_process_success_message=>unistr('Proceso Realizado con \00C9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35713297108562835)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rgstrar No Prcsdos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_cdgo_rspsta    number;',
'     v_mnsje_rspsta   varchar2(4000);',
'     --V_FRMLRIO        NUMBER;',
'     V_ID_BNCO        NUMBER;',
'     V_ID_BNCO_CNTA   NUMBER;',
'begin',
'    ',
'   for c_dian in (select d.id_dclrcnes_crga,a.id_impsto,a.id_impsto_sbmpsto,c.id_prcso_crga,a.id_crga',
'                  from v_et_g_procesos_carga a',
'                  join gi_g_intermedia_dian c on a.id_prcso_crga= c.id_prcso_crga',
'                  join gi_g_dclrcnes_crga d on d.id_crga = a.id_crga',
'                  where c.indcdor_prcsdo in (''E'') and a.id_prcso_crga=28543)  loop ',
'    ',
'      begin      ',
'            ',
'            /*select ',
'            c_dian.id_dclrcnes_crga',
'                c.id_bnco,',
'                d.id_bnco_cnta',
'            into',
'                v_id_bnco,',
'                v_id_bnco_cnta',
'            from    gi_g_dclrcnes_crga               a ',
'            join    df_c_bancos                      c on a.id_bnco = c.id_bnco',
'            join    df_c_bancos_cuenta               d on a.id_bnco_cnta = d.id_bnco_cnta',
'            where   a.id_dclrcnes_crga = c_dian.ID_CRGA;*/',
'            ',
'            /*',
'                select d.id_dclrcnes_crga',
'                  from v_et_g_procesos_carga a',
'                  join gi_g_intermedia_dian c on a.id_prcso_crga= c.id_prcso_crga',
'                  join gi_g_dclrcnes_crga d on d.id_crga = a.id_crga',
'                  where c.indcdor_prcsdo in (''E'');',
'                  */',
'            ',
'            ',
'            ',
'            select  ',
'                c.id_bnco,',
'                d.id_bnco_cnta',
'            into',
'                v_id_bnco,',
'                v_id_bnco_cnta',
'            from    gi_g_dclrcnes_crga               a ',
'            join    df_c_bancos                      c on a.id_bnco = c.id_bnco',
'            join    df_c_bancos_cuenta               d on a.id_bnco_cnta = d.id_bnco_cnta',
'            where   a.id_dclrcnes_crga =:P286_ID_DCL_CRGA;',
'     exception',
'            when too_many_rows then',
unistr('                  raise_application_error( -20001 , ''Se encontr\00F3 mas de un registro'' );'),
'            when others then',
unistr('                  raise_application_error( -20001 , ''Error al procesar la informaci\00F3n'' );'),
'     end;',
'    ',
'   ',
'    pkg_gi_declaraciones_utlddes.prc_rg_declaracion_externa ( p_cdgo_clnte         => :F_CDGO_CLNTE',
'                                                             , p_id_impsto         => c_dian.ID_IMPSTO',
'                                                             , p_id_impsto_sbmpsto => c_dian.ID_IMPSTO_SBMPSTO                                    ',
'                                                             , p_id_usrio          => :F_ID_USRIO',
'                                                             , p_id_dcl_crga       => c_dian.id_dclrcnes_crga',
'                                                             , p_id_frmlrio        => :P286_ID_DCL_FRMLRIO',
'                                                             , p_prdcdd            => :P286_PRDCDD',
'                                                             , p_id_prcso_crga     => c_dian.ID_PRCSO_CRGA',
'                                                             , p_id_dclrcion_vgncia_frmlrio => null',
'                                                             , p_id_bnco           => v_id_bnco                                   ',
'                                                             , p_id_bnco_cnta      => v_id_bnco_cnta',
'                                                             , p_indcdor_prcsdo    =>''E''',
'                                                             , p_id_vld_dplcdo     => :P286_RGSTRR_CRRCCION',
'                                                             , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                                             , o_mnsje_rspsta      => v_mnsje_rspsta  );',
'                                                             ',
'                                                             ',
'                                                             ',
'     /*pkg_gi_declaraciones_utlddes.prc_rg_declaracion_externa ( p_cdgo_clnte         => :F_CDGO_CLNTE',
'                                                             , p_id_impsto         => :P286_IMPSTO',
'                                                             , p_id_impsto_sbmpsto => :P286_IMPSTO_SBMPSTO                                      ',
'                                                             , p_id_usrio          => :F_ID_USRIO',
'                                                             , p_id_dcl_crga       => :P286_ID_DCL_CRGA',
'                                                             , p_id_frmlrio        => :P286_ID_DCL_FRMLRIO',
'                                                             , p_prdcdd            => :P286_PRDCDD',
'                                                             , p_id_prcso_crga     => :P286_ARCHIVO ',
'                                                             , p_id_dclrcion_vgncia_frmlrio => null',
'                                                             , p_id_bnco           => V_ID_BNCO                                   ',
'                                                             , p_id_bnco_cnta      => V_ID_BNCO_CNTA',
'                                                             , p_indcdor_prcsdo    =>''N''',
'                                                             , p_id_vld_dplcdo     => :P286_RGSTRR_CRRCCION',
'                                                             , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                                             , o_mnsje_rspsta      => v_mnsje_rspsta  );*/',
'   ',
'        if (v_cdgo_rspsta <> 0) then',
'            raise_application_error( -20001 , v_mnsje_rspsta );',
'        end if;',
'    ',
'    end loop;',
'  end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35711890859562821)
);
end;
/
