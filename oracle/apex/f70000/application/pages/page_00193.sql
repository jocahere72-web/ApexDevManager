prompt --application/pages/page_00193
begin
wwv_flow_api.create_page(
 p_id=>193
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Caracteristicas del predio'
,p_step_title=>'Consuta liquidacion predial'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>' '
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210122094620'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104498282731038526)
,p_plug_name=>'Tab Selector'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto ',
'  from V_SI_I_SUJETOS_IMPUESTO a',
' where a.id_sjto_impsto = :P193_ID_SJTO_IMPSTO;'))
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104641220668561904)
,p_plug_name=>unistr('Clasificaci\00F3n Predio')
,p_parent_plug_id=>wwv_flow_api.id(104498282731038526)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- clasificacion predio',
'select /*+ RESULT_CACHE */ ',
'	   c.cdgo_prdio_clsfccion',
'       , p.dscrpcion_prdio_clsfccion',
'       , c.crcter_incial',
'       , c.crcter_fnal',
'  from gi_d_predios_clclo_clsfccion c',
'  join df_s_predios_clasificacion   p on c.cdgo_prdio_clsfccion = p.cdgo_prdio_clsfccion',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and id_impsto  = :P193_ID_IMPSTO',
'   and to_date( ''01/01/'' || :P193_VGNCIA , ''DD/MM/RR'' ) between trunc(fcha_incial) and trunc(fcha_fnal)',
'   and substr( :P193_IDNTFCCION_PRMT , 1 , 2 )    		 between crcter_incial and crcter_fnal;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104642097210561912)
,p_name=>'CDGO_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_PRDIO_CLSFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(104642152998561913)
,p_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_PRDIO_CLSFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(104642224350561914)
,p_name=>'CRCTER_INCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CRCTER_INCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Caracter Inicial'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(104642349918561915)
,p_name=>'CRCTER_FNAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CRCTER_FNAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Caracter Final'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>2
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
 p_id=>wwv_flow_api.id(104641969452561911)
,p_internal_uid=>104641969452561911
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(104674293191666944)
,p_interactive_grid_id=>wwv_flow_api.id(104641969452561911)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(104674377407666944)
,p_report_id=>wwv_flow_api.id(104674293191666944)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104674857670666948)
,p_view_id=>wwv_flow_api.id(104674377407666944)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(104642097210561912)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104675356637666956)
,p_view_id=>wwv_flow_api.id(104674377407666944)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104642152998561913)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104675855878666959)
,p_view_id=>wwv_flow_api.id(104674377407666944)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(104642224350561914)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104676347797666961)
,p_view_id=>wwv_flow_api.id(104674377407666944)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(104642349918561915)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104641812504561910)
,p_plug_name=>'Predio Uso'
,p_parent_plug_id=>wwv_flow_api.id(104498282731038526)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Calcula Predio Uso ',
'select /*+ RESULT_CACHE */ ',
'	  c.id_prdio_uso_slo, cdgo_prdio_uso_slo, dscrpcion',
'  from gi_d_predios_calculo_uso c',
'  join df_c_predios_uso_suelo   p on c.id_prdio_uso_slo = p.id_prdio_uso_slo',
' where p.cdgo_clnte        = :F_CDGO_CLNTE',
'   and id_impsto         = :P193_ID_IMPSTO',
'   and id_impsto_sbmpsto = :P193_ID_IMPSTO_SBMPSTO',
'   and ( cdgo_dstno_igac = ''Z''  or cdgo_dstno_igac is null )',
'   and ( cdgo_prdio_clsfccion  = :P193_CDGO_PRDIO_CLSFCCION   ',
'                                                or cdgo_prdio_clsfccion is null )',
'   and to_date( ''01/01/'' || :P193_VGNCIA , ''DD/MM/RR'' ) between trunc(fcha_incial) and trunc(fcha_fnal)',
'   and 1 = ( case when ( indcdor_clclo_area = ''P'' ',
'                     and decode( :P193_AREA_TRRNO , 0 , 100 , round( :P193_AREA_CNSTRDA / :P193_AREA_TRRNO , 2 )) between prcntje_mnmo and prcntje_mxmo ) ',
'                    or ( indcdor_clclo_area = ''V'' ',
'                     and :P193_AREA_TRRNO      between area_trrno_mnma and area_trrno_mxma ',
'                     and :P193_AREA_CNSTRDA    between area_cnsctrda_mnma and area_cnsctrda_mxma ) then ',
'                   1',
'                  else ',
'                   0',
'             end )			 ',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104643427837561926)
,p_name=>'ID_PRDIO_USO_SLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_USO_SLO'
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
 p_id=>wwv_flow_api.id(104643586951561927)
