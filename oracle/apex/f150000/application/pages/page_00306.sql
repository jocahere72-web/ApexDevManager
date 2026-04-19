prompt --application/pages/page_00306
begin
wwv_flow_api.create_page(
 p_id=>306
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Deuda proyectada Pliego de cargos'
,p_page_mode=>'MODAL'
,p_step_title=>'Deuda proyectada Pliego de cargos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionReciboOmiso.js?v=19.1.0.00.15',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1.1.1'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) { ',
'    console.log("configuracion");',
'    jsonConfig = await cargarConfig();',
'    consultarDeudaProyectada();',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#deudaProyectada_ig_report_settings{',
'    display:none;  ',
'}',
'',
'#cabecera_portal{',
'    display:none;  ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20241015173805'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(215274241245175194)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b>',
'   <i> Ayuda <i class="fa fa-question-circle"></i></i>',
'</b>',
'<br>',
'',
'<i>',
'   <b>1. </b>Se puede cambiar la Fecha de Vencimiento. Al cambiar la fecha de vencimiento se vuelven a calcular los valores intereses y los valores de descuentos.<br>',
'   <b>2. </b>Se puede cambiar el Tipo de pago. Si se selecciona Tipo de pago <b>Abono</b>, se debe ingresar el valor del abono. y este debe ser mayor que cero (0) y menor que el valor total del recibo. <br>',
'<b>NOTA:</b> El tipo de pago <b>Abono</b> no genera descuentos.',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(265886638787131220)
,p_plug_name=>'Deuda Proyectada'
,p_region_name=>'deudaProyectada'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001 ',
'     , c002',
'     , c003',
'     , c004',
'     , c005',
'     , to_number(c006) c006',
'     , to_number(c007) c007',
'     , to_number(c008) c008',
'     , to_number(c009) c009',
'  from apex_collections',
' where collection_name = ''PROYECTADA'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(265886894919131223)
,p_name=>'C001'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C001'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(265887022157131224)
,p_name=>'C002'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C002'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(265887166452131225)
,p_name=>'C003'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C003'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(265887283371131226)
,p_name=>'C004'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C004'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Periodo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_api.id(265887374555131227)
,p_name=>'C005'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C005'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(265887416915131228)
,p_name=>'C006'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C006'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor <br/>Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>29
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(265887592377131229)
,p_name=>'C007'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C007'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Valor <br/>Inter\00E9s')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>29
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(265887618631131230)
,p_name=>'C008'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C008'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor <br/>Descuento'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>29
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(265887784814131231)
,p_name=>'C009'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C009'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Valor <br/>Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_05=>'BOTH'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>29
,p_enable_filter=>true
,p_filter_is_required=>false
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
 p_id=>wwv_flow_api.id(265886765306131221)
,p_internal_uid=>265886765306131221
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
 p_id=>wwv_flow_api.id(266264012242944478)
