prompt --application/pages/page_00021
begin
wwv_flow_api.create_page(
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Declaraciones Gesti\00F3n')
,p_step_title=>unistr('Declaraciones Gesti\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20241127164035'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82732616599639631)
,p_plug_name=>unistr('GESTI\00D3N DE DECLARACIONES &P21_NMBRE_IMPSTO_SBMPSTO.')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4081901146479106)
,p_plug_name=>unistr('GESTI\00D3N DE DECLARACIONES &P21_NMBRE_IMPSTO_SBMPSTO.')
,p_parent_plug_id=>wwv_flow_api.id(82732616599639631)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'join    sg_g_usrios_sjto_impsto     h   on  h.id_sjto_impsto            =   a.id_sjto_impsto',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte            =   :F_CDGO_CLNTE',
'and     a.id_impsto             =   :P21_ID_IMPSTO',
'and     a.id_impsto_sbmpsto     =   :P21_ID_IMPSTO_SBMPSTO',
'and     h.id_usrio              =   :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo   <>  ''RLA'';*/',
'/*',
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'--join    sg_g_usrios_sjto_impsto     h   on  h.id_sjto_impsto            =   a.id_sjto_impsto',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte            =  :F_CDGO_CLNTE       ',
'and     a.id_impsto             =  :P21_ID_IMPSTO         -- 230012 --',
'--and     a.id_impsto_sbmpsto     =  :P21_ID_IMPSTO_SBMPSTO --2300122 --',
'and     i.idntfccion_sjto       =  :P21_IDNTIFCCION       --''204069''',
'--and     h.id_usrio              =   :F_ID_USRIO',
'and     a.id_usrio_rgstro       =   :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo   <>  ''RLA''; */',
'',
'--comentado por AQUINTERO el 03/06/2021',
'/*select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo,',
'        a.id_usrio_rgstro,',
'        a.fcha_prsntcion_pryctda,',
'        a.fcha_prsntcion,',
'        h.fcha_fnal',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'join    gi_d_dclrcnes_fcha_prsntcn  h   on  h.id_dclrcion_tpo_vgncia    =   e.id_dclrcion_tpo_vgncia',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte                =  :F_CDGO_CLNTE       ',
'and     a.id_impsto                 =  :P21_ID_IMPSTO          ',
'and     i.idntfccion_sjto           =  :P21_IDNTIFCCION       ',
'and     a.id_usrio_rgstro           =  :F_ID_USRIO',
'and     h.fcha_fnal                 >= sysdate',
'and     a.cdgo_dclrcion_estdo       <>  ''RLA''',
'union',
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo,',
'        a.id_usrio_rgstro,',
'        a.fcha_prsntcion_pryctda,',
'        a.fcha_prsntcion,',
'        h.fcha_fnal',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'join    gi_d_dclrcnes_fcha_prsntcn  h   on  h.id_dclrcion_tpo_vgncia    =   e.id_dclrcion_tpo_vgncia',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte                =  :F_CDGO_CLNTE       ',
'and     a.id_impsto                 =  :P21_ID_IMPSTO         ',
'and     i.idntfccion_sjto           =  :P21_IDNTIFCCION ',
'and     a.id_usrio_rgstro           =  :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo       in (''APL'',''PRS'');*/',
'',
unistr('--a\00F1adido por AQUINTERO el 03/06/2021'),
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'--        a.id_usrio_rgstro,',
'--        a.fcha_prsntcion_pryctda,',
'--        a.fcha_prsntcion,',
'--        h.fcha_fnal',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'join    gi_d_dclrcnes_fcha_prsntcn  h   on  h.id_dclrcion_tpo_vgncia    =   e.id_dclrcion_tpo_vgncia',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte                =  :F_CDGO_CLNTE   ',
'and     a.id_impsto                 =  :P21_ID_IMPSTO ',
'and     i.idntfccion_sjto           =  :P21_IDNTIFCCION ',
'--and     a.id_usrio_rgstro           =  :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo       in (''APL'',''PRS'',''AUT'') -- Se adiciona el estado AUT para las que se quieran pagar por PSE  24/02/2023',
'group by ',
' a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo,',
'        c.dscrpcion,',
'        f.dscrpcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P21_IDNTIFCCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'--join    sg_g_usrios_sjto_impsto     h   on  h.id_sjto_impsto            =   a.id_sjto_impsto',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte            =  :F_CDGO_CLNTE       ',
'and     a.id_impsto             =  :P21_ID_IMPSTO         -- 230012 --',
'--and     a.id_impsto_sbmpsto     =  :P21_ID_IMPSTO_SBMPSTO --2300122 --',
'and     i.idntfccion_sjto       =  :P21_IDNTIFCCION       --''204069''',
'--and     h.id_usrio              =   :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo   <>  ''RLA''',
'and (:P21_CDGO_ASCDO = ''N'' or :P21_CDGO_ASCDO = null)'))
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4082585734479112)
,p_name=>'DSCRPCION_TPO_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TPO_DCLRCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Tipo de Declaraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4082627418479113)
,p_name=>'ID_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4082784583479114)
,p_name=>'DSCRPCION_DCLRCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_DCLRCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(4082856404479115)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(4082969456479116)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>93
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
 p_id=>wwv_flow_api.id(4083022572479117)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre o Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(4083133377479118)