,p_name=>'CDGO_PRDIO_USO_SLO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_PRDIO_USO_SLO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(104643623946561928)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(104643323366561925)
,p_internal_uid=>104643323366561925
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(104688165005891143)
,p_interactive_grid_id=>wwv_flow_api.id(104643323366561925)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(104688273885891143)
,p_report_id=>wwv_flow_api.id(104688165005891143)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104688794436891144)
,p_view_id=>wwv_flow_api.id(104688273885891143)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(104643427837561926)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104689237992891146)
,p_view_id=>wwv_flow_api.id(104688273885891143)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104643586951561927)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104689766431891148)
,p_view_id=>wwv_flow_api.id(104688273885891143)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(104643623946561928)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104642808936561920)
,p_plug_name=>unistr('C\00E1lculo destino')
,p_parent_plug_id=>wwv_flow_api.id(104498282731038526)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- calculo_destino',
'  select /*+ RESULT_CACHE */ ',
'          c.id_prdio_dstno, nmtcnco, dscrpcion',
'      from gi_d_predios_calculo_destino c',
'      join df_i_predios_destino   p on c.id_prdio_dstno = p.id_prdio_dstno',
'     where p.cdgo_clnte           = :F_CDGO_CLNTE',
'       and c.id_impsto            = :P193_ID_IMPSTO',
'       and c.id_impsto_sbmpsto    = :P193_ID_IMPSTO_SBMPSTO',
'       and cdgo_prdio_clsfccion = :P193_CDGO_PRDIO_CLSFCCION',
'       and ( cdgo_dstno_igac    = :P193_CDGO_DSTNO_IGAC           or cdgo_dstno_igac is null )    ',
'       and to_date( ''01/01/'' || :P193_VGNCIA , ''DD/MM/RR'' )         between trunc(fcha_incial) and trunc( nvl( fcha_fnal , sysdate )) ',
'       and 1 = ( case when ( indcdor_clclo_area = ''P'' ',
'                         and decode( :P193_AREA_TRRNO , 0 , 100 , round( :P193_AREA_CNSTRDA / :P193_AREA_TRRNO , 2 )) between prcntje_mnmo and prcntje_mxmo ) ',
'                        or ( indcdor_clclo_area = ''V'' ',
'                         and :P193_AREA_TRRNO between area_trrno_mnma and area_trrno_mxma ',
'                         and :P193_AREA_CNSTRDA between area_cnsctrda_mnma and area_cnsctrda_mxma ) then ',
'                       1',
'                      else                        0',
'                 end );	',
'		 '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(104643866437561930)
,p_name=>'ID_PRDIO_DSTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRDIO_DSTNO'
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
 p_id=>wwv_flow_api.id(104643939279561931)
,p_name=>'NMTCNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMTCNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nemotecnico'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>3
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
 p_id=>wwv_flow_api.id(104644098727561932)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(104643796213561929)
