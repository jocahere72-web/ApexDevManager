prompt --application/pages/page_00178
begin
wwv_flow_api.create_page(
 p_id=>178
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Gesti\00F3n de Sanci\00F3n por Extemporaneidad VUR')
,p_step_title=>unistr('Gesti\00F3n de Sanci\00F3n por Extemporaneidad VUR')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ocultarAyudaD();',
'',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201202094641'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96757919911114827)
,p_plug_name=>'Liquidaciones de Impuesto Registro'
,p_region_name=>'liquidaciones_impuesto'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_rnta',
'		, a.nmro_rnta',
'        , a.idntfccion_sjto',
'        , a.nmbre_rzon_scial',
'		, a.fcha_rgstro',
'		, case when txto_ascda is not null then ',
'            a.dscrpcion_ascda || '': '' || a.txto_ascda ',
'          else',
'              ''--''',
'          end as txto_ascda',
'		--, a.nmbre_impsto_sbmpsto',
'		, (select to_char(vlor_bse_grvble, :F_FRMTO_MNDA) as vlor_bse_grvble',
'                   from df_i_impuestos_acto m ',
'                   join gi_g_rentas_acto    n on m.id_impsto_acto = n.id_impsto_acto',
'                  where n.id_rnta           = a.id_rnta',
'                    and rownum = 1',
'			) vlor_bse_grvble',
'        , a.fcha_expdcion',
'        , a.dscrpcion_rnta_estdo',
'        , a.dscrpcion_indcdor_exncion',
'        , a.cdgo_exncion_estdo',
'	 from v_gi_g_rentas		           a',
'	 join v_gi_g_rentas_acto           b on a.id_rnta = b.id_rnta',
'	where a.cdgo_clnte		            = :F_CDGO_CLNTE',
'      and a.id_impsto_sbmpsto           = :P178_ID_IMPSTO_SBMPSTO',
'      and a.idntfccion_sjto             = :P178_IDNTFCCION       ',
'	  and a.cdgo_rnta_estdo             = ''APB''',
'      and a.indcdor_rnta_pgda           = ''S'' ',
'	  and a.fcha_vncmnto                < sysdate  ',
'	  -- sean rentas de impuesto y registro',
'      and exists ( select x.id_impsto_acto ',
'	                 from df_i_impuestos_acto x',
'	                where x.id_impsto_acto_pdre = b.id_impsto_acto',
'				      and x.id_impsto_acto <> b.id_impsto_acto',
'				  )                  ',
'      and not exists ( select x.id_impsto_acto ',
'	                 from df_i_impuestos_acto x',
'	                where x.id_impsto_acto = b.id_impsto_acto',
'				      and x.id_impsto_acto_pdre is null',
'				  )	  	  ',
'	  -- no tengan una liquidacion de sancion asociada',
'	  and not exists ( select g.id_rnta',
'						  from gi_g_rentas                g',
'						 where g.id_rnta_antrior = a.id_rnta',
'						   and g.cdgo_rnta_estdo in (''RGS'', ''APB'', ''LQD'')',
'					  );'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P178_ID_SJTO_IMPSTO is not null or :P178_ID_SJTO is not null'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(96758195962114829)
,p_name=>'ID_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(96758399163114831)
,p_name=>'NMRO_RNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_RNTA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00B0<br> Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(96758417271114832)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n<br>Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(96758583987114833)
,p_name=>'NMBRE_RZON_SCIAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RZON_SCIAL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>unistr('Nombre Raz\00F3n Social')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(96758617402114834)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(96758710364114835)
,p_name=>'TXTO_ASCDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TXTO_ASCDA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Asociada'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>302
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
 p_id=>wwv_flow_api.id(96758937645114837)
,p_name=>'FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_EXPDCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha<br>Expedici\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(96759053887114838)
,p_name=>'DSCRPCION_RNTA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_RNTA_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Estado<br>Liquidaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(96759110234114839)
,p_name=>'DSCRPCION_INDCDOR_EXNCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_EXNCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFSolicit\00F3<br>Exenci\00F3n?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(96759218787114840)
,p_name=>'CDGO_EXNCION_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_EXNCION_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Estado<br>Exenci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(96759440957114842)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98292704216719719)
,p_name=>'VLOR_BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_BSE_GRVBLE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(96758020010114828)
,p_internal_uid=>96758020010114828
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_api.id(97597348009013657)
,p_interactive_grid_id=>wwv_flow_api.id(96758020010114828)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(97597480161013658)
,p_report_id=>wwv_flow_api.id(97597348009013657)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97597958805013662)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(96758195962114829)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>58
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97598982957013668)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(96758399163114831)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97599444758013670)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(96758417271114832)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97599993349013672)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(96758583987114833)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>231
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97600460888013674)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(96758617402114834)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>158
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97600966729013675)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(96758710364114835)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>208
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97601957854013679)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(96758937645114837)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97602416722013683)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(96759053887114838)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97602926241013685)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(96759110234114839)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(97603448610013687)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(96759218787114840)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98541093355670131)
,p_view_id=>wwv_flow_api.id(97597480161013658)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(98292704216719719)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173624790933891449)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>	'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173624882402891450)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
unistr('    <p align="center"><b>Liquidaci\00F3n de Rentas Varias.</b> <br> <br> </p>'),
unistr('      Mediante esta opci\00F3n se permite realizar el proceso de liquidaci\00F3n de rentas<br><br>  </p>'),
unistr('      El proceso de liquidaci\00F3n de renta se compone de los siguientes pasos:'),
'      <li>Consulta del Sujeto Tributo (contribuyente).</li>',
unistr('      <li>Actos y/o Informaci\00F3n Adicional.</li>'),
'      <li>Datos de Base Gravable / Fecha de Vencimiento. </li>',
'      <li>Adjuntos.</li>',
unistr('      <li>Resumen y registro de liquidaci\00F3n. </li> <br><br>'),
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173625274024891454)
,p_plug_name=>'Consulta de Sujeto'
,p_region_name=>'consulta_sujeto'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P178_ID_RNTA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173918621581581616)
,p_plug_name=>unistr('Informaci\00F3n')
,p_region_name=>'informacion_basica'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>':P178_ID_SJTO_IMPSTO is not null or :P178_ID_SJTO is not null'
,p_attribute_01=>'P178_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(173920288867581632)
,p_plug_name=>unistr('Informaci\00F3 Rentas')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177415873792490925)
,p_plug_name=>unistr('Informaci\00F3n Renta')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164070834422707671)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97535359657006489)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(173625274024891454)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97535775729006489)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(173625274024891454)
,p_button_name=>'BTN_CONSULTA_PARAMETROS'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Consulta x Par\00E1metros')
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=71000:3:&SESSION.::&DEBUG.:RP:P3_NMRO_APP,P3_NMRO_PGNA,P3_NMBRE_ITEM,P3_ID_IMPSTO,P3_VLDAR_CRTRA,P3_IMPSTO_SBMPSTO,P3_NMBRE_ITEM_IMPSTO,P3_NMBRE_ITEM_SBIMPSTO:&APP_ID.,&APP_PAGE_ID.,P178_ID_SJTO_IMPSTO,&P178_ID_IMPSTO.,N,&P178_ID_IMPSTO_SBMPSTO.,P178_ID_IMPSTO,P178_ID_IMPSTO_SBMPSTO'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97534607209006485)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(173625274024891454)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>12
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(97551998007006601)
,p_branch_name=>unistr('Ir a la P\00E1gina 179-Proyecci\00F3n Sanci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:179:&SESSION.::&DEBUG.:RP,179::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(97534607209006485)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96759634492114844)
,p_name=>'P178_ID_RNTA_ASCDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96757919911114827)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97536199572006490)
,p_name=>'P178_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(173625274024891454)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when=>'P178_ID_IMPSTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo correspondiente a la renta que desea registrar.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97537031531006519)
,p_name=>'P178_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(173625274024891454)
,p_prompt=>'Sub-Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select nmbre_impsto_sbmpsto          d ',
'        , id_impsto_sbmpsto             r       ',
'     from table (pkg_sg_autorizacion.fnc_sub_impuestos_x_usuario(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                                 p_id_usrio   => :F_ID_USRIO))',
'    where id_impsto                     = :P178_ID_IMPSTO',
'      ',
' '))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P178_ID_IMPSTO'
,p_ajax_items_to_submit=>'P178_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_display_when=>'P178_ID_IMPSTO_SBMPSTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el sub-tributo correspondiente a la renta que desea registrar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97537829005006520)
,p_name=>'P178_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(173625274024891454)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el valor correspondiente al sujeto con el que se desea registrar la renta.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97538758197006520)
,p_name=>'P178_ID_SJTO_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(173625274024891454)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97539175409006520)
,p_name=>'P178_ID_SJTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(173625274024891454)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97539584655006521)
,p_name=>'P178_RSPSTA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(173625274024891454)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97539996043006521)
,p_name=>'P178_CDGO_RNTA_ESTDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(173625274024891454)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97540985668006522)
,p_name=>'P178_ID_RNTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Id Rnta'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97541335241006523)
,p_name=>'P178_VGNCIA_ACTUAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Vgncia Actual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97541780826006523)
,p_name=>'P178_PRDO_ACTUAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Prdo Actual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97542159511006523)
,p_name=>'P178_USA_INDCDOR_EXTRNJRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Usa Indcdor Extrnjro'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97542567497006523)
,p_name=>'P178_USA_INDCDOR_MXTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Usa Indcdor Mxto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97542947018006524)
,p_name=>'P178_LBEL_FCHA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Lbel Fcha'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97543380226006524)
,p_name=>'P178_INDCDOR_RQRE_ADJNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Indcdor Rqre Adjnto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97543722746006524)
,p_name=>'P178_INDCDOR_RQRE_AUTRZCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Indcdor Rqre Autrzcion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97544115359006524)
,p_name=>'P178_BRANCH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Branch'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97544516431006524)
,p_name=>'P178_ID_ENTDAD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Id Entdad'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97544992400006525)
,p_name=>'P178_INDCDOR_LQDCCION_ADCNAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Indcdor Lqdccion Adcnal'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97545318439006525)
,p_name=>'P178_INDCDOR_EXNCION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Indcdor Exncion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97545785177006525)
,p_name=>'P178_ID_IMPSTO_ACTO_EXNCION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97546130378006541)
,p_name=>'P178_INDCDOR_CNTRTO_GSLNA'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(173920288867581632)
,p_prompt=>'Indcdor Cntrto Gslna'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(97547336976006571)
,p_computation_sequence=>20
,p_computation_item=>'P178_VGNCIA_ACTUAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''GFN'', p_cdgo_dfncion_clnte => ''VAC'') vgncia_actual',
'     from dual; '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(97547763000006577)
,p_computation_sequence=>30
,p_computation_item=>'P178_PRDO_ACTUAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_dfncion_clnte_ctgria => ''GFN'', p_cdgo_dfncion_clnte => ''PAC'') prdo_actual',
'     from dual'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(97548140772006577)
,p_computation_sequence=>40
,p_computation_item=>'P178_ID_ENTDAD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select id_entdad',
'     from v_sg_g_usuarios',
'    where id_usrio        = :F_ID_USRIO'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(97548530063006578)
,p_validation_name=>'Sujeto Impuesto No nulo'
,p_validation_sequence=>10
,p_validation=>':P178_ID_SJTO_IMPSTO is not null or :P178_ID_SJTO is not null'
,p_validation_type=>'SQL_EXPRESSION'
,p_error_message=>'Por favor consulte un Sujeto Impuesto'
,p_validation_condition=>'BTN_CONSULTAR,NEXT'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(97537829005006520)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98294059792719732)
,p_validation_name=>unistr('Valida Liquidaci\00F3n Impuesto registro')
,p_validation_sequence=>20
,p_validation=>'P178_ID_RNTA_ASCDA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Por favor seleccione una Liquidaci\00F3n')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(97534607209006485)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97550419567006586)
,p_name=>'Consulta de Sujeto Impuesto'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(97535359657006489)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97550941463006597)
,p_event_id=>wwv_flow_api.id(97550419567006586)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto        varchar2(500);',
'    v_id_sjto               si_c_sujetos.id_sjto%type;',
'    ',
'begin',
'        ',
unistr('    -- Se consulta si la identificaci\00F3n consultada existe para el impuesto'),
'    begin ',
'        select a.id_sjto_impsto',
'          into v_id_sjto_impsto',
'          from v_si_i_sujetos_impuesto    a',
'          join si_i_personas              b on a.id_sjto_impsto    = b.id_sjto_impsto',
'         where cdgo_clnte                 = :F_CDGO_CLNTE',
'           and id_impsto                  = :P178_ID_IMPSTO',
'           and a.idntfccion_sjto          = :P178_IDNTFCCION;',
'        ',
'        -- Si existe se retorna el id del sujeto impuesto',
'        apex_util.set_session_state(''P178_RSPSTA'', ''1'');',
'        apex_util.set_session_state(''P178_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'',
'    exception',
'        when no_data_found then ',
unistr('            -- Si no existe como sujeto impuesto se consulta la identificaci\00F3n en sujeto para verificar si existe en otro impuesto '),
'            begin ',
'                select id_sjto ',
'                     , id_sjto_impsto',
'                  into v_id_sjto',
'                     , v_id_sjto_impsto',
'                  from v_si_i_sujetos_impuesto',
'                 where cdgo_clnte         = :F_CDGO_CLNTE',
'                   and idntfccion_sjto    = :P178_IDNTFCCION',
'                   and rownum             = 1;',
unistr('                -- Si existe la identificaci\00F3n en sujeto se debe crear como sujeto impuesto para renta de manera automatica   '),
'                apex_util.set_session_state(''P178_RSPSTA'', ''2'');',
'                apex_util.set_session_state(''P178_ID_SJTO'', v_id_sjto);',
'                apex_util.set_session_state(''P178_ID_SJTO_IMPSTO'', v_id_sjto_impsto);',
'                    ',
'            exception',
'                when others then ',
unistr('                -- Si No existe la identificaci\00F3n en sujeto se debe solicitar la informaci\00F3n para crearlo como sujeto impuesto'),
'                    :P178_RSPSTA                := ''0'';',
'                    :P178_ID_SJTO_IMPSTO        := null;',
'                    apex_util.set_session_state(''P178_RSPSTA'', ''0'');',
'                    apex_util.set_session_state(''P178_ID_SJTO_IMPSTO'', null);',
'           end;',
'',
'        when others then ',
'            apex_util.set_session_state(''P178_RSPSTA'', ''0'');',
'            apex_util.set_session_state(''P178_ID_SJTO_IMPSTO'', null);',
'    end;',
'end;'))
,p_attribute_02=>'P178_ID_IMPSTO,P178_IDNTFCCION'
,p_attribute_03=>'P178_ID_SJTO_IMPSTO,P178_RSPSTA,P178_ID_SJTO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97551439411006600)
,p_event_id=>wwv_flow_api.id(97550419567006586)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P178_RSPSTA'') == ''1'' ){',
'    // Si existe el sujeto impuesto',
'    apex.submit();',
'}',
'else if  ($v(''P178_RSPSTA'') == ''0'' ){',
'    // No existe el sujeto impuesto',
'    Swal.fire({',
'        icon: ''error'',',
'        title:  ''<H2 >RENTAS VARIAS</H2>'',',
'        html: ''<H4>El Sujeto Tributo ingresado NO existe.</H4>''',
'    });',
unistr('    // Se ocultan las regiones de informaci\00F3n b\00E1sica'),
'    apex.item( "informacion_basica" ).hide();',
'}',
'else if  ($v(''P178_RSPSTA'') == ''2'' ){',
'    // No existe el sujeto impuesto pero si el sujeto impuesto',
'    apex.submit();',
'}',
'',
'',
';',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96759776436114845)
,p_name=>unistr('Al seleccionar liquidaci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(96757919911114827)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96759850105114846)
,p_event_id=>wwv_flow_api.id(96759776436114845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(96757919911114827)
,p_attribute_01=>'$s(''P178_ID_RNTA_ASCDA'' , this.data.model.getValue(this.data.selectedRecords[0] , "ID_RNTA"));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(96759515385114843)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(96757919911114827)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Liquidaciones de Impuesto Registro - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97548866826006578)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar impuesto / Sub impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select distinct a.id_impsto ',
'         , a.id_impsto_sbmpsto',
'         , null',
'      into :P178_ID_IMPSTO',
'         , :P178_ID_IMPSTO_SBMPSTO',
'         , :P178_ID_RNTA_ASCDA',
'      from v_df_i_impuestos_acto           a',
'      join df_i_grupos_acto_impsto_act     b on a.id_impsto_acto   = b.id_impsto_acto',
'      join df_c_grupos_acto_entidad        c on b.id_grpo_acto    = c.id_grpo_acto',
'      join df_c_funcionarios               d on c.id_entdad        = d.id_entdad',
'      join v_sg_g_usuarios                 e on d.id_fncnrio       = e.id_fncnrio',
'     where e.id_usrio                      = :F_ID_USRIO;',
'     ',
'     select a.indcdor_rqre_adjnto',
'          , a.indcdor_rqre_autrzcion',
'       into :P178_INDCDOR_RQRE_ADJNTO',
'          , :P178_INDCDOR_RQRE_AUTRZCION',
'       from df_i_impuestos_subimpuesto    a',
'      where a.id_impsto_sbmpsto           = :P178_ID_IMPSTO_SBMPSTO;',
'      ',
'exception ',
'    when others then ',
'        :P178_ID_IMPSTO            := null;',
'        :P178_ID_IMPSTO_SBMPSTO    := null;',
'        :P178_INDCDOR_RQRE_ADJNTO  := ''N'';',
'        :P178_INDCDOR_RQRE_AUTRZCION := ''N'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P178_ID_RNTA is null and :P178_ID_ENTDAD is not null'
,p_process_when_type=>'SQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97549683297006585)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Informaci\00F3n de Rentas ')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select a.id_rnta',
'         , a.nmro_rnta',
'         , a.id_impsto',
'         , a.id_impsto_sbmpsto',
'         , a.id_sjto_impsto',
'         , a.id_sbmpsto_ascda',
'         , a.txto_ascda',
'         , a.indcdor_usa_extrnjro',
'         , a.indcdor_usa_mxto',
'         , a.indcdor_cntrto_gslna',
'         , a.indcdor_exncion',
'         , a.fcha_expdcion',
'         , trunc(a.fcha_vncmnto)',
'         , trim(to_char(a.vlor_bse_grvble, ''999G999G999G999G999G999G990D99'')) -- a.vlor_bse_grvble',
'         , case',
'             when a.id_rnta_antrior is null then ',
'                 ''N''',
'             else',
'                 ''S''',
'            end as indcdor_lqdcion_adcnal',
'         , a.id_rnta_antrior',
'         , a.cdgo_rnta_estdo',
'     into :P178_ID_RNTA',
'        , :P178_NMRO_RNTA',
'        , :P178_ID_IMPSTO',
'        , :P178_ID_IMPSTO_SBMPSTO',
'        , :P178_ID_SJTO_IMPSTO',
'        , :P139_ID_IMPSTO_ASCDA',
'        , :P139_TXTO_ASCDA',
'        , :P139_INDCDOR_USA_EXTRNJRO',
'        , :P139_INDCDOR_USA_MXTO',
'        , :P139_INDCDOR_CNTRTO_GSLNA',
'        , :P141_INDCDOR_EXNCION',
'        , :P141_FCHA_EXPDCION',
'        , :P141_FCHA_VNCMNTO',
'        , :P141_VLOR_BSE_GRVBLE',
'        , :P141_INDCDOR_LDCCION_ADCNAL',
'        , :P141_ID_RNTA_ANTRIOR',
'        , :P178_CDGO_RNTA_ESTDO',
'     from v_gi_g_rentas          a',
'    where a.id_rnta            = :P178_ID_RNTA;',
'    ',
'   /* ',
'    apex_collection.create_or_truncate_collection( p_collection_name => ''ADJUNTOS_RENTA'');',
'        ',
'    for c_adjntos in (select * from gi_g_rentas_adjnto where id_rnta = :P178_ID_RNTA) loop',
'        apex_collection.add_member( p_collection_name   => ''ADJUNTOS_RENTA''',
'                                  , p_n001              => c_adjntos.id_sbmpto_adjnto_tpo ',
'                                  , p_c001              => c_adjntos.obsrvcion',
'                                  , p_c002              => c_adjntos.file_name',
'                                  , p_c003              => c_adjntos.file_mimetype',
'                                  , p_blob001           => c_adjntos.file_blob',
'                                  );',
'    ',
'    end loop;*/',
'exception',
'    when others then ',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P178_ID_RNTA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97549287122006585)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta Configuraci\00F3n de Rentas')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'null;',
'/*select indcdor_usa_extrnjro',
'         , indcdor_usa_mxto',
unistr('         , initcap(nvl(lbel_fcha_expdcion, ''Expedici\00F3n''))'),
'     into :P178_USA_INDCDOR_EXTRNJRO',
'        , :P178_USA_INDCDOR_MXTO',
'        , :P178_LBEL_FCHA',
'     from gi_d_rentas_configuracion',
'    where cdgo_clnte = :F_CDGO_CLNTE;',
'    ',
'    select a.indcdor_rqre_adjnto',
'         , a.indcdor_rqre_autrzcion',
'      into :P178_INDCDOR_RQRE_ADJNTO',
'         , :P178_INDCDOR_RQRE_AUTRZCION',
'      from df_i_impuestos_subimpuesto    a',
'     where a.id_impsto_sbmpsto           = :P178_ID_IMPSTO_SBMPSTO;',
'exception',
'    when others then',
'        :P93_INDCDOR_EXTRNJRO        := ''N'';',
'        :P93_INDCDOR_MXTO            := ''N'';',
unistr('        :P93_LBEL_FCHA               := ''Expedici\00F3n'';'),
'        :P178_INDCDOR_RQRE_ADJNTO    := ''N'';',
'        :P178_INDCDOR_RQRE_AUTRZCION := ''N'';*/',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97550015198006585)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consulta Configuraci\00F3n de Subimpuesto')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' null;',
' /*select a.indcdor_lqdccion_adcnal',
'         , a.indcdor_exncion',
'         , a.id_impsto_acto_exncion',
'         , a.indcdor_cntrto_gslna',
'      into :P178_INDCDOR_LQDCCION_ADCNAL',
'         , :P178_INDCDOR_EXNCION',
'         , :P178_ID_IMPSTO_ACTO_EXNCION',
'         , :P178_INDCDOR_CNTRTO_GSLNA',
'      from gi_d_rntas_cnfgrcion_sbmpst    a',
'     where a.id_impsto_sbmpsto           = :P178_ID_IMPSTO_SBMPSTO;',
'exception',
'    when others then',
'        :P178_INDCDOR_LQDCCION_ADCNAL    := ''N'';',
'        :P178_INDCDOR_EXNCION            := ''N'';',
'        :P178_ID_IMPSTO_ACTO_EXNCION     := null;',
'        :P178_INDCDOR_CNTRTO_GSLNA       := ''N'';*/',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P178_ID_IMPSTO_SBMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