,p_interactive_grid_id=>wwv_flow_api.id(265886765306131221)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(266264138454944478)
,p_report_id=>wwv_flow_api.id(266264012242944478)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266266060068952459)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(265886894919131223)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266266568102952461)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(265887022157131224)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266267049458952462)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(265887166452131225)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266267556141952464)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(265887283371131226)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266268004625952465)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(265887374555131227)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266268542561952467)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(265887416915131228)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266269047189952468)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(265887592377131229)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266269544724952470)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(265887618631131230)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(266270077140952471)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(265887784814131231)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(210907906404003492)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(265887592377131229)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(210907916409003493)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(265887416915131228)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(210907992101003492)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(265887618631131230)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(210908137217003492)
,p_view_id=>wwv_flow_api.id(266264138454944478)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(265887784814131231)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191369229422343165)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(265886638787131220)
,p_button_name=>'btn_imprimir'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191369686935343166)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(265886638787131220)
,p_button_name=>'btn_pgo_pse'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pago PSE'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(191370012885343166)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(265886638787131220)
,p_button_name=>'btn_pago_en_linea'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pago PSE'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_ip    varchar2(1);',
'',
'begin',
'',
'   /* begin',
'        select ''S''',
'        into    v_ip',
'        from     ip_prmtdas',
'        where     ip = :F_IP_PBLCA;',
'    exception',
'        when  no_data_found then',
'            v_ip := ''N'';',
'        when  others then',
'             v_ip := ''N'';',
'    end;*/',
'',
'',
'    if pkg_gn_generalidades.fnc_vl_pago_pse(:F_CDGO_CLNTE,:P306_ID_IMPSTO, :P306_ID_IMPSTO_SBMPSTO)  = ''S'' then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(191385046256343192)
,p_branch_name=>'Imprimir Documento'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML,P2_NMBRE_RPRTE:&P306_ID_RPRTE.,<P_ID_DCMNTO>&P306_ID_DCMNTO.</P_ID_DCMNTO>,DOCUMENTO_&P306_NMRO_DCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(191369229422343165)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(191384602404343192)
,p_branch_name=>'Go To Page 104'
,p_branch_action=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:RP,104:P104_NMRO_DCMNTO,P104_IMPUESTO,P104_VLOR_PGAR,P104_CNTRBYNTE:&P306_NMRO_DCMNTO.,&P306_IMPUESTO.,&P306_VLOR_TTAL.,&P306_CNTRBYNTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(191384284210343191)
,p_branch_name=>'Ir_a_pagona_23'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:P23_FCHA,P23_CDGO_ORGN_TPO,P23_ID_IMPSTO,P23_VLOR_TTAL_DAB,P23_CDGO_RCBO_TPO,P23_ID_IMPSTO_SBMPSTO:&P306_FCHA.,DC,&P306_ID_IMPSTO.,&P306_VLOR_ABNO.,&P306_CDGO_RCBO_TPO.,&P306_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'btn_pago_en_linea'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191370487016343166)
,p_name=>'P306_FCHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_prompt=>'Fecha limite de pago'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191370845810343168)
,p_name=>'P306_CDGO_RCBO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_item_default=>'DNO'
,p_prompt=>'Tipo de pago'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Normal;DNO'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191371223004343169)
,p_name=>'P306_VLOR_ABNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_prompt=>'Valor Abono'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onkeyup="formatNumber(event,{''precision'':0})" onkeypress=" return validarExpresion(event, ''numeroEntero'')"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191371604671343169)
,p_name=>'P306_ID_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_item_default=>'P305_ID_IMPSTO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191372018995343169)
,p_name=>'P306_ID_RPRTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_rprte d ,',
'       a.id_rprte    r',
'  from gn_d_reportes a',
'  join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'                                and cdgo_clnte = :F_CDGO_CLNTE',
' where cdgo_rprte_grpo = ''RPG'' ',
'   and a.indcdor_gnrco = ''S''',
'   and b.actvo         = ''S''',
'union all    ',
'select a.nmbre_rprte d ,',
'       a.id_rprte    r',
'  from gn_d_reportes a',
' where a.cdgo_rprte_grpo = ''RPG''  ',
'   and a.indcdor_gnrco   = ''S''',
'   --and rownum            = 1',
'   ;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191372487037343171)
,p_name=>'P306_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_item_default=>'P305_ID_IMPSTO_SBMPSTO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191372805039343171)
,p_name=>'P306_ID_SJTO_IMPSTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_item_default=>'P305_ID_SJTO_IMPSTO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191373236158343172)
,p_name=>'P306_VGNCIA_PRDO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_item_default=>'P305_VGNCIA_PRDO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191373628802343172)
,p_name=>'P306_ID_DCMNTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191374063109343172)
,p_name=>'P306_CDGO_CLNTE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191374494001343172)
,p_name=>'P306_FCHA_MAX'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191374843709343173)
,p_name=>'P306_VLOR_TTAL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191375217814343173)
,p_name=>'P306_NMRO_DCMNTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191375612996343173)
,p_name=>'P306_IMPUESTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191376041228343173)
,p_name=>'P306_CNTRBYNTE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191376480017343174)
,p_name=>'P306_FCHA_VNCMNTO_OBLGCION'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(191376846909343174)
,p_name=>'P306_FCHA_LMTE_CLNDRIO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(265886638787131220)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191379592145343187)
,p_name=>unistr('al hacer clic en el bot\00F3n imprimir')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(191369229422343165)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191380028718343187)
,p_event_id=>wwv_flow_api.id(191379592145343187)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarRecibo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191381354416343190)
,p_name=>'al cambiar tipo de recibo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P306_CDGO_RCBO_TPO'
,p_condition_element=>'P306_CDGO_RCBO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191381899201343190)
,p_event_id=>wwv_flow_api.id(191381354416343190)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_VLOR_ABNO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191382325125343190)
,p_event_id=>wwv_flow_api.id(191381354416343190)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P306_VLOR_ABNO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191382796437343190)
,p_name=>unistr('al hacer clic en el bot\00F3n pse')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(191369686935343166)
,p_condition_element=>'P306_ID_IMPSTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'230011'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191383297269343191)
,p_event_id=>wwv_flow_api.id(191382796437343190)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.open("https://www.avalpaycenter.com/wps/portal/portal-de-pagos/web/pagos-aval/resultado-busqueda/realizar-pago?idConv=00013663&origen=buscar", "_blank")'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191383768947343191)
,p_event_id=>wwv_flow_api.id(191382796437343190)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.open("https://www.avalpaycenter.com/wps/portal/portal-de-pagos/web/pagos-aval/resultado-busqueda/realizar-pago/!ut/p/a1/lZBPU4MwEMW_ih48OZINBQpHgrUgtlSFKlycFGKNAkEK6PjpDe34t1rHnDa77-37JShB1ygpaceXtOGipHl_T4wb09INTwPVN-caAduLrJMz18UwASmIpQB-OTZ'
||'89Qfa-XHvd8lYJwMI3vzvgnG4DvAvVZf4GBxtp99Rt_yaZUhBMHHm8wgD_Ne_DfiH_wolXyU_vOCbYBtxLdjxh7GEHH6OsEZyA7G8aTjAYA7RZb_jnnb0WVmxustZo_AyzduMKRVt7m54eStQfACkXaU0E_WslmNe0fyEpmw15-xJeb5rirxfk4pC4YtCue1HSiXqpl9XiIyhuJNKFLsoOSxj40yW3kd5-lHuxA2MDW4qMr4UDm8zmqEY1'
||'i3asKVkfGxZRt97RSXeekQmOvbeJJiGowvP_p4E_tCWSTo5dclU_txwC8UHC-xQKka-rY51vEGpH1suGbCBVcuwVA10rG0Qy46VXHg9IADG5kBDVRFF0TXwWVGYg4eLI7p4YQvzPmSxvf8KuUOm4A!!/#Z7_8956I402K0K7A0AI5BJHBN00A7", "_blank")'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191378776215343186)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Fecha L\00EDmite pago')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_dias_limite date ;',
'    v_dias_final date;',
'    v_ndad_drcion varchar2(3);',
'    v_drcion number;',
'    v_dia_tpo varchar2(3);',
'    v_id_acto_tpo number;',
'    v_id_acto number;',
'    --v_fecha_limite date;',
'    v_fcha_fnal timestamp;',
'    v_fecha_incial timestamp;',
'    ',
'',
'begin',
'    /*select VLOR',
'    into v_dias_limite',
'    from df_i_definiciones_impuesto',
'    where (cdgo_clnte =23001 )--:F_CDGO_CLNTE)',
'    and (ID_IMPSTO = 230012)',
'    and cdgo_dfncn_impsto = ''DIN'';*/',
'    /*begin',
'        select a.id_acto_tpo',
'        into    v_id_acto_tpo',
'        from fi_g_fsclzcion_expdnte_acto a ',
'        join fi_g_fsclzc_expdn_cndd_vgnc  b on a.id_fsclzcion_expdnte = b.id_fsclzcion_expdnte    ',
'        and a.id_fsclzcion_expdnte_acto = b.id_fsclzcion_expdnte_acto',
'        join v_gn_d_actos_tipo  c on  a.id_acto_tpo = c.id_acto_tpo                                            ',
'        join gn_g_Actos       d on a.id_acto = d.id_acto              ',
'        join (select x.id_orgen  ',
'        from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto( p_cdgo_clnte 		 => :F_CDGO_CLNTE',
'                                                                        , p_id_impsto         => :P305_ID_IMPSTO',
'                                                                        , p_id_impsto_sbmpsto => :P305_ID_IMPSTO_SBMPSTO',
'                                                                        , p_id_sjto_impsto    => :P305_ID_SJTO_IMPSTO',
'                                                                        , p_fcha_vncmnto      => :P305_FECHA_INICIO)) x ) e on  b.id_lqdcion = e.id_orgen --36944522',
'        where c.cdgo_acto_tpo in (''PDI'',''PCM'',''PCE'',''PCN'')                ',
'        group by a.id_acto_tpo;',
'    exception    ',
'        when    no_data_found then ',
'            null;',
'        when others then',
'            null;    ',
'    end;  */      ',
'        insert into muerto (v_001,t_001) values(''P305_ID_ACTO_TPO ''||:P305_ID_ACTO_TPO, sysdate);  commit;',
'',
'   ',
'   begin',
'        select  undad_drcion,',
'                drcion,',
'                dia_tpo',
'        into    v_ndad_drcion,',
'                v_drcion,',
'                v_dia_tpo',
'        from gn_d_actos_tipo_tarea',
'        where id_acto_tpo = :P305_ID_ACTO_TPO --  v_id_acto_tpo',
'        ;',
'    exception',
'        when    no_data_found    then',
'            null;',
'        when    others    then',
'            null;',
'    end;',
'    v_fecha_incial := to_date(:P305_FECHA_INICIO, ''DD/MM/YYYY'');',
'    insert into muerto (v_001,t_001) values(''fecha de v_fecha_incial ''||v_fecha_incial, sysdate);  commit;',
'',
'    v_fcha_fnal := pk_util_calendario.fnc_cl_fecha_final( p_cdgo_clnte     => :F_CDGO_CLNTE, ',
'                                                        --p_fecha_inicial  => :P305_FECHA_INICIO,',
'                                                        p_fecha_inicial  => v_fecha_incial,',
'                                                        p_undad_drcion   => v_ndad_drcion,',
'                                                        p_drcion         => v_drcion,',
'                                                        p_dia_tpo        => v_dia_tpo);',
'    ',
'    --v_fecha_limite:= ''27/12/2022'';',
'    ',
'    insert into muerto (v_001,t_001) values(''fecha de P305_FECHA_INICIO ''||:P305_FECHA_INICIO, sysdate);  commit;',
'',
'    insert into muerto (v_001,t_001) values(''v_id_acto_tpo ''||v_id_acto_tpo, sysdate);  commit;',
'',
'    insert into muerto (v_001,t_001) values(''v_ndad_drcion ''||v_ndad_drcion, sysdate);  commit;',
'    insert into muerto (v_001,t_001) values(''v_drcion ''||v_drcion, sysdate);  commit;',
'    insert into muerto (v_001,t_001) values(''v_dia_tpo ''||v_dia_tpo , sysdate);  commit;',
'    insert into muerto (v_001,t_001) values(''fecha de v_fcha_fnal ''||trunc(v_fcha_fnal),  sysdate); commit;',
'',
'',
'',
'    :P306_FCHA:= trunc(v_fcha_fnal);',
'',
'    --:P306_FCHA:= to_date(v_fecha_limite,''DD/MM/YYYY'');',
'    /*:P306_FCHA := (pk_util_calendario.fnc_cl_fecha_final( p_cdgo_clnte     => :F_CDGO_CLNTE, ',
'    p_fecha_inicial  => :P305_FECHA_INICIO,',
'    p_undad_drcion   => v_ndad_drcion,',
'    p_drcion         => v_drcion,',
'    p_dia_tpo        => v_dia_tpo),  ''DD/MM/YY'')  ; */',
'',
'',
'',
'    --insert into muerto (v_001,t_001) values(''fecha de :P306_FCHA ''||:306_FCHA,  sysdate); commit;',
'',
'  --  :P306_FCHA_LMTE_CLNDRIO := to_date(v_fcha_fnal,''DD/MM/YYYY'');',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P306_FCHA_LMTE_CLNDRIO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191379122088343186)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_id_dcmnto            re_g_documentos.id_dcmnto%type;',
'v_vlor_ttal_dcmnto     number;',
'v_NMRO_DCMNTO          number;',
'-------',
'v_gn_d_reportes     gn_d_reportes%rowtype;',
'v_blob              blob;',
'v_object json_object_t := json_object_t();',
'v_json                clob;',
'v_consecutivo         number := pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''PYZ'');',
'v_file_blob        blob;',
'begin',
'',
'  begin',
'        v_vlor_ttal_dcmnto := 0;',
'',
'        if :P306_CDGO_RCBO_TPO = ''DNO'' then',
'',
'            v_vlor_ttal_dcmnto := :P306_VLOR_TTAL;',
'        end if;',
'',
'        insert into gti_aux (col1, col2) values (''P35_ID_SJTO_IMPSTO ''|| :P35_ID_SJTO_IMPSTO, ''P35_VGNCIA_PRDO ''|| :P45_VGNCIA_PRDO); commit;',
'        v_id_dcmnto := pkg_re_documentos.fnc_gn_documento (p_cdgo_clnte 			      => :F_CDGO_CLNTE, ',
'                                                           p_id_impsto 			        => :P35_ID_IMPSTO, ',
'                                                           p_id_impsto_sbmpsto 	    => :P35_ID_IMPSTO_SBMPSTO, ',
'                                                           p_cdna_vgncia_prdo		    => :P35_VGNCIA_PRDO,',
'                                                           p_cdna_vgncia_prdo_ps	  => null,',
'                                                           p_id_dcmnto_lte		      => null,',
'                                                           p_id_sjto_impsto         => :P35_ID_SJTO_IMPSTO,',
'                                                           p_fcha_vncmnto			      => :P306_FCHA,',
'                                                           p_cdgo_dcmnto_tpo        => :P306_CDGO_RCBO_TPO,',
'                                                           p_nmro_dcmnto            => null,',
'                                                           p_vlor_ttal_dcmnto       => v_vlor_ttal_dcmnto,',
'                                                           p_indcdor_entrno         => ''PBLCO'');',
'                                                           ',
'        ',
'       ',
'        if v_id_dcmnto  > 0  then ',
'             --:P306_ID_DCMNTO := to_number(v_id_dcmnto);',
'             --select nmro_dcmnto into :P306_NMRO_DCMNTO from re_g_documentos where id_dcmnto = to_number(v_id_dcmnto);-- :P306_ID_DCMNTO;',
'              select nmro_dcmnto into v_NMRO_DCMNTO from re_g_documentos where id_dcmnto = to_number(v_id_dcmnto);-- :P306_ID_DCMNTO;',
'             ',
'        end if;',
'    end;',
'    ----imprimir',
'    begin',
'    ',
'    ',
'           /* v_object.put(''id_impsto'', :P306_ID_IMPSTO);',
'            v_object.put(''id_impsto_sbimpsto'',:P35_ID_IMPSTO_SBMPSTO);',
'            v_object.put(''cdgo_clnte'', :F_CDGO_CLNTE);',
'            v_object.put(''usrio'', :F_NMBRE_USRIO);',
'            v_object.put(''id_sjto_impsto'',:P35_ID_SJTO_IMPSTO);',
'            -- v_object.put(''nmbre_rprte'',v_nmbre_rprte);',
'           -- v_object.put(''cnsctvo'',:P306_NMRO_DCMNTO);',
'             v_object.put(''cnsctvo'',v_NMRO_DCMNTO);           ',
'                v_object.put(''id_rprte'', 615 );--:P271_ID_PLNTLLA',
'            --:P273_JSON := v_object.to_clob();   ',
'            v_json := v_object.to_clob();  ',
'            insert into muerto (c_001,t_001) values(v_json, systimestamp); commit;',
'             apex_application.g_print_success_message := ''<span style="color:white">Genero el json''||v_json||''</span>'';',
'            apex_session.attach( p_app_id     => 66000',
'                           , p_page_id        => 37',
'                           , p_session_id => v(''APP_SESSION'') );*/',
'              ',
'',
'            --BUSCAMOS LOS DATOS DE PLANTILLA DE REPORTES',
'              select /*+ RESULT_CACHE */',
'                  r.*',
'              into v_gn_d_reportes ',
'              from gn_d_reportes r',
'             where id_rprte = 615;-- (select id_rprte from gn_d_plantillas where id_plntlla = :P271_ID_PLNTLLA);',
'',
'        --SETEAMOS EN SESSION LOS ITEMS NECESARIOS PARA GENERAR EL ARCHIVO             ',
'             /*apex_util.set_session_state(''P37_ID_RPRTE'',537 );-- v_gn_d_reportes.id_rprte);',
'            apex_util.set_session_state(''P37_JSON'' , v_json);   */ ',
'            begin ',
'                            apex_session.create_session( p_app_id   => 66000',
'                                                       , p_page_id  => 2',
'                                                       , p_username => ''PUBLIC'' );',
'',
'                            apex_util.set_session_state(''P2_XML''      , ''<P_ID_DCMNTO>'' || v_id_dcmnto || ''</P_ID_DCMNTO>'');           ',
'                            apex_util.set_session_state(''F_ID_DCMNTO'' , v_id_dcmnto );           ',
'                            apex_util.set_session_state(''F_CDGO_CLNTE'', :F_CDGO_CLNTE); ',
'                            apex_util.set_session_state(''F_FRMTO_MNDA'', ''FM$999G999G999G999G999G999G990'');',
'                            apex_util.set_session_state(''P2_ID_RPRTE'' , 615);',
'                            apex_util.set_session_state(''F_NMBRE_USRIO'' , ''PORTAL'');',
'',
'                            v_file_blob := apex_util.get_print_document( p_application_id		=> 66000',
'                                                                       , p_report_query_name	=> v_gn_d_reportes.nmbre_cnslta',
'                                                                       , p_report_layout_name	=> v_gn_d_reportes.nmbre_plntlla',
'                                                                       , p_report_layout_type	=> v_gn_d_reportes.cdgo_frmto_plntlla',
'                                                                       , p_document_format		=> v_gn_d_reportes.cdgo_frmto_tpo); ',
'',
'',
'',
'                                owa_util.mime_header(''application/pdf'', false);',
'                                htp.p(''Content-Length: '' || dbms_lob.getlength(v_file_blob));',
'                                htp.p(''Content-Disposition: filename="DOCUMENTO_'' || v_nmro_dcmnto || ''"'');',
'                                owa_util.http_header_close;',
'',
'                                wpg_docload.download_file(v_file_blob);                    ',
'                  end;',
'      ',
'           ',
'           exception  ',
'                 when others then',
'                      null;',
'           end;',
'           ',
'           ',
'   ',
'    ',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(191369229422343165)
,p_process_when_type=>'NEVER'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(191378469298343184)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DeudaProyectada'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    --v_prmtros       varchar2(2000) := :F_CDGO_CLNTE ||''&''|| :P4_ID_IMPSTO ||''&''|| :P4_ID_IMPSTO_SBMPSTO || ''&''|| :P4_ID_SJTO_IMPSTO || ''&'' || :P306_FCHA || ''&'' || :P4_VGNCIA_PRDO;',
'    v_json_t        json_object_t;',
'    v_json          clob;',
'    v_sql           clob; ',
'    v_array_t       json_array_t;',
'    v_keys          json_key_list;',
'    v_body          json_object_t := json_object_t();',
'begin',
'    v_body.put(''cliente'', :F_CDGO_CLNTE);',
'    v_body.put(''impuesto'', :P305_ID_IMPSTO);',
'    v_body.put(''subimpuesto'', :P305_ID_IMPSTO_SBMPSTO);',
'    v_body.put(''idsujeto'', :P305_ID_SJTO_IMPSTO);',
'    v_body.put(''fecha'', :P306_FCHA);',
'    --v_body.put(''fecha'', ''24/10/2022'');',
'    v_body.put(''vigencias'', :P305_VGNCIA_PRDO);',
'    v_body.put(''abono'', :P306_VLOR_ABNO);',
'    v_body.put(''tipo'', :P306_CDGO_RCBO_TPO);',
'    ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    --apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'    v_json := apex_web_service.make_rest_request( p_url          => :F_DRCCION_SRVDOR_PRVDO || ''recibo/deudaProyectadaOmiso''  ',
'                                                , p_http_method  => ''POST''',
'                                                , p_body         => v_body.stringify ); ',
'                                                /*, p_parm_name    => apex_string.string_to_table(''cliente&impuesto&subimpuesto&idsujeto&fecha&vigencias'',''&'')',
'                                                , p_parm_value   => apex_string.string_to_table(v_prmtros,''&''));*/ ',
'    ',
'    v_sql     := ''select * from json_table(''''''||v_json|| '''''' , ''''$[*]'''' columns('';',
'    v_array_t := json_array_t(v_json);',
'    ',
'    if (v_array_t.get_size > 0) then',
'        v_json_t  := json_object_t(v_array_t.get(0));',
'        v_keys    := v_json_t.get_keys(); ',
'',
'        for i in 1..v_keys.count loop',
'            v_sql := v_sql || ''"'' ||v_keys(i) || ''"'' || '' path ''''$."'' || v_keys(i) || ''"'''','' ;',
'        end loop;',
'    else',
'        v_sql := v_sql || ''n path ''''$.n'''','';',
'    end if; ',
'    ',
'    v_sql := substr(v_sql, 1, length(v_sql) -1 ) || ''))''; ',
'    ',
'    apex_collection.create_collection_from_query( p_collection_name    => ''PROYECTADA''',
'                                                , p_query              => v_sql',
'                                                , p_truncate_if_exists => ''YES'');',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');  ',
'    apex_json.write(''size'' , v_array_t.get_size); ',
'    apex_json.write(''v_json'' , v_body.stringify); ',
'    ',
'    apex_json.close_object;',
'                                                                     ',
'    exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'' , sqlerrm); ',
'            apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
