prompt --application/pages/page_00333
begin
wwv_flow_api.create_page(
 p_id=>333
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Lotes de Recaudos'
,p_step_title=>'Lotes de Recaudos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const fnEliminarLote = (pIdLote) => {',
'    apex.server.process("Eliminar_Lote", {',
'       x01: pIdLote',
'    }).then((resp) => {',
'        if(resp.o_cdgo_rspsta === 0){',
'            ',
'            apex.message.showPageSuccess("El lote conciliado ha sido eliminado.");',
'            ',
'            var region = apex.region( "LOTES_CONCILIACION_RECAUDOS" );',
'            region.refresh();',
'        }else{',
'            fnErrorAlertaSwal(resp.o_mnsje_rspsta);',
'        }',
'    })',
'}',
'',
'var fnErrorAlertaSwal = function(pMsg){',
'    Swal.fire({',
'            icon: ''error'',',
unistr('            title:  ''<H2 >Validaci\00F3n</H2>'','),
'            html: ''<H4>''+pMsg+''</H4>''',
'        });',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20260108113850'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7817595644684533)
,p_plug_name=>'<b>Opciones</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7817642555684534)
,p_plug_name=>'<b>Ayuda</b>'
,p_parent_plug_id=>wwv_flow_api.id(7817595644684533)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>Ayuda</h3>',
unistr('<p style="text-align: justify;">Esta opci\00F3n le permitir\00E1 consultar los recaudos que se encuentran entre un rango de fechas especficado, los cuales al dar Click sobre el bot\00F3n "Conciliar Recaudos", ser\00E1n inclu\00EDdos en la conciliaci\00F3n.</b>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104130560940092040)
,p_plug_name=>unistr('<b>Criterios de Conciliaci\00F3n: &P333_FCHA_CNCLCION.</b>')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104131524588092050)
,p_plug_name=>'Lotes'
,p_region_name=>'LOTES_CONCILIACION_RECAUDOS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_rcdo_lte_cnclcion',
'     , id_rcdo_archvo_cnclcion',
'     , nmro_lte',
'     , fcha_cnclcion',
'     , fcha_rcdo',
'     , nmbre_impsto     ',
'     , nmbre_bnco',
'     , nmro_cnta',
'     , ttal_rcdos',
'     , vlor_lte',
'     , vlor_ttal_cncptos',
'from v_re_g_recaudos_lte_cnclcion',
'where id_rcdo_archvo_cnclcion = :P333_ID_RCDO_ARCHVO_CNCLCN'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(7817214258684530)
,p_name=>'FCHA_RCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RCDO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Recaudos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
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
 p_id=>wwv_flow_api.id(105204732088936402)
,p_name=>'ID_RCDO_LTE_CNCLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCDO_LTE_CNCLCION'
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
 p_id=>wwv_flow_api.id(105204876272936403)
,p_name=>'NMRO_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Lote')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(105205152631936406)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(105205939269936414)
,p_name=>'NMBRE_BNCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_BNCO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Banco'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(105206186062936416)
,p_name=>'NMRO_CNTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Cuenta')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(105206270603936417)
,p_name=>'TTAL_RCDOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TTAL_RCDOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cantidad Recaudos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
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
 p_id=>wwv_flow_api.id(105206337344936418)
,p_name=>'Valor Lote'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Lote'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(105207051779936425)
,p_name=>'FCHA_CNCLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_CNCLCION'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha Conciliaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
 p_id=>wwv_flow_api.id(105207162597936426)
,p_name=>'Valor Conceptos'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_CNCPTOS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Conceptos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(105207233557936427)
,p_name=>'LINK'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Conceptos'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:334:&SESSION.::&DEBUG.:RP:P334_ID_RCDO_ARCHVO_CNCLCION,P334_ID_RCDO_LTE_CNCLCION:&ID_RCDO_ARCHVO_CNCLCION.,&ID_RCDO_LTE_CNCLCION.'
,p_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-eye"></span>'
,p_link_attributes=>'title="Eliminar" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot"'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(105207755757936432)
,p_name=>'ID_RCDO_ARCHVO_CNCLCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RCDO_ARCHVO_CNCLCION'
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
 p_id=>wwv_flow_api.id(105409291556116003)
