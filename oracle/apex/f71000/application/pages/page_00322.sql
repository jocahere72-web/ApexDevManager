prompt --application/pages/page_00322
begin
wwv_flow_api.create_page(
 p_id=>322
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Emisi\00F3n de Recibos Puntuales - Deuda Proyectada - Fecha Anterior - ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Emisi\00F3n de Recibos Puntuales - Deuda Proyectada - Fecha Anterior - ')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer{  ',
'display:none;  ',
'}  ',
'',
'.a-GV-w-frozen .a-GV-table{  ',
'display:none;  ',
'} ',
'',
'.a-GV-w-frozen {',
'    z-index: 1;',
'    margin-right: -28px;',
'}',
'',
'.t-Region .t-Region-body {',
'    padding: -2px !important;',
'}',
'',
'.a-IG-header {',
'    padding: 2px -2px 0 !important;',
'    border-bottom: 1px solid;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210104150841'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(132452650822996967)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b>',
'   <i> Ayuda <i class="fa fa-question-circle"></i></i>',
'</b>',
'<br>',
'',
'<i>',
'   <b>1. </b>Se puede cambiar la Fecha de Vencimiento. Al cambiar la fecha de vencimiento se vuelven a calcular los valores intereses y los valores de descuentos.<br>',
'   <b>2. </b>Se puede cambiar el Tipo de Recibo. Si se selecciona Tipo de Recibo <b>Abono</b>, se debe ingresar el valor del abono. y este debe ser mayor que cero (0) y menor que el valor total del recibo. <br>',
'<b>NOTA:</b> El tipo de recibo abono no genera descuentos.',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(284654076979666658)
,p_plug_name=>'Deuda Proyectada'
,p_region_name=>'DeudaProyectada'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_mvmnto_orgn,',
'        a.id_orgen,',
'        a.dscrpcion_orgen,',
'        a.vgncia, ',
'		a.prdo,',
'		a.dscrpcion_mvnt_fncro_estdo,',
'		sum (a.vlor_sldo_cptal)  vlor_sldo_cptal, ',
'		sum (a.vlor_intres)      vlor_intres,',
'		sum (a.vlor_dscnto)      vlor_dscnto,',
'        sum (a.vlor_sldo_cptal) + sum (a.vlor_intres) - sum (a.vlor_dscnto)   vlor_ttal',
'  from (',
' select a.cdgo_mvmnto_orgn,',
'        a.id_orgen,',
'        pkg_gf_movimientos_financiero.fnc_co_dscrpcion_mvmnto_fnncro( p_id_mvmnto_fncro => a.id_mvmnto_fncro ) as dscrpcion_orgen,',
'        a.vgncia, ',
'		a.prdo,',
'		a.fcha_vncmnto,',
'        a.dscrpcion_mvnt_fncro_estdo,',
'        a.id_cncpto,',
'		a.vlor_sldo_cptal, ',
'		a.vlor_intres, ',
'        case when :P322_CDGO_RCBO_TPO = ''DNO'' then ',
'           nvl( ( select case when sum(vlor_dscnto) < a.vlor_sldo_cptal and sum(vlor_dscnto) > 0 then',
'                                 sum(vlor_dscnto)',
'                              when sum(vlor_dscnto) > a.vlor_sldo_cptal and sum(vlor_dscnto) > 0 then',
'                                 a.vlor_sldo_cptal',
'                         end as vlor_dscnto from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo( p_cdgo_clnte					=> :F_CDGO_CLNTE,',
'                                                                                                              p_id_impsto					=> :P321_ID_IMPSTO,',
'                                                                                                              p_id_impsto_sbmpsto			=> :P321_ID_IMPSTO_SBMPSTO,',
'                                                                                                              p_vgncia						=> a.vgncia,',
'                                                                                                              p_id_prdo						=> a.id_prdo,',
'                                                                                                              p_id_cncpto					=> a.id_cncpto,',
'                                                                                                              p_id_sjto_impsto				=> :P321_ID_SJTO_IMPSTO,',
'                                                                                                              p_fcha_pryccion				=> :P322_FCHA_VNCMNTO,',
'                                                                                                              p_vlor                        => a.vlor_sldo_cptal,',
'                                                                                                              p_cdna_vgncia_prdo_pgo		=> :P321_VGNCIA_PRDO,',
'                                                                                                              p_cdna_vgncia_prdo_ps			=> null))),0)',
'            +',
'           nvl( ( select  vlor_dscnto from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo( p_cdgo_clnte					=> :F_CDGO_CLNTE,          ',
'                                                                                                              p_id_impsto					=> :P321_ID_IMPSTO,           ',
'                                                                                                              p_id_impsto_sbmpsto			=> :P321_ID_IMPSTO_SBMPSTO,    ',
'                                                                                                              p_vgncia						=> a.vgncia,              ',
'                                                                                                              p_id_prdo						=> a.id_prdo,             ',
'                                                                                                              p_id_cncpto					=> a.id_cncpto_intres_mra, ',
'                                                                                                              p_id_sjto_impsto				=> :P321_ID_SJTO_IMPSTO,     ',
'                                                                                                              p_fcha_pryccion				=> :P322_FCHA_VNCMNTO,      ',
'                                                                                                              p_vlor                        => a.vlor_intres,',
'                                                                                                              p_cdna_vgncia_prdo_pgo		=> :P321_VGNCIA_PRDO, ',
'                                                                                                              p_cdna_vgncia_prdo_ps			=> null))),0)',
'            else ',
'                0',
'        end as vlor_dscnto',
'   from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto (p_cdgo_clnte 			            => :F_CDGO_CLNTE,',
'                                                                     p_id_impsto                        => :P321_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto                => :P321_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_sjto_impsto                   => :P321_ID_SJTO_IMPSTO,',
'                                                                     p_fcha_vncmnto                     => :P322_FCHA_VNCMNTO) )a',
'',
'   join apex_collections b on collection_name = ''VGNCIA_PRDO_PGO'' ',
'     and b.n001 = a.vgncia ',
'     and b.n002 = a.prdo',
'     and b.n003 = a.id_orgen',
'     ) a',
'group by a.cdgo_mvmnto_orgn,',
'        a.id_orgen,',
'        a.dscrpcion_orgen,',
'        a.vgncia, ',
'		a.prdo,',
'		a.dscrpcion_mvnt_fncro_estdo;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(149104301128487372)
,p_name=>'CDGO_MVMNTO_ORGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_MVMNTO_ORGN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('C\00F3digo Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(149104386613487373)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Origen')
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
 p_id=>wwv_flow_api.id(152322888289569682)
,p_name=>'DSCRPCION_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>unistr('Descripci\00F3n Origen')
,p_label=>unistr('Descripci\00F3n Origen')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&DSCRPCION_ORGEN.'
,p_link_target=>'#'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284655870858666726)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284656392014666726)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284657572385666727)
,p_name=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284658100839666728)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor<br> Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284658707825666728)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Valor<br> Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284659331368666729)
,p_name=>'VLOR_DSCNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_DSCNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor<br> Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284660590360666734)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor<br> Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(284675427603690442)
,p_name=>'+ Cartera'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<button style="color:green" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton "  title="M\00E1s Detalle" >'),
'<span class="fa fa-plus-square-o"></span>',
'</button>',
'',
'',
''))
,p_link_target=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:RP,46:P46_ID_SJTO_IMPSTO,P46_VGNCIA,P46_PRDO,P46_FCHA_VNCMNTO,P46_ID_ORGEN,P46_ID_IMPSTO,P46_ID_IMPSTO_SBMPSTO:&P321_ID_SJTO_IMPSTO.,&VGNCIA.,&PRDO.,&P322_FCHA_VNCMNTO.,&ID_ORGEN.,&P321_ID_IMPSTO.,&P321_ID_IMPSTO_SB'
||'MPSTO.'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(284654512800666665)
,p_internal_uid=>284654512800666665
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(284654984965666678)
,p_interactive_grid_id=>wwv_flow_api.id(284654512800666665)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(284655013732666686)
,p_report_id=>wwv_flow_api.id(284654984965666678)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149157118406801632)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(149104301128487372)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(149157631311801636)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(149104386613487373)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(157531596612331242)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(152322888289569682)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>271
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284656101230666726)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(284655870858666726)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284656710976666727)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(284656392014666726)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284657916522666728)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(284657572385666727)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284658580088666728)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(284658100839666728)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284659196436666729)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(284658707825666728)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284659710413666729)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(284659331368666729)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284660981243666734)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(284660590360666734)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(284987454115260523)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(284675427603690442)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(103877989719991369)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(284658707825666728)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(103878037963991336)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(284660590360666734)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(103878087201991912)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(284659331368666729)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(103878207197992205)
,p_view_id=>wwv_flow_api.id(284655013732666686)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(284658100839666728)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(217641733409351062)
,p_plug_name=>'Envio de Correo'
,p_parent_plug_id=>wwv_flow_api.id(284654076979666658)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(284674456370690432)
,p_plug_name=>'Datos del Recibo'
,p_parent_plug_id=>wwv_flow_api.id(284654076979666658)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101707287980392866)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(217641733409351062)
,p_button_name=>'BTN_ENVIAR_CORREO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Enviar Correo'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-envelope-arrow-up'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101708359313392878)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(284674456370690432)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101705320274392865)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(284654076979666658)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101718565955392888)
,p_branch_name=>'Imprimir Documento'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML,P2_NMBRE_RPRTE:&P322_ID_RPRTE.,<P_ID_DCMNTO>&F_ID_DCMNTO.</P_ID_DCMNTO>,DOCUMENTO_&P322_NMRO_DCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(101708359313392878)
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P322_NMRO_DCMNTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101705767798392865)
,p_name=>'P322_VLOR_TTAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(284654076979666658)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101706107834392866)
,p_name=>'P322_ID_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(284654076979666658)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101706502972392866)
,p_name=>'P322_NMRO_DCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(284654076979666658)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101707637215392867)
,p_name=>'P322_CORREO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(217641733409351062)
,p_prompt=>'Enviar a:'
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
 p_id=>wwv_flow_api.id(101708610936392878)