,p_name=>'NMRO_CNSCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNSCTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Consecutivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_ID_DCLRCION:&ID_DCLRCION.'
,p_link_text=>'&NMRO_CNSCTVO.'
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
 p_id=>wwv_flow_api.id(4083280556479119)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(4082432995479111)
,p_internal_uid=>4082432995479111
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
 p_id=>wwv_flow_api.id(4093044698051609)
,p_interactive_grid_id=>wwv_flow_api.id(4082432995479111)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(4093195688051609)
,p_report_id=>wwv_flow_api.id(4093044698051609)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4093676449051611)
,p_view_id=>wwv_flow_api.id(4093195688051609)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(4082585734479112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4094172453051614)
,p_view_id=>wwv_flow_api.id(4093195688051609)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(4082627418479113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4094620620051616)
,p_view_id=>wwv_flow_api.id(4093195688051609)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(4082784583479114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4095127812051618)
,p_view_id=>wwv_flow_api.id(4093195688051609)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(4082856404479115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4095601706051619)
,p_view_id=>wwv_flow_api.id(4093195688051609)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(4082969456479116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4096074112051621)
,p_view_id=>wwv_flow_api.id(4093195688051609)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(4083022572479117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4096534445051623)
,p_view_id=>wwv_flow_api.id(4093195688051609)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(4083133377479118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(4097045869051625)
,p_view_id=>wwv_flow_api.id(4093195688051609)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(4083280556479119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5218564722825113)
,p_plug_name=>'consulta de Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(82732616599639631)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'--join    sg_g_usrios_sjto_impsto     h   on  h.id_sjto_impsto            =   a.id_sjto_impsto',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte            =  :F_CDGO_CLNTE       ',
'and     a.id_impsto             =  :P21_ID_IMPSTO         -- 230012 --',
'--and     a.id_impsto_sbmpsto     =  :P21_ID_IMPSTO_SBMPSTO --2300122 --',
'and     i.idntfccion_sjto       =  :P21_IDNTIFCCION       --''204069''',
'--and     h.id_usrio              =   :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo  NOT IN  (''RLA'',''AUT'',''REG'') ;'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82730878807639613)
,p_plug_name=>unistr('GESTI\00D3N DE DECLARACIONES &P21_NMBRE_IMPSTO_SBMPSTO.')
,p_parent_plug_id=>wwv_flow_api.id(82732616599639631)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'join    sg_g_usrios_sjto_impsto     h   on  h.id_sjto_impsto            =   a.id_sjto_impsto',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte            =   :F_CDGO_CLNTE',
'and     a.id_impsto             =   :P21_ID_IMPSTO',
'and     a.id_impsto_sbmpsto     =   :P21_ID_IMPSTO_SBMPSTO',
'and     h.id_usrio              =   :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo   <>  ''RLA'';*/',
'/*',
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'--join    sg_g_usrios_sjto_impsto     h   on  h.id_sjto_impsto            =   a.id_sjto_impsto',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte            =  :F_CDGO_CLNTE       ',
'and     a.id_impsto             =  :P21_ID_IMPSTO         -- 230012 --',
'--and     a.id_impsto_sbmpsto     =  :P21_ID_IMPSTO_SBMPSTO --2300122 --',
'and     i.idntfccion_sjto       =  :P21_IDNTIFCCION       --''204069''',
'--and     h.id_usrio              =   :F_ID_USRIO',
'and     a.id_usrio_rgstro       =   :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo   <>  ''RLA''; */',
'',
'--comentado por AQUINTERO el 03/06/2021',
'/*select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo,',
'        a.id_usrio_rgstro,',
'        a.fcha_prsntcion_pryctda,',
'        a.fcha_prsntcion,',
'        h.fcha_fnal',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'join    gi_d_dclrcnes_fcha_prsntcn  h   on  h.id_dclrcion_tpo_vgncia    =   e.id_dclrcion_tpo_vgncia',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte                =  :F_CDGO_CLNTE       ',
'and     a.id_impsto                 =  :P21_ID_IMPSTO          ',
'and     i.idntfccion_sjto           =  :P21_IDNTIFCCION       ',
'and     a.id_usrio_rgstro           =  :F_ID_USRIO',
'and     h.fcha_fnal                 >= sysdate',
'and     a.cdgo_dclrcion_estdo       <>  ''RLA''',
'union',
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo,',
'        a.id_usrio_rgstro,',
'        a.fcha_prsntcion_pryctda,',
'        a.fcha_prsntcion,',
'        h.fcha_fnal',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'join    gi_d_dclrcnes_fcha_prsntcn  h   on  h.id_dclrcion_tpo_vgncia    =   e.id_dclrcion_tpo_vgncia',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte                =  :F_CDGO_CLNTE       ',
'and     a.id_impsto                 =  :P21_ID_IMPSTO         ',
'and     i.idntfccion_sjto           =  :P21_IDNTIFCCION ',
'and     a.id_usrio_rgstro           =  :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo       in (''APL'',''PRS'');*/',
'',
unistr('--a\00F1adido por AQUINTERO el 03/06/2021'),
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'--        a.id_usrio_rgstro,',
'--        a.fcha_prsntcion_pryctda,',
'--        a.fcha_prsntcion,',
'--        h.fcha_fnal',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'join    gi_d_dclrcnes_fcha_prsntcn  h   on  h.id_dclrcion_tpo_vgncia    =   e.id_dclrcion_tpo_vgncia',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_sujetos_asociados      k   on  k.id_sjto_impsto            =   a.id_sjto_impsto ',
'where   a.cdgo_clnte                =  :F_CDGO_CLNTE   ',
'and     a.id_impsto                 =  :P21_ID_IMPSTO ',
'and     i.idntfccion_sjto           =  :P21_IDNTIFCCION ',
'--and     a.id_usrio_rgstro           =  :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo       in (''APL'',''PRS'',''AUT'') -- Se adiciona el estado AUT para las que se quieran pagar por PSE  24/02/2023',
'and k.id_usrio = :F_ID_USRIO AND k.actvo = ''S''',
'group by ',
' a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo,',
'        c.dscrpcion,',
'        f.dscrpcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P21_IDNTIFCCION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion,',
'        a.nmro_cnsctvo,',
'        j.nmbre_rzon_scial,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        i.idntfccion_sjto,',
'        g.dscrpcion_dclrcion_estdo',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo',
'--join    sg_g_usrios_sjto_impsto     h   on  h.id_sjto_impsto            =   a.id_sjto_impsto',
'join    v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto            =   a.id_sjto_impsto',
'join    si_i_personas               j   on  j.id_sjto_impsto            =   a.id_sjto_impsto',
'where   a.cdgo_clnte            =  :F_CDGO_CLNTE       ',
'and     a.id_impsto             =  :P21_ID_IMPSTO         -- 230012 --',
'--and     a.id_impsto_sbmpsto     =  :P21_ID_IMPSTO_SBMPSTO --2300122 --',
'and     i.idntfccion_sjto       =  :P21_IDNTIFCCION       --''204069''',
'--and     h.id_usrio              =   :F_ID_USRIO',
'and     a.cdgo_dclrcion_estdo   <>  ''RLA''',
'and     :P21_CDGO_ASCDO = ''S'''))
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(78375142347450336)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre o Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
 p_id=>wwv_flow_api.id(82731908877639624)