,p_internal_uid=>104643796213561929
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_api.id(104693313508916544)
,p_interactive_grid_id=>wwv_flow_api.id(104643796213561929)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(104693433199916544)
,p_report_id=>wwv_flow_api.id(104693313508916544)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104693988525916546)
,p_view_id=>wwv_flow_api.id(104693433199916544)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(104643866437561930)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104694465586916550)
,p_view_id=>wwv_flow_api.id(104693433199916544)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104643939279561931)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104694997096916552)
,p_view_id=>wwv_flow_api.id(104693433199916544)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(104644098727561932)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104729229465181210)
,p_plug_name=>unistr('Tarifas por Caracter\00EDstica ')
,p_parent_plug_id=>wwv_flow_api.id(104498282731038526)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select /*+ RESULT_CACHE */',
'			area_trrno_mnma',
'			, area_trrno_mxma',
'			, area_cnsctrda_mnma',
'			, area_cnsctrda_mxma ',
'            ,  to_char( nvl((bse_mnma),0) , :F_FRMTO_MNDA ) bse_mnma',
'            ,  to_char( nvl((bse_mxma),0) , :F_FRMTO_MNDA ) bse_mxma',
'	 		, cdgo_indcdor_tpo',
'            , (select  a.cdgo_indcdor_tpo||'' ''||a.fcha_dsde||'' - ''|| a.fcha_hsta',
'                from  df_s_indicadores_economico a',
'                where a.id_indcdor_ecnmco = b.id_indcdor_ecnmco)  id_indcdor_ecnmco',
'       		, trfa ',
'			, dscrpcion_prdio_dstno',
'			, dscrpcion_prdio_uso_slo',
'			, dscrpcion_prdio_clsfccion',
'			, dscrpcion_estrto',
'            ,  to_char( nvl((lmte_mnma),0) , :F_FRMTO_MNDA ) lmte_mnma',
'            ,  to_char( nvl((lmte_mxma),0) , :F_FRMTO_MNDA ) lmte_mxma',
'          from v_gi_d_predios_esquema b',
'         where cdgo_clnte        = :F_CDGO_CLNTE',
'           and id_impsto         = :P193_ID_IMPSTO',
'           and id_impsto_sbmpsto = :P193_ID_IMPSTO_SBMPSTO',
'           and to_date( ''01/01/'' || 2020 , ''DD/MM/RR'' )',
'       between trunc(fcha_incial) and trunc(fcha_fnal) ',
'           and :P193_AREA_TRRNO',
'       between area_trrno_mnma and area_trrno_mxma ',
'           and :P193_AREA_CNSTRDA  --0',
'       between area_cnsctrda_mnma and area_cnsctrda_mxma ',
'             and :P193_AVLUO_CTSTRAL -- 633701000',
'       between bse_mnma and bse_mxma',
'           and ( cdgo_prdio_clsfccion = 	:P193_CDGO_PRDIO_CLSFCCION  --''02'' ',
'            or cdgo_prdio_clsfccion is null )',
'           and ( id_prdio_dstno       = 	:P193_ID_PRDIO_DSTNO --220',
'            or id_prdio_dstno is null )  ',
'           and ( id_prdio_uso_slo     = 	:P193_ID_PRDIO_USO_SLO --2	',
'            or id_prdio_uso_slo is null )',
'           and ( cdgo_estrto          = 	:P193_CDGO_ESTRTO --99 ',
'            or cdgo_estrto is null ) ;',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>210
,p_prn_height=>297
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(104729341911181211)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JPRADA'
,p_internal_uid=>104729341911181211
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104729490740181212)
,p_db_column_name=>'AREA_TRRNO_MNMA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('\00C1rea de Terreno<br> M\00EDnima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104729500906181213)
,p_db_column_name=>'AREA_TRRNO_MXMA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('\00C1rea de Terreno <br>M\00E1xima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104729691104181214)
,p_db_column_name=>'AREA_CNSCTRDA_MNMA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('\00C1rea Construida <br> M\00EDnima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104729778489181215)
,p_db_column_name=>'AREA_CNSCTRDA_MXMA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('\00C1rea Construida <br>M\00E1xima')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104730045347181218)
,p_db_column_name=>'CDGO_INDCDOR_TPO'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Tipo de Indicador'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104730232706181220)
,p_db_column_name=>'TRFA'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Tarifa'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104730930718181227)
,p_db_column_name=>'DSCRPCION_PRDIO_USO_SLO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Uso Suelo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104731383056181231)
,p_db_column_name=>'ID_INDCDOR_ECNMCO'
,p_display_order=>170
,p_column_identifier=>'T'
,p_column_label=>unistr('Indicador Econ\00F3mico')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104731484855181232)
,p_db_column_name=>'DSCRPCION_PRDIO_DSTNO'
,p_display_order=>180
,p_column_identifier=>'U'
,p_column_label=>'Destino Predio'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104731569173181233)
,p_db_column_name=>'DSCRPCION_PRDIO_CLSFCCION'
,p_display_order=>190
,p_column_identifier=>'V'
,p_column_label=>unistr('Clasificaci\00F3n del Predio')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104731676916181234)
,p_db_column_name=>'DSCRPCION_ESTRTO'
,p_display_order=>200
,p_column_identifier=>'W'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104731713964181235)
,p_db_column_name=>'BSE_MNMA'
,p_display_order=>210
,p_column_identifier=>'X'
,p_column_label=>unistr('Base M\00EDnima')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104731890792181236)
,p_db_column_name=>'BSE_MXMA'
,p_display_order=>220
,p_column_identifier=>'Y'
,p_column_label=>unistr('Base M\00E1xima')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104731982164181237)
,p_db_column_name=>'LMTE_MNMA'
,p_display_order=>230
,p_column_identifier=>'Z'
,p_column_label=>unistr('Limite M\00EDnimo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(104732036101181238)
,p_db_column_name=>'LMTE_MXMA'
,p_display_order=>240
,p_column_identifier=>'AA'
,p_column_label=>unistr('Limite M\00E1ximo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(104848293656866150)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1048483'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'AREA_TRRNO_MNMA:AREA_TRRNO_MXMA:AREA_CNSCTRDA_MNMA:AREA_CNSCTRDA_MXMA:BSE_MNMA:BSE_MXMA:CDGO_INDCDOR_TPO:ID_INDCDOR_ECNMCO:LMTE_MNMA:LMTE_MXMA:TRFA:DSCRPCION_PRDIO_USO_SLO:DSCRPCION_PRDIO_DSTNO:DSCRPCION_PRDIO_CLSFCCION:DSCRPCION_ESTRTO:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(280155144788516477)
,p_plug_name=>'Sujeto Tributo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(151793115167779208)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(280155144788516477)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P193_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(290656548211927969)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'',
unistr('<p ALIGN="justify"><i>Funcionalidad que permite consultar las caracter\00EDsticas y tarifas de un predio, como son :</i></p>'),
'',
unistr('<b><i> a. </i></b><i> Tarifas por caracter\00EDsticas.</i><br>'),
unistr('<b><i> b. </i></b><i> Clasificaci\00F3n del predio.</i><br>'),
'<b><i> c. </i></b><i> Predio uso.</i><br> ',
'<b><i> d. </i></b><i> Calculo destino.</i>',
'<br><br>	',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104543310049666916)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(280155144788516477)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104542980761666914)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(280155144788516477)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Consulta Par\00E1metros')
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(104567197699666982)
,p_branch_name=>'Ir a Busqueda Sujeto Impuesto'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P45_ID_SJTO_IMPSTO,&P45_ID_IMPSTO.,&P45_ID_IMPSTO_SBMPSTO.,P45_ID_IMPSTO,P45_ID_IMPSTO_SBMPSTO&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(175614273148849592)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104497419851038518)
,p_name=>'P193_CDGO_ESTRTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104497537658038519)
,p_name=>'P193_AVLUO_CTSTRAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104497855796038522)
,p_name=>'P193_CDGO_PRDIO_CLSFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104497988426038523)
,p_name=>'P193_ID_PRDIO_DSTNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104498056859038524)
,p_name=>'P193_ID_PRDIO_USO_SLO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104498573057038529)
,p_name=>'P193_AREA_TRRNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104498616330038530)
,p_name=>'P193_AREA_CNSTRDA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104498795187038531)
,p_name=>'P193_BSE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104543742977666916)
,p_name=>'P193_INDCDOR_ENTRNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(280155144788516477)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104544165960666917)
,p_name=>'P193_INDCDOR_FSCA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(280155144788516477)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104544577420666917)
,p_name=>'P193_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(280155144788516477)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104544908813666917)
,p_name=>'P193_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(280155144788516477)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
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
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104545314008666918)
,p_name=>'P193_ID_IMPSTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(280155144788516477)
,p_prompt=>'Sub-Tributos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto,',
'        id_impsto_sbmpsto',
'   from df_i_impuestos_subimpuesto',
'   where id_impsto = :P193_ID_IMPSTO',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P193_ID_IMPSTO'
,p_ajax_items_to_submit=>'P193_ID_IMPSTO,P193_ID_IMPSTO_SBMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104545749619666919)
,p_name=>'P193_IDNTFCCION_PRMT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(280155144788516477)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104546147953666919)
,p_name=>'P193_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(280155144788516477)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104729069319181208)
,p_name=>'P193_VGNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104732114532181239)
,p_name=>'P193_CDGO_DSTNO_IGAC'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(104498282731038526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(104729131236181209)
,p_computation_sequence=>10
,p_computation_item=>'P193_VGNCIA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select extract(year from to_date(sysdate-50)) from dual;'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(104555373246666958)
,p_validation_name=>'Validar Impuesto'
,p_validation_sequence=>20
,p_validation=>'P193_ID_IMPSTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe selecccionar un impuesto'
,p_validation_condition=>'BTN_CONSULTA_PARAMETROS,BTN_CONSULTAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_when_button_pressed=>wwv_flow_api.id(175614273148849592)
,p_associated_item=>wwv_flow_api.id(104544908813666917)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(104555736257666960)
,p_validation_name=>unistr('identificaci\00F3n no nula')
,p_validation_sequence=>50
,p_validation=>'P193_IDNTFCCION_PRMT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor ingrese un identificaci\00F3n para consultar')
,p_when_button_pressed=>wwv_flow_api.id(175614080196849590)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104559243342666963)
,p_name=>'Ocultar item valor abono cuando el tipo del recibo sea DNO'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_CDGO_RCBO_TPO'
,p_condition_element=>'P193_CDGO_RCBO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104559763916666965)
,p_event_id=>wwv_flow_api.id(104559243342666963)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P193_VLOR_ABONO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104560203413666965)
,p_event_id=>wwv_flow_api.id(104559243342666963)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P193_VLOR_ABONO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104560663687666965)
,p_name=>'al cambiar Validar Valor del Abono no sea mayor al total de la deuda seleccionada'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_VLOR_ABONO'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104561177393666966)
,p_event_id=>wwv_flow_api.id(104560663687666965)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'calculaTotal();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104561542598666966)
,p_name=>'Al cambiar la fecha de vencimiento refrescar el IG de deuda'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104562078762666966)
,p_event_id=>wwv_flow_api.id(104561542598666966)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P193_FCHA_VNCMNTO'',:P193_FCHA_VNCMNTO);',
'END;'))
,p_attribute_02=>'P193_FCHA_VNCMNTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104563841026666973)
,p_name=>unistr('Al cambiar el Valor del impuesto Refrescar la regi\00F3n de deuda')
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104564394084666974)
,p_event_id=>wwv_flow_api.id(104563841026666973)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'$(''#P193_IDNTFCCION_PRMT'').text(''Referencia/Matricula'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(104565251837666976)
,p_name=>'New'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P193_ID_IMPSTO_SBMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(104565754879666976)
,p_event_id=>wwv_flow_api.id(104565251837666976)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P193_ID_IMPSTO_SBMPSTO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104557244331666961)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Datos del Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.idntfccion_sjto    idntfccion_sjto        ',
'  into :P193_IDNTFCCION_PRMT',
'  from V_SI_I_SUJETOS_IMPUESTO a',
' where a.id_sjto_impsto = :P193_ID_SJTO_IMPSTO;'))
,p_process_error_message=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104497345914038517)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Informacion del predio'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select    cdgo_estrto',
'        , avluo_ctstral',
'        , cdgo_prdio_clsfccion',
'        , id_prdio_dstno',
'        , id_prdio_uso_slo ',
'        , area_trrno',
'        , area_cnstrda',
'        , cdgo_dstno_igac',
'     into :P193_CDGO_ESTRTO',
'         , :P193_AVLUO_CTSTRAL',
'         , :P193_CDGO_PRDIO_CLSFCCION',
'         , :P193_ID_PRDIO_DSTNO',
'         , :P193_ID_PRDIO_USO_SLO',
'         , :P193_AREA_TRRNO',
'         , :P193_AREA_CNSTRDA',
'         , :P193_CDGO_DSTNO_IGAC',
'from   si_i_predios ',
'where id_sjto_impsto = :P193_ID_SJTO_IMPSTO ;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104644178597561933)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Calcula tarifa'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select /*+ RESULT_CACHE */',
'			area_trrno_mnma',
'			, area_trrno_mxma',
'			, area_cnsctrda_mnma',
'			, area_cnsctrda_mxma',
'        	, bse_mnma',
'		 	, bse_mxma',
'			, cdgo_indcdor_tpo',
'			, id_indcdor_ecnmco',
'			, trfa ',
'			, id_prdio_dstno',
'			, id_prdio_uso_slo',
'			, cdgo_prdio_clsfccion',
'			, cdgo_estrto',
'			, lmte_mnma',
'			, lmte_mxma        ',
'	INTO',
'			:P193_AREA_TRRNO_MNMA',
'			, :P193_AREA_TRRNO_MXMA',
'			, :P193_AREA_CNSCTRDA_MNMA',
'			, :P193_AREA_CNSCTRDA_MXMA',
'			, :P193_BSE_MNMA',
'			, :P193_BSE_MXMA',
'			, :P193_CDGO_INDCDOR_TPO',
'			, :P193_ID_INDCDOR_ECNMCO',
'			, :P193_TRFA ',
'			, :P193_ID_PRDIO_DSTNO_TRFA',
'			, :P193_ID_PRDIO_USO_SLO_TRFA',
'			, :P193_CDGO_PRDIO_CLSFCCION_TRFA',
'			, :P193_CDGO_ESTRTO_TRFA',
'			, :P193_LMTE_MNMA',
'			, :P193_LMTE_MXMA         ',
'          from v_gi_d_predios_esquema ',
'         where cdgo_clnte        = :F_CDGO_CLNTE',
'           and id_impsto         = :P193_ID_IMPSTO',
'           and id_impsto_sbmpsto = :P193_ID_IMPSTO_SBMPSTO',
'           and to_date( ''01/01/'' || :P193_VGNCIA , ''DD/MM/RR'' )',
'       between trunc(fcha_incial) and trunc(fcha_fnal) ',
'           and :P193_AREA_TRRNO',
'       between area_trrno_mnma and area_trrno_mxma ',
'           and  :P193_AREA_CNSTRDA  --0',
'       between area_cnsctrda_mnma and area_cnsctrda_mxma ',
'             and :P193_AVLUO_CTSTRAL -- 633701000',
'       between bse_mnma and bse_mxma',
'           and ( cdgo_prdio_clsfccion = :P193_CDGO_PRDIO_CLSFCCION  --''02'' ',
'            or cdgo_prdio_clsfccion is null )',
'           and ( id_prdio_dstno       = :P193_ID_PRDIO_DSTNO --220',
'            or id_prdio_dstno is null )  ',
'           and ( id_prdio_uso_slo     = :P193_ID_PRDIO_USO_SLO --2	',
'            or id_prdio_uso_slo is null )',
'           and ( cdgo_estrto          = 	:P193_CDGO_ESTRTO --99 ',
'            or cdgo_estrto is null ) ;',
'			'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104557641850666961)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto x BTN_CONSULTAR'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_estdo_blqdo_sjto      si_i_sujetos_impuesto.estdo_blqdo%type;',
'    v_id_sjto_estdo       si_i_sujetos_impuesto.id_sjto_estdo%type;',
'    ',
'begin',
'    select id_sjto_impsto,     estdo_blqdo_sjto,   id_sjto_estdo',
'      into v_id_sjto_impsto,   v_estdo_blqdo_sjto, v_id_sjto_estdo',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte       = :F_CDGO_CLNTE',
'       and (id_impsto       = :P193_ID_IMPSTO ',
'        or :P193_ID_IMPSTO is null)',
'       and (idntfccion_sjto   = :P193_IDNTFCCION_PRMT ',
'        or idntfccion_antrior = :P193_IDNTFCCION_PRMT ',
'        or mtrcla_inmblria    = :P193_IDNTFCCION_PRMT);      ',
'    ',
'    if v_estdo_blqdo_sjto = ''N'' and v_id_sjto_estdo = 1 then ',
'        :P193_RSPSTA := '''';',
'        :P193_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'        ',
'    elsif v_estdo_blqdo_sjto = ''S'' then',
'        :P193_RSPSTA := ''El sujeto impuesto ingresado se encuentra bloqueado'';',
'        :P193_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    elsif v_id_sjto_estdo != 1 then',
'        :P193_RSPSTA := ''El sujeto impuesto ingresado No se encuentra activo'';',
'        :P193_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'    end if;',
'exception',
'    when no_data_found then ',
'        :P193_ID_SJTO_IMPSTO := null;',
'        v_id_sjto_impsto    := null;',
'        :P193_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'    when others then ',
'        :P193_RSPSTA := ''Error: '' || sqlerrm;',
'end; '))
,p_process_error_message=>'&P193_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(175614080196849590)
,p_process_when=>'P193_IDNTFCCION_PRMT'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'123'
,p_process_success_message=>'&P193_RSPSTA.'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Cambio:   20200211   Jose Yi',
unistr('Inclusi\00F3n en la consulta del Sujeto_Impuesto para busqued por Indentificaci\00F3n Anterior (Predios)'),
'',
'idntfccion_antrior = :P45_IDNTFCCION_PRMT'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104558899783666963)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Sujeto Impuesto X enter del item identificacion_prmt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    ',
'begin',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and (id_impsto    = :P193_ID_IMPSTO or :P193_ID_IMPSTO is null)',
'       and (idntfccion_sjto    = :P193_IDNTFCCION_PRMT or idntfccion_antrior = :P193_IDNTFCCION_PRMT or mtrcla_inmblria = :P193_IDNTFCCION_PRMT);      ',
'    ',
'    :P193_RSPSTA := '''';',
'    :P193_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P193_ID_SJTO_IMPSTO := null;',
'    :P193_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_process_error_message=>'&P193_RSPSTA. '
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P193_IDNTFCCION_PRMT'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P193_RSPSTA.'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Cambio:   20200211   Jose Yi',
unistr('Inclusi\00F3n en la consulta del Sujeto_Impuesto para busqued por Indentificaci\00F3n Anterior (Predios)'),
'',
'idntfccion_antrior = :P45_IDNTFCCION_PRMT'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104558057614666962)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Cache de Id sujeto Impuesto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P193_ID_SJTO_IMPSTO'
,p_process_error_message=>'&P193_RSPSTA.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(175614080196849590)
,p_process_when=>':P193_ID_SJTO_IMPSTO IS NULL or :P193_ID_SJTO_IMPSTO = 0'
,p_process_when_type=>'SQL_EXPRESSION'
,p_process_success_message=>'&P193_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104558481353666963)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Cache de toda la P\00E1gina')
,p_attribute_01=>'CLEAR_CACHE_FOR_PAGES'
,p_attribute_04=>'45'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