,p_name=>'P322_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(284674456370690432)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte d ,',
'        id_rprte r',
'   from gn_d_reportes',
'  where cdgo_rprte_grpo = ''RPG'''))
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101709052258392878)
,p_name=>'P322_FCHA_VNCMNTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(284674456370690432)
,p_prompt=>unistr('Fecha L\00EDmite de Pago')
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'-1d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101709431691392879)
,p_name=>'P322_CDGO_RCBO_TPO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(284674456370690432)
,p_item_default=>'DAB'
,p_prompt=>'Tipo de Recibo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>'STATIC:Abono;DAB,Normal ;DNO'
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101709878123392879)
,p_name=>'P322_VLOR_ABNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(284674456370690432)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101710225165392879)
,p_name=>'P322_VLOR_ABNO_VSUAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(284674456370690432)
,p_prompt=>'Valor de Abono'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_display_as=>'PLUGIN_AUTONUMERIC'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'P322_VLOR_ABNO'
,p_attribute_02=>'10000000000000'
,p_attribute_03=>'0'
,p_attribute_08=>','
,p_attribute_09=>'0'
,p_attribute_10=>'&F_NMRO_DCMLES.'
,p_attribute_11=>'&F_NMRO_DCMLES.'
,p_attribute_12=>'&F_NMRO_DCMLES.'
,p_attribute_13=>'3'
,p_attribute_14=>','
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101712355172392881)
,p_validation_name=>'El valor del abono no puede ser igual a cero(0)'
,p_validation_sequence=>20
,p_validation=>'P322_VLOR_ABNO'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>'El Valor del Abono debe ser mayor a cero (0)'
,p_validation_condition=>'P322_CDGO_RCBO_TPO'
,p_validation_condition2=>'DAB'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101710799654392880)
,p_validation_name=>'Validar que el valor del abono no sea mayor que el valor total de la deuda'
,p_validation_sequence=>30
,p_validation=>'to_number(:P322_VLOR_TTAL) >= to_number(:P322_VLOR_ABNO)'
,p_validation_type=>'PLSQL_EXPRESSION'
,p_error_message=>'El Valor del Abono debe ser menor al total de la deuda'
,p_always_execute=>'Y'
,p_validation_condition=>'P322_CDGO_RCBO_TPO'
,p_validation_condition2=>'DAB'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_api.id(101708359313392878)
,p_associated_item=>wwv_flow_api.id(101710225165392879)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101712790894392881)
,p_validation_name=>unistr('Validar que la fecha de vencimiento este dentro de un rango de fechas en la parametrizaci\00F3n de tasas mora')
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_fcha_vlda varchar2(1);',
'begin     ',
'    v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P321_ID_IMPSTO, to_date(:P322_FCHA_VNCMNTO,''DD/MM/YY''));',
'    ',
'    if v_fcha_vlda = ''S'' then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'No hay tasas moras parametrizadas para la fecha',
'seleccionada.'))
,p_associated_item=>wwv_flow_api.id(101709052258392878)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101711525251392880)
,p_validation_name=>'Correo no nulo'
,p_validation_sequence=>60
,p_validation=>'P322_CORREO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar un correo'
,p_when_button_pressed=>wwv_flow_api.id(115942071759958202)
,p_associated_item=>wwv_flow_api.id(101707637215392867)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101711942264392881)
,p_validation_name=>'Correo Valido'
,p_validation_sequence=>70
,p_validation=>'P322_CORREO'
,p_validation2=>'^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Correo no valido'
,p_when_button_pressed=>wwv_flow_api.id(115942071759958202)
,p_associated_item=>wwv_flow_api.id(101707637215392867)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101711110466392880)
,p_validation_name=>unistr('Valida que la fecha de emisi\00F3n este dentro de un rango en la parametrizacion de tasas mora ')
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_fcha_vlda varchar2(1);',
'begin     ',
'    v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P321_ID_IMPSTO, to_date(sysdate,''DD/MM/YY''));',
'    ',
'    if v_fcha_vlda = ''S'' then ',
'        return true;',
'    else ',
'        return false;',
'    end if;',
'',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'No hay tasas moras parametrizadas para la fecha',
unistr('de emisi\00F3n.')))
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_fcha date;',
'begin ',
'    v_fcha := :P322_FCHA_VNCMNTO;',
'    if  to_char(sysdate,''MM'') <> to_char(trunc(v_fcha),''MM'') then',
'        return true;',
'    end if;    ',
'end;'))
,p_validation_condition_type=>'FUNCTION_BODY'
,p_when_button_pressed=>wwv_flow_api.id(115942071759958202)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101713895549392886)
,p_name=>'Al seleccionar recibo tipo abono se muestra el item valor de abono'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P322_CDGO_RCBO_TPO'
,p_condition_element=>'P322_CDGO_RCBO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101714314231392886)
,p_event_id=>wwv_flow_api.id(101713895549392886)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P322_VLOR_ABNO_VSUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101714855404392886)
,p_event_id=>wwv_flow_api.id(101713895549392886)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P322_VLOR_ABNO_VSUAL'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101715214962392886)
,p_name=>unistr('Al cambiar la fecha y el tipo de recibo se refresca la regi\00F3n de deuda proyectada')
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P322_FCHA_VNCMNTO,P322_CDGO_RCBO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101715790093392887)
,p_event_id=>wwv_flow_api.id(101715214962392886)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    APEX_UTIL.SET_SESSION_STATE(''P322_FCHA_VNCMNTO'',:P322_FCHA_VNCMNTO);',
'    APEX_UTIL.SET_SESSION_STATE(''P322_CDGO_RCBO_TPO'',:P322_CDGO_RCBO_TPO);',
'    APEX_UTIL.SET_SESSION_STATE(''P322_CDGO_RCBO_TPO'',:P322_CDGO_RCBO_TPO);',
'',
' select sum (a.vlor_sldo_cptal) + sum (a.vlor_intres) - sum (a.vlor_dscnto)   vlor_ttal',
'   into :P322_VLOR_TTAL',
'   from (select a.cdgo_mvmnto_orgn,',
'				a.id_orgen,',
'				a.vgncia, ',
'				a.prdo,',
'				a.fcha_vncmnto,',
'				a.dscrpcion_mvnt_fncro_estdo,',
'				a.id_cncpto,',
'				a.vlor_sldo_cptal, ',
'				a.vlor_intres, ',
'				case when :P322_CDGO_RCBO_TPO = ''DNO'' then ',
'					nvl( ( select case when sum(vlor_dscnto) < a.vlor_sldo_cptal and sum(vlor_dscnto) > 0 then',
'										sum(vlor_dscnto)',
'									when sum(vlor_dscnto) > a.vlor_sldo_cptal and sum(vlor_dscnto) > 0 then',
'										a.vlor_sldo_cptal',
'								end as vlor_dscnto from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo( p_cdgo_clnte				=> :F_CDGO_CLNTE,',
'																													p_id_impsto				=> :P321_ID_IMPSTO,',
'																													p_id_impsto_sbmpsto		=> :P321_ID_IMPSTO_SBMPSTO,',
'																													p_vgncia				=> a.vgncia,',
'																													p_id_prdo				=> a.id_prdo,',
'																													p_id_cncpto				=> a.id_cncpto,',
'																													p_id_sjto_impsto		=> :P321_ID_SJTO_IMPSTO,',
'																													p_fcha_pryccion			=> :P322_FCHA_VNCMNTO,',
'																													p_vlor					=> a.vlor_sldo_cptal,',
'																													p_cdna_vgncia_prdo_pgo	=> :P321_VGNCIA_PRDO,',
'																													p_cdna_vgncia_prdo_ps	=> null))),0)',
'					+',
'					nvl( ( select case when sum(vlor_dscnto) < a.vlor_intres and sum(vlor_dscnto) > 0 then',
'										sum(vlor_dscnto)',
'									when sum(vlor_dscnto) > a.vlor_intres and sum(vlor_dscnto) > 0 then',
'										a.vlor_intres',
'								end as vlor_dscnto from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo( p_cdgo_clnte				=> :F_CDGO_CLNTE,',
'																													p_id_impsto				=> :P321_ID_IMPSTO,',
'																													p_id_impsto_sbmpsto		=> :P321_ID_IMPSTO_SBMPSTO,',
'																													p_vgncia				=> a.vgncia,',
'																													p_id_prdo				=> a.id_prdo,',
'																													p_id_cncpto				=> a.id_cncpto_intres_mra,',
'																													p_id_sjto_impsto		=> :P321_ID_SJTO_IMPSTO,',
'																													p_fcha_pryccion			=> :P322_FCHA_VNCMNTO,',
'																													p_vlor					=> a.vlor_intres,',
'																													p_cdna_vgncia_prdo_pgo	=> :P321_VGNCIA_PRDO, ',
'																													p_cdna_vgncia_prdo_ps	=> null))),0)',
'					else ',
'						0',
'				end as vlor_dscnto',
'   from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'																	p_id_impsto				=> :P321_ID_IMPSTO,',
'																	p_id_impsto_sbmpsto		=> :P321_ID_IMPSTO_SBMPSTO,',
'																	p_id_sjto_impsto		=> :P321_ID_SJTO_IMPSTO,',
'																	p_fcha_vncmnto			=> :P322_FCHA_VNCMNTO) )a',
'	',
'   join apex_collections b on collection_name = ''VGNCIA_PRDO_PGO'' ',
'		and b.n001 = a.vgncia ',
'		and b.n002 = a.prdo',
'		and b.n003 = a.id_orgen',
'   ) a;',
'    ',
'END;'))
,p_attribute_02=>'P322_FCHA_VNCMNTO,,P322_CDGO_RCBO_TPO'
,p_attribute_03=>'P322_VLOR_TTAL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101716262238392887)
,p_event_id=>wwv_flow_api.id(101715214962392886)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(284654076979666658)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101716694620392888)
,p_name=>'Al hacer clic, cerrar modal'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(101705320274392865)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101717106340392888)
,p_event_id=>wwv_flow_api.id(101716694620392888)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101717511219392888)
,p_name=>'Calcular el Valor Total de la Deuda'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101718030023392888)
,p_event_id=>wwv_flow_api.id(101717511219392888)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.SET_SESSION_STATE(''P322_CDGO_RCBO_TPO'',:P322_CDGO_RCBO_TPO);',
'',
' select sum (a.vlor_sldo_cptal) + sum (a.vlor_intres) - sum (a.vlor_dscnto)   vlor_ttal',
'   into :P322_VLOR_TTAL',
'   from (select a.cdgo_mvmnto_orgn,',
'				a.id_orgen,',
'				a.vgncia, ',
'				a.prdo,',
'				a.fcha_vncmnto,',
'				a.dscrpcion_mvnt_fncro_estdo,',
'				a.id_cncpto,',
'				a.vlor_sldo_cptal, ',
'				a.vlor_intres, ',
'				case when :P322_CDGO_RCBO_TPO = ''DNO'' then ',
'					nvl( ( select case when sum(vlor_dscnto) < a.vlor_sldo_cptal and sum(vlor_dscnto) > 0 then',
'										sum(vlor_dscnto)',
'									when sum(vlor_dscnto) > a.vlor_sldo_cptal and sum(vlor_dscnto) > 0 then',
'										a.vlor_sldo_cptal',
'								end as vlor_dscnto from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo( p_cdgo_clnte				=> :F_CDGO_CLNTE,',
'																													p_id_impsto				=> :P321_ID_IMPSTO,',
'																													p_id_impsto_sbmpsto		=> :P321_ID_IMPSTO_SBMPSTO,',
'																													p_vgncia				=> a.vgncia,',
'																													p_id_prdo				=> a.id_prdo,',
'																													p_id_cncpto				=> a.id_cncpto,',
'																													p_id_sjto_impsto		=> :P321_ID_SJTO_IMPSTO,',
'																													p_fcha_pryccion			=> :P322_FCHA_VNCMNTO,',
'																													p_vlor					=> a.vlor_sldo_cptal,',
'																													p_cdna_vgncia_prdo_pgo	=> :P321_VGNCIA_PRDO,',
'																													p_cdna_vgncia_prdo_ps	=> null))),0)',
'					+',
'					nvl( ( select case when sum(vlor_dscnto) < a.vlor_intres and sum(vlor_dscnto) > 0 then',
'										sum(vlor_dscnto)',
'									when sum(vlor_dscnto) > a.vlor_intres and sum(vlor_dscnto) > 0 then',
'										a.vlor_intres',
'								end as vlor_dscnto from table(pkg_re_documentos.fnc_cl_descuento_x_vgncia_prdo( p_cdgo_clnte				=> :F_CDGO_CLNTE,',
'																													p_id_impsto				=> :P321_ID_IMPSTO,',
'																													p_id_impsto_sbmpsto		=> :P321_ID_IMPSTO_SBMPSTO,',
'																													p_vgncia				=> a.vgncia,',
'																													p_id_prdo				=> a.id_prdo,',
'																													p_id_cncpto				=> a.id_cncpto_intres_mra,',
'																													p_id_sjto_impsto		=> :P321_ID_SJTO_IMPSTO,',
'																													p_fcha_pryccion			=> :P322_FCHA_VNCMNTO,',
'																													p_vlor					=> a.vlor_intres,',
'																													p_cdna_vgncia_prdo_pgo	=> :P321_VGNCIA_PRDO, ',
'																													p_cdna_vgncia_prdo_ps	=> null))),0)',
'					else ',
'						0',
'				end as vlor_dscnto',
'   from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto(p_cdgo_clnte			=> :F_CDGO_CLNTE,',
'																	p_id_impsto				=> :P321_ID_IMPSTO,',
'																	p_id_impsto_sbmpsto		=> :P321_ID_IMPSTO_SBMPSTO,',
'																	p_id_sjto_impsto		=> :P321_ID_SJTO_IMPSTO,',
'																	p_fcha_vncmnto			=> :P322_FCHA_VNCMNTO) )a',
'	',
'   join apex_collections b on collection_name = ''VGNCIA_PRDO_PGO'' ',
'		and b.n001 = a.vgncia ',
'		and b.n002 = a.prdo',
'		and b.n003 = a.id_orgen',
'   ) a;'))
,p_attribute_02=>'P322_CDGO_RCBO_TPO'
,p_attribute_03=>'P322_VLOR_TTAL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101713400073392885)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_dcmnto            re_g_documentos.id_dcmnto%type;',
'v_vlor_ttal_dcmnto     number;',
'',
'begin',
'    v_vlor_ttal_dcmnto := 0;',
'    ',
'    if :P322_CDGO_RCBO_TPO = ''DAB'' then',
'        v_vlor_ttal_dcmnto := :P322_VLOR_ABNO;',
'    else ',
'        v_vlor_ttal_dcmnto := :P322_VLOR_TTAL;',
'    end if;',
'    ',
'    v_id_dcmnto := pkg_re_documentos.fnc_gn_documento (p_cdgo_clnte 			=> :F_CDGO_CLNTE, ',
'                                                       p_id_impsto 			    => :P321_ID_IMPSTO, ',
'                                                       p_id_impsto_sbmpsto 	    => :P321_ID_IMPSTO_SBMPSTO, ',
'                                                       p_cdna_vgncia_prdo		=> :P321_VGNCIA_PRDO,',
'							                           p_cdna_vgncia_prdo_ps	=> null,',
'							                           p_id_dcmnto_lte		    => null,',
'                                                       p_id_sjto_impsto         => :P321_ID_SJTO_IMPSTO,',
'                                                       p_fcha_vncmnto			=> :P322_FCHA_VNCMNTO,',
'                                                       p_cdgo_dcmnto_tpo        => :P322_CDGO_RCBO_TPO,',
'                                                       p_nmro_dcmnto            => null,',
'                                                       p_vlor_ttal_dcmnto       => v_vlor_ttal_dcmnto,',
'                                                       p_indcdor_entrno         => ''PRVDO'');',
'      ',
'    if v_id_dcmnto  > 0  then ',
'         :F_ID_DCMNTO := to_number(v_id_dcmnto);',
'         select nmro_dcmnto into :P322_NMRO_DCMNTO from re_g_documentos where id_dcmnto = :F_ID_DCMNTO;',
'    end if;',
'    insert into gti_aux (col1, col2) values (''F_ID_DCMNTO ''|| :F_ID_DCMNTO, ''v_id_dcmnto ''|| v_id_dcmnto); commit;',
'end;',
'',
''))
,p_process_error_message=>'Error al generar el documento, por favor consulte con el adiministrador'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_IMPRIMIR,BTN_ENVIAR_CORREO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Documento Generado Exitosamente N\00B0 &P322_ID_DCMNTO.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101713017528392885)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Crear Collection Vigencias-Periodos Pagos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_crcter_lmtdor_cdna      varchar2(1);',
'v_cdna_vgncia_prdo        varchar2(4000);',
'',
'Begin',
'',
'v_crcter_lmtdor_cdna := '':'';',
'v_cdna_vgncia_prdo := :P321_VGNCIA_PRDO;',
'',
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''VGNCIA_PRDO_PGO'');',
'    ',
'    if apex_collection.collection_exists(''VGNCIA_PRDO_PGO'') then',
'        ',
'        for c_vgncia_prdio in (select distinct vgncia, prdo, id_orgen',
'                                 from dual, ',
'                                 json_table(:P321_VGNCIA_PRDO, ''$.VGNCIA_PRDO[*]'' ',
'                                             columns (vgncia 	number path ''$.vgncia'',',
'                                                      prdo 	    number path ''$.prdo'',',
'                                                      id_orgen  number path ''$.id_orgen'')) as vgncia_prdo ',
'                                where vgncia_prdo.vgncia   is not null',
'                                  and vgncia_prdo.prdo     is not null) loop ',
'            APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''VGNCIA_PRDO_PGO'',',
'                                        p_n001            => c_vgncia_prdio.vgncia,',
'                                        p_n002            => c_vgncia_prdio.prdo,',
'                                        p_n003            => c_vgncia_prdio.id_orgen);',
'        end loop;',
'    end if;',
'    ',
'End;',
'',
''))
,p_process_error_message=>unistr('Error al Crear la colecci\00F3n')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