,p_name=>'LINK_ELIMINAR'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:fnEliminarLote(&ID_RCDO_LTE_CNCLCION.);'
,p_link_text=>'<span aria-hidden="true" class="t-Icon fa fa-trash"></span>'
,p_link_attributes=>'title="Eliminar" class="t-Button t-Button--noLabel t-Button--icon t-Button--danger"'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from re_g_recaudos_archvo_cnclcn',
'where id_rcdo_archvo_cnclcion = :P333_ID_RCDO_ARCHVO_CNCLCN',
'and estdo_archvo = ''IN'';'))
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(105204619279936401)
,p_internal_uid=>105204619279936401
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
 p_id=>wwv_flow_api.id(105210628474050638)
,p_interactive_grid_id=>wwv_flow_api.id(105204619279936401)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(105210734669050638)
,p_report_id=>wwv_flow_api.id(105210628474050638)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(7863809752816189)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(7817214258684530)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105211257434050640)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(105204732088936402)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105211799157050643)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(105204876272936403)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105212239013050645)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(105205152631936406)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105212779011050647)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(105205939269936414)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186.3
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105213270017050649)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(105206186062936416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105213786106050650)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(105206270603936417)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105214235296050652)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(105206337344936418)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105222985833233017)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(105207051779936425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105227356407419734)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(105207162597936426)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105234927878872979)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(105207233557936427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105237819541913419)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(105207755757936432)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(105430439634476411)
,p_view_id=>wwv_flow_api.id(105210734669050638)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(105409291556116003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(105209552736936450)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7817595644684533)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7746939515539427)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(7817595644684533)
,p_button_name=>'BTN_FINALIZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>unistr('Finalizar Conciliaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--select 1',
'--from re_g_recaudos_archvo_cnclcn',
'--where id_rcdo_archvo_cnclcion = :P333_ID_RCDO_ARCHVO_CNCLCN',
'--and estdo_archvo = ''IN'';',
'',
unistr('-- Se puede finalizar solo cuando existan lotes inclu\00EDdos en la concicliaci\00F3n'),
'select 1',
'from re_g_recaudos_lte_cnclcion a',
'where a.id_rcdo_archvo_cnclcion = :P333_ID_RCDO_ARCHVO_CNCLCN;'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7817390706684531)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(7817595644684533)
,p_button_name=>'BTN_GENERAR_ARCHIVO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Archivos'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7867415681460209)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(7817595644684533)
,p_button_name=>'BTN_CONSULTAR_ARCHIVOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar Archivos'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from re_g_rcdos_archv_cnclcn_arc',
'where id_rcdo_archvo_cnclcion = :P333_ID_RCDO_ARCHVO_CNCLCN;'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(142323750196238536)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(7817595644684533)
,p_button_name=>'BTN_INTRFZ_TOTAL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>unistr('Env\00EDo a Interfaz Total')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de enviar a la Interfaz Contable todos los registros?  Nota: Al aceptar, el procesamiento se realizarÃ¡ en segundo plano. En cuanto Ã©ste termine, el sistema le notificarÃ¡ de manera automÃ¡tica que ha terminado. '',''BTN_INTRFZ_TOTAL'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rcdo       number;',
'    v_ajste      number;',
'    v_lqdcion    number;',
'    v_vgncia     number;',
'begin',
'',
'	v_vgncia     :=  pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                   => :F_CDGO_CLNTE',
'						   									         	, p_cdgo_dfncion_clnte_ctgria   => ''GFN''',
'															        	, p_cdgo_dfncion_clnte          => ''VAC'' );',
'                                                                    ',
'    select count(1) into v_rcdo',
'    from   re_g_recaudos a',
'    where  extract(year from a.fcha_rcdo) = v_vgncia ',
'     and   a.cdgo_rcdo_estdo = ''AP''',
'     and   a.vlor > 0',
'     and   a.indcdor_intrfaz = ''N'' ;',
' ',
'    select  count(1) into v_ajste',
'    from    v_gf_g_ajustes a ',
'    where   a.cdgo_clnte = :F_CDGO_CLNTE ',
'    and     extract(year from a.fcha_aplccion) = v_vgncia',
'    and     a.cdgo_ajste_estdo = ''AP''',
'    and     (a.indcdor_intrfaz = ''N'' or a.indcdor_intrfaz is null)',
'    and     a.vlor > 0 ;',
'',
'    select  count(1) into v_lqdcion',
'    from    gi_g_liquidaciones a',
'    join    v_si_i_sujetos_impuesto h on a.id_sjto_impsto = h.id_sjto_impsto',
'    join    df_c_impuestos g on h.id_impsto = g.id_impsto',
'    where a.cdgo_clnte =  :F_CDGO_CLNTE',
'    and extract(year from a.fcha_lqdcion) = v_vgncia',
'    and a.cdgo_lqdcion_estdo = ''L''',
'    and a.vlor_ttal > 0',
'    and a.indcdor_mgrdo is null',
'    and a.indcdor_intrfaz = ''N'' ',
'    and not exists',
'        (select 1',
'        from gf_g_movimientos_financiero',
'        where id_orgen = id_lqdcion',
'        and cdgo_mvmnto_orgn = ''LQ''',
'        and cdgo_mvnt_fncro_estdo = ''AN'') ;',
'',
'    if ( v_rcdo > 0 or v_ajste > 0 or v_lqdcion > 0 ) then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(142324061340238539)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(7817595644684533)
,p_button_name=>'BTN_INTRFZ_CNCLDO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>unistr('Env\00EDo a Interfaz<br> Conciliado')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de enviar a la Interfaz Contable lo conciliado?  Nota: Al aceptar, el procesamiento se realizarÃ¡ en segundo plano. En cuanto Ã©ste termine, el sistema le notificarÃ¡ de manera automÃ¡tica que ha terminado. '',''BTN_INTRFZ_CNCLDO'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_rcdo_cncldo    number; ',
'    v_vgncia         number;',
'begin',
'',
'	v_vgncia     := pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                   => :F_CDGO_CLNTE',
'																	, p_cdgo_dfncion_clnte_ctgria   => ''GFN''',
'																	, p_cdgo_dfncion_clnte          => ''VAC'' );',
'                                                                    ',
'	select count(1) into v_rcdo_cncldo',
'	from v_re_g_recaudos            a',
'	join re_g_recaudos_cncpto_cnclcn c on a.id_Rcdo = c.id_rcdo',
'	join re_g_recaudos_lte_cnclcion  b on b.id_rcdo_lte_cnclcion = c.id_rcdo_lte_cnclcion',
'	join re_g_recaudos_archvo_cnclcn e on e.id_rcdo_archvo_cnclcion = b.id_rcdo_archvo_cnclcion',
'									and e.estdo_archvo = ''FN''',
'	where a.cdgo_clnte = :F_CDGO_CLNTE',
'	 and extract(year from e.fcha_cnclcion) = v_vgncia ',
'	 and a.cdgo_rcdo_estdo = ''AP''',
'	 and a.vlor > 0',
'	 and not exists ( select    id_orgen',
'					  from      genesys_interfaz.in_movimiento_contables',
'					  where     tpo_mvmnto      = ''RE''',
'					  and       id_orgen        = a.id_rcdo',
'					  and       indcdor_cncldo  = ''S''',
'					) ;',
'',
'    if ( v_rcdo_cncldo > 0 ) then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(104131118289092046)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(104130560940092040)
,p_button_name=>'BTN_CONCILIAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Conciliar Recaudos'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from re_g_recaudos_archvo_cnclcn a',
'where id_rcdo_archvo_cnclcion = :P333_ID_RCDO_ARCHVO_CNCLCN',
'--and trunc( a.FCHA_CNCLCION ) between :P333_FCHA_RCDO_DSDE and :P333_FCHA_RCDO_HSTA',
'and estdo_archvo = ''IN'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-line-chart'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7867345900460208)
,p_branch_name=>'Ir a 333'
,p_branch_action=>'f?p=&APP_ID.:333:&SESSION.::&DEBUG.:RP:P333_ID_RCDO_ARCHVO_CNCLCN:&P333_ID_RCDO_ARCHVO_CNCLCN.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(104131118289092046)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(7867507819460210)
,p_branch_name=>'Ir a Concsultar Archivvos 336'
,p_branch_action=>'f?p=&APP_ID.:336:&SESSION.::&DEBUG.:RP:P336_ID_RCDO_ARCHVO_CNCLCION:&P333_ID_RCDO_ARCHVO_CNCLCN.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(7867415681460209)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(105409151305116002)
,p_branch_name=>'Ir a la pagina 332'
,p_branch_action=>'f?p=&APP_ID.:332:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(105209552736936450)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7747172794539429)
,p_name=>'P333_MNSJE_ERROR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(104130560940092040)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7817712422684535)
,p_name=>'P333_FCHA_CNCLCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(104130560940092040)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104130676765092041)
,p_name=>'P333_FCHA_RCDO_DSDE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104130560940092040)
,p_prompt=>'<b>Fecha Recaudo Desde</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104130748376092042)
,p_name=>'P333_FCHA_RCDO_HSTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104130560940092040)
,p_prompt=>'<b>Fecha Recaudo Hasta</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355630355050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(104131085169092045)
,p_name=>'P333_ID_RCDO_ARCHVO_CNCLCN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(104130560940092040)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105206968422936424)
,p_name=>'P333_CDGO_CLNTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(104130560940092040)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(105410329633116014)
,p_name=>'P333_ERROR_MSG'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(104130560940092040)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(105410166259116012)
,p_validation_name=>'P333_FCHA_RCDO_DSDE no NULL'
,p_validation_sequence=>10
,p_validation=>'P333_FCHA_RCDO_DSDE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe especificar una fecha inicial.'
,p_when_button_pressed=>wwv_flow_api.id(104131118289092046)
,p_associated_item=>wwv_flow_api.id(104130676765092041)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(105410250168116013)
,p_validation_name=>'P333_FCHA_RCDO_HSTA no NULL'
,p_validation_sequence=>20
,p_validation=>'P333_FCHA_RCDO_HSTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Debe especificar una fecha l\00EDmite.')
,p_when_button_pressed=>wwv_flow_api.id(104131118289092046)
,p_associated_item=>wwv_flow_api.id(104130748376092042)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7867657192460211)
,p_validation_name=>'P333_ID_RCDO_ARCHVO_CNCLCN not null'
,p_validation_sequence=>30
,p_validation=>'P333_ID_RCDO_ARCHVO_CNCLCN'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# debe tener alg\00FAn valor')
,p_validation_condition=>'BTN_CONSULTAR_ARCHIVOS,BTN_FINALIZAR'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(105206713765936422)
,p_name=>'Al dar Click en BTN_CONCILIAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(104131118289092046)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(105206871132936423)
,p_event_id=>wwv_flow_api.id(105206713765936422)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P333_FCHA_RCDO_DSDE'') == ''''){',
'    fnErrorAlertaSwal(''Debe ingresar una fecha inicial de recaudo.'');',
'}else if($v(''P333_FCHA_RCDO_HSTA'') == ''''){',
unistr('    fnErrorAlertaSwal(''Debe ingresar una fecha l\00EDmite de recaudo.'');'),
'}else if($v(''P333_FCHA_RCDO_DSDE'') > $v(''P333_FCHA_RCDO_HSTA'')){',
unistr('    fnErrorAlertaSwal(''La fecha inicial no puede ser posterior a la fecha l\00EDmite.'');'),
'}else{',
unistr('    apex.message.confirm( "\00BFDesea generar los lotes de conciliaci\00F3n para los recaudos que se encuentran dentro del rango especificado?", function( okPressed ) { '),
'        if( okPressed ) {',
'            apex.server.process("Generar_Lotes_Conciliacion", {',
'               pageItems: "#P333_FCHA_RCDO_DSDE,#P333_FCHA_RCDO_HSTA,#P333_CDGO_CLNTE"',
'            }).then((resp) => {',
'                if (resp.o_cdgo_rspsta > 0) {',
'                    //console.log(resp);',
'                    /*apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: [',
'                                "page"',
'                            ],',
'                            message: resp.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);*/',
'                    ',
'                    fnErrorAlertaSwal(resp.o_mnsje_rspsta);',
'',
'',
'                }else{      ',
'',
unistr('                    apex.message.showPageSuccess( "Se han creado los lotes de conciliaci\00F3n de recaudos.");'),
'',
'                }',
'                var region = apex.region("LOTES_CONCILIACION_RECAUDOS");',
'				region.refresh();',
'            });',
'        }',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(104131472210092049)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Lotes_Conciliacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(2000);',
'begin',
'',
'    pkg_re_recaudos_conciliacion.prc_rg_lotes_conciliacion(p_cdgo_clnte             =>    :F_CDGO_CLNTE',
'                                                         , p_id_rcdo_archvo_cnclcn  =>    :P333_ID_RCDO_ARCHVO_CNCLCN',
'                                                         , p_fcha_rcdo_dsde         =>    :P333_FCHA_RCDO_DSDE',
'                                                         , p_fcha_rcdo_hsta         =>    :P333_FCHA_RCDO_HSTA',
'                                                         , o_cdgo_rspsta            =>    o_cdgo_rspsta',
'                                                         , o_mnsje_rspsta           =>    o_mnsje_rspsta);',
'                                                         ',
'    /*apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_all();*/',
'    ',
'    if o_cdgo_rspsta <> 0 then',
'        apex_error.add_error(',
'              p_message => o_cdgo_rspsta||''-''||o_mnsje_rspsta',
'            , p_display_location => apex_error.c_inline_in_notification',
'        );',
'    end if;',
'    ',
'exception',
'    when others then',
'        /*apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', ''10'');',
unistr('        apex_json.write(''o_mnsje_rspsta'', ''Ha ocurrido un error al intentar procesar los lotes de conciliaci\00F3n'');'),
'        apex_json.close_all();*/',
unistr('        apex_util.set_session_state(''P333_ERROR_MSG'', ''Ha ocurrido un error al intentar procesar los lotes de conciliaci\00F3n'');'),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(104131118289092046)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7790452707115425)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar archivos planos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(2000);',
'    v_drctrio varchar2(100) := ''ETL_CARGA'';',
'begin',
'    insert into muerto(v_001, v_002, t_001) values (''Antes de pkg_re_recaudos_conciliacion.prc_gn_archivo_maestro'' || :P333_ID_RCDO_ARCHVO_CNCLCN, ''joseaa'', systimestamp); commit; ',
'    ',
'    pkg_re_recaudos_conciliacion.prc_gn_archivo_maestro(p_id_rcdo_archvo_cnclcion  => to_number(:P333_ID_RCDO_ARCHVO_CNCLCN)',
'                                                      , p_drctrio                  => v_drctrio',
'                                                      , o_cdgo_rspsta              => o_cdgo_rspsta',
'                                                      , o_mnsje_rspsta             => o_mnsje_rspsta);',
'',
'    if o_cdgo_rspsta <> 0 then',
'        apex_error.add_error(',
'              p_message => o_cdgo_rspsta||''-''||o_mnsje_rspsta',
'            , p_display_location => apex_error.c_inline_in_notification',
'        );',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(7817390706684531)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7817401901684532)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Finalizar_concliacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(2000);',
'begin',
unistr('    -- Finalizar la conciliaci\00F3n.'),
'    pkg_re_recaudos_conciliacion.prc_ac_finalizar_concliacion(p_id_rcdo_archvo_cnclcion => :P333_ID_RCDO_ARCHVO_CNCLCN',
'                                                            , o_cdgo_rspsta            => o_cdgo_rspsta',
'                                                            , o_mnsje_rspsta           => o_mnsje_rspsta);',
'                                                            ',
unistr('    -- Si se genera un error al finalizar la conciliaci\00F3n'),
'    if o_cdgo_rspsta <> 0 then',
'        apex_error.add_error(',
'              p_message => o_cdgo_rspsta||''-''||o_mnsje_rspsta',
'            , p_display_location => apex_error.c_inline_in_notification',
'        );',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(7746939515539427)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142323860435238537)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enviar_IC_Total'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_error 	varchar2(1000);',
'	v_vgncia	number;',
'begin',
'',
'	v_vgncia     := pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                   => :F_CDGO_CLNTE',
'																	, p_cdgo_dfncion_clnte_ctgria   => ''GFN''',
'																	, p_cdgo_dfncion_clnte          => ''VAC'' );',
'																								',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_RG_INTRFAZ_CNTBLE_MONTERIA_TOTAL"'', attribute => ''job_action'', value => ''PKG_GF_INTERFAZ_CONTABLE_MONTERIA.PRC_GN_INTERFAZ_FINANCIERA_TOTAL'');',
'',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_RG_INTRFAZ_CNTBLE_MONTERIA_TOTAL"'', attribute => ''number_of_arguments'', value => ''3'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_INTRFAZ_CNTBLE_MONTERIA_TOTAL'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_INTRFAZ_CNTBLE_MONTERIA_TOTAL'', argument_position => 2, argument_value => v_vgncia);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_INTRFAZ_CNTBLE_MONTERIA_TOTAL'', argument_position => 3, argument_value => :F_ID_USRIO);',
'    END;',
'',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_RG_INTRFAZ_CNTBLE_MONTERIA_TOTAL"'');',
'    END; ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(142323750196238536)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142323917548238538)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enviar_IC_Conciliado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_error 	varchar2(1000);',
'	v_vgncia	number;',
'begin',
'',
'	v_vgncia     := pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                   => :F_CDGO_CLNTE',
'																	, p_cdgo_dfncion_clnte_ctgria   => ''GFN''',
'																	, p_cdgo_dfncion_clnte          => ''VAC'' );',
'																								',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_RG_INTRFAZ_CNTBLE_MONTERIA_CNCLDO"'', attribute => ''job_action'', value => ''PKG_GF_INTERFAZ_CONTABLE_MONTERIA.PRC_GN_INTERFAZ_FINANCIERA_CNCLDO'');',
'',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_RG_INTRFAZ_CNTBLE_MONTERIA_CNCLDO"'', attribute => ''number_of_arguments'', value => ''3'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_INTRFAZ_CNTBLE_MONTERIA_CNCLDO'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_INTRFAZ_CNTBLE_MONTERIA_CNCLDO'', argument_position => 2, argument_value => v_vgncia);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_RG_INTRFAZ_CNTBLE_MONTERIA_CNCLDO'', argument_position => 3, argument_value => :F_ID_USRIO);',
'    END;',
'',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_RG_INTRFAZ_CNTBLE_MONTERIA_CNCLDO"'');',
'    END; ',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(142324061340238539)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(105409365400116004)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar_Lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(2000);',
'begin',
'',
'    pkg_re_recaudos_conciliacion.prc_el_lote_conciliacion(p_id_rcdo_lte_cnclcion   => APEX_APPLICATION.g_x01',
'                                                        , o_cdgo_rspsta            => o_cdgo_rspsta',
'                                                        , o_mnsje_rspsta           => o_mnsje_rspsta);',
'                                                         ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_all();',
'    ',
'exception',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', ''10'');',
unistr('        apex_json.write(''o_mnsje_rspsta'', ''Ha ocurrido un error al intentar procesar los lotes de conciliaci\00F3n'');'),
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