,p_name=>'NMRO_CNSCTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNSCTVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Consecutivo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_ID_DCLRCION:&ID_DCLRCION.'
,p_link_text=>'&NMRO_CNSCTVO.'
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
 p_id=>wwv_flow_api.id(82732180185639626)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(82732247276639627)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>93
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
 p_id=>wwv_flow_api.id(82732390353639628)
,p_name=>'DSCRPCION_TPO_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TPO_DCLRCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Tipo de Declaraci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(82732466813639629)
,p_name=>'ID_DCLRCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION'
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
 p_id=>wwv_flow_api.id(82732529699639630)
,p_name=>'DSCRPCION_DCLRCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_DCLRCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
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
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83693857210840836)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(82731881524639623)
,p_internal_uid=>82731881524639623
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
 p_id=>wwv_flow_api.id(83317830422137991)
,p_interactive_grid_id=>wwv_flow_api.id(82731881524639623)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(83317909499137991)
,p_report_id=>wwv_flow_api.id(83317830422137991)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83318454247137993)
,p_view_id=>wwv_flow_api.id(83317909499137991)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(82731908877639624)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83319485719137997)
,p_view_id=>wwv_flow_api.id(83317909499137991)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(82732180185639626)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83319963811137999)
,p_view_id=>wwv_flow_api.id(83317909499137991)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(82732247276639627)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83320464651138001)
,p_view_id=>wwv_flow_api.id(83317909499137991)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(82732390353639628)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83320970632138004)
,p_view_id=>wwv_flow_api.id(83317909499137991)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(82732466813639629)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83321422014138006)
,p_view_id=>wwv_flow_api.id(83317909499137991)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(82732529699639630)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84907952957139888)
,p_view_id=>wwv_flow_api.id(83317909499137991)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(83693857210840836)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84911061532297938)
,p_view_id=>wwv_flow_api.id(83317909499137991)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(78375142347450336)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5218747721825115)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5218564722825113)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82732765492639632)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(82732616599639631)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1:P1_ID_MNU:3'
,p_icon_css_classes=>'fa-arrow-left'
,p_button_cattributes=>'style="margin-right:.5rem;"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4081883742479105)
,p_name=>'P21_CDGO_ASCDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(82730878807639613)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5218631303825114)
,p_name=>'P21_IDNTIFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5218564722825113)
,p_prompt=>unistr('Digite  la Identificaci\00F3n que desea consultar:')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82731046659639615)
,p_name=>'P21_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(82730878807639613)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82732895693639633)
,p_name=>'P21_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(82730878807639613)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83694994351840847)
,p_name=>'P21_NMBRE_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(82730878807639613)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(83695060710840848)
,p_computation_sequence=>10
,p_computation_item=>'P21_NMBRE_IMPSTO_SBMPSTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  upper(a.nmbre_impsto_sbmpsto)',
'from    df_i_impuestos_subimpuesto  a',
'where   a.id_impsto_sbmpsto =  4700122--:P21_ID_IMPSTO_SBMPSTO;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4081778755479104)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Validar c\00F3digo de Solicitudes de Asociado')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select actvo',
'    into :P21_CDGO_ASCDO',
'    from si_d_slctd_asociado_impuesto',
'    where id_impsto = :P21_ID_IMPSTO;',
'    exception',
'    when others then',
'    :P21_CDGO_ASCDO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
