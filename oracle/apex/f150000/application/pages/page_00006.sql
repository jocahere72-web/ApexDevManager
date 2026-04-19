prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Deuda Proyectada'
,p_page_mode=>'MODAL'
,p_step_title=>'Deuda Proyectada'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionRecibo.js?v=1.251.251251',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1.1.1'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) { ',
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
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251130110506'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4366448107171702)
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
 p_id=>wwv_flow_api.id(54978845649127728)
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
'     , to_number(replace(c006,''.'','','')) c006',
'     , to_number(replace(c007,''.'','','')) c007',
'     , to_number(replace(c008,''.'','','')) c008',
'     , to_number(replace(c009,''.'','','')) c009',
'     , to_number(replace(c010,''.'','','')) c010',
'  from apex_collections',
' where collection_name = ''PROYECTADA'''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(54979101781127731)
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
 p_id=>wwv_flow_api.id(54979229019127732)
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
 p_id=>wwv_flow_api.id(54979373314127733)
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
 p_id=>wwv_flow_api.id(54979490233127734)
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
 p_id=>wwv_flow_api.id(54979581417127735)
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
 p_id=>wwv_flow_api.id(54979623777127736)
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
 p_id=>wwv_flow_api.id(54979799239127737)
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
 p_id=>wwv_flow_api.id(54979825493127738)
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
 p_id=>wwv_flow_api.id(54979991676127739)
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(81921384033011401)
,p_name=>'C010'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C010'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s <br/> Bancario')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(54978972168127729)
,p_internal_uid=>54978972168127729
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
 p_id=>wwv_flow_api.id(55356219104940986)
,p_interactive_grid_id=>wwv_flow_api.id(54978972168127729)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(55356345316940986)
,p_report_id=>wwv_flow_api.id(55356219104940986)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55358266930948967)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(54979101781127731)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55358774964948969)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(54979229019127732)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55359256320948970)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(54979373314127733)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55359763003948972)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(54979490233127734)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55360211487948973)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(54979581417127735)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55360749423948975)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(54979623777127736)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55361254051948976)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(54979799239127737)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55361751586948978)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(54979825493127738)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(55362284002948979)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(54979991676127739)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(81927374537011578)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(81921384033011401)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(113266000000)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(54979799239127737)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(123271000001)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(54979623777127736)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(198963000000)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(54979825493127738)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_ig_report_aggregate(
 p_id=>wwv_flow_api.id(344079000000)
,p_view_id=>wwv_flow_api.id(55356345316940986)
,p_function=>'SUM'
,p_column_id=>wwv_flow_api.id(54979991676127739)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54980416907127744)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(54978845649127728)
,p_button_name=>'btn_imprimir'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--gapBottom'
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
 p_id=>wwv_flow_api.id(23613069401126810)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(54978845649127728)
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
 p_id=>wwv_flow_api.id(5516147816658720)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(54978845649127728)
,p_button_name=>'btn_pago_en_linea'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pago PSE'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'    v_ip    varchar2(1);',
'begin',
'',
'    if pkg_gn_generalidades.fnc_vl_pago_pse(:F_CDGO_CLNTE,:P6_ID_IMPSTO,:P6_ID_IMPSTO_SBMPSTO)  = ''S'' then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'    ',
'    ',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(23614491566126824)
,p_branch_name=>'Go To Page 104'
,p_branch_action=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:RP,104:P104_NMRO_DCMNTO,P104_IMPUESTO,P104_VLOR_PGAR,P104_CNTRBYNTE:&P6_NMRO_DCMNTO.,&P6_IMPUESTO.,&P6_VLOR_TTAL.,&P6_CNTRBYNTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5516250233658721)
,p_branch_name=>'Ir_a_pagona_23'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:P23_CDGO_CLNTE,P23_FCHA,P23_CDGO_ORGN_TPO,P23_ID_IMPSTO,P23_VLOR_TTAL_DAB,P23_CDGO_RCBO_TPO,P23_ID_IMPSTO_SBMPSTO:&P6_CDGO_CLNTE.,&P6_FCHA.,DC,&P6_ID_IMPSTO.,&P6_VLOR_ABNO.,&P6_CDGO_RCBO_TPO.,&P6_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'btn_pago_en_linea'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4366556576171703)
,p_name=>'P6_CDGO_RCBO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_item_default=>'DNO'
,p_prompt=>'Tipo de pago'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Normal;DNO,Abono;DAB'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4366651138171704)
,p_name=>'P6_VLOR_ABNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_prompt=>'Valor Abono'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_api.id(4367064369171708)
,p_name=>'P6_VLOR_TTAL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4440480209236608)
,p_name=>'P6_FCHA_VNCMNTO_OBLGCION'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4440595567236609)
,p_name=>'P6_FCHA_LMTE_CLNDRIO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18357166635475801)
,p_name=>'P6_FCHA_MAX'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23614141206126821)
,p_name=>'P6_NMRO_DCMNTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23614299410126822)
,p_name=>'P6_IMPUESTO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23614337989126823)
,p_name=>'P6_CNTRBYNTE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54980288510127742)
,p_name=>'P6_FCHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha limite de pago'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'+0d'
,p_attribute_03=>'&P6_FCHA_LMTE_CLNDRIO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54980779905127747)
,p_name=>'P6_ID_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_item_default=>'P4_ID_IMPSTO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54980815621127748)
,p_name=>'P6_VGNCIA_PRDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_item_default=>'P4_VGNCIA_PRDO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54980947633127749)
,p_name=>'P6_ID_SJTO_IMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_item_default=>'P4_ID_SJTO_IMPSTO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54981049297127750)
,p_name=>'P6_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_item_default=>'P4_ID_IMPSTO_SBMPSTO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55480720358138601)
,p_name=>'P6_CDGO_CLNTE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(54978845649127728)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(18357252286475802)
,p_computation_sequence=>10
,p_computation_item=>'P6_FCHA_MAX'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json          clob;',
'    v_body          clob;',
'    v_json_object   json_object_t := json_object_t(:P4_VGNCIA_PRDO);',
'    v_json_array    json_array_t ;',
'begin',
'    v_json_object.put(''impuesto'', :P4_ID_IMPSTO);',
'    v_json_object.put(''cliente'', :F_CDGO_CLNTE);',
'    v_json_array := json_array_t(v_json_object.get(''VGNCIA_PRDO'').stringify);',
'    v_json_object.put(''VGNCIA_PRDO'', v_json_array.stringify); ',
'    v_body := v_json_object.stringify; ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'    v_json := apex_web_service.make_rest_request( p_url          => :F_DRCCION_SRVDOR || ''util/FechaMaximaTasaMora''',
'                                                , p_http_method  => ''POST''',
'                                                , p_body => v_body); ',
'    ',
'   return json_object_t(v_json).get_date(''fecha'');',
'exception',
'    when others then         ',
'        return null;',
'end;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4440288275236606)
,p_computation_sequence=>20
,p_computation_item=>'P6_FCHA_VNCMNTO_OBLGCION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select min(fcha_vncmnto)',
'   from table (pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto (p_cdgo_clnte 			            => :F_CDGO_CLNTE,',
'                                                                     p_id_impsto                        => :P4_ID_IMPSTO,',
'                                                                     p_id_impsto_sbmpsto                => :P4_ID_IMPSTO_SBMPSTO,',
'                                                                     p_id_sjto_impsto                   => :P4_ID_SJTO_IMPSTO,',
'                                                                     p_fcha_vncmnto                     => :P6_FCHA) )a',
'   join json_table(:P4_VGNCIA_PRDO,   ''$.VGNCIA_PRDO[*]'' ',
'									  columns(vgncia    number path   ''$.vgncia'',',
'											  prdo      number path   ''$.prdo'',',
'											  id_orgen  varchar path  ''$.id_orgen'')) b on   b.vgncia = a.vgncia ',
'                                                                                        and b.prdo = a.prdo',
'                                                                                        and b.id_orgen = a.id_orgen;',
'                                                                                        ',
'    '))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4440354200236607)
,p_computation_sequence=>30
,p_computation_item=>'P6_FCHA_LMTE_CLNDRIO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_re_documentos.fnc_vl_fcha_mxma_tsas_mra (:F_CDGO_CLNTE, :P4_ID_IMPSTO, to_date(:P6_FCHA,''DD/MM/YY''), to_date(:P6_FCHA_VNCMNTO_OBLGCION,''DD/MM/YY'')) fcha_vlda',
'from dual;',
'     ',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(54980562925127745)
,p_name=>unistr('al hacer clic en el bot\00F3n imprimir')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(54980416907127744)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(54980601812127746)
,p_event_id=>wwv_flow_api.id(54980562925127745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'validarRecibo();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(55481897655138612)
,p_name=>'al cambiar la fecha'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_FCHA,P6_CDGO_RCBO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(55481996034138613)
,p_event_id=>wwv_flow_api.id(55481897655138612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'consultarDeudaProyectada();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4366718141171705)
,p_name=>'al cambiar tipo de recibo'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_CDGO_RCBO_TPO'
,p_condition_element=>'P6_CDGO_RCBO_TPO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'DNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4366853462171706)
,p_event_id=>wwv_flow_api.id(4366718141171705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_VLOR_ABNO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4366920697171707)
,p_event_id=>wwv_flow_api.id(4366718141171705)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P6_VLOR_ABNO'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(23613986241126819)
,p_name=>unistr('al hacer clic en el bot\00F3n pse')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(23613069401126810)
,p_condition_element=>'P6_ID_IMPSTO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'230011'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5960440592977001)
,p_event_id=>wwv_flow_api.id(23613986241126819)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.open("https://www.avalpaycenter.com/wps/portal/portal-de-pagos/web/pagos-aval/resultado-busqueda/realizar-pago/!ut/p/a1/lZBPU4MwEMW_ih48OZINBQpHgrUgtlSFKlycFGKNAkEK6PjpDe34t1rHnDa77-37JShB1ygpaceXtOGipHl_T4wb09INTwPVN-caAduLrJMz18UwASmIpQB-OTZ'
||'89Qfa-XHvd8lYJwMI3vzvgnG4DvAvVZf4GBxtp99Rt_yaZUhBMHHm8wgD_Ne_DfiH_wolXyU_vOCbYBtxLdjxh7GEHH6OsEZyA7G8aTjAYA7RZb_jnnb0WVmxustZo_AyzduMKRVt7m54eStQfACkXaU0E_WslmNe0fyEpmw15-xJeb5rirxfk4pC4YtCue1HSiXqpl9XiIyhuJNKFLsoOSxj40yW3kd5-lHuxA2MDW4qMr4UDm8zmqEY1'
||'i3asKVkfGxZRt97RSXeekQmOvbeJJiGowvP_p4E_tCWSTo5dclU_txwC8UHC-xQKka-rY51vEGpH1suGbCBVcuwVA10rG0Qy46VXHg9IADG5kBDVRFF0TXwWVGYg4eLI7p4YQvzPmSxvf8KuUOm4A!!/#Z7_8956I402K0K7A0AI5BJHBN00A7", "_blank")'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(23614002228126820)
,p_event_id=>wwv_flow_api.id(23613986241126819)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.open("https://www.avalpaycenter.com/wps/portal/portal-de-pagos/web/pagos-aval/resultado-busqueda/realizar-pago?idConv=00013663&origen=buscar", "_blank")'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54980054350127740)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DeudaProyectada'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    --v_prmtros       varchar2(2000) := :F_CDGO_CLNTE ||''&''|| :P4_ID_IMPSTO ||''&''|| :P4_ID_IMPSTO_SBMPSTO || ''&''|| :P4_ID_SJTO_IMPSTO || ''&'' || :P6_FCHA || ''&'' || :P4_VGNCIA_PRDO;',
'    v_json_t        json_object_t;',
'    v_json          clob;',
'    v_sql           clob; ',
'    v_array_t       json_array_t;',
'    v_keys          json_key_list;',
'    v_body          json_object_t := json_object_t();',
'    v_id_temp_json_rcbo_prtal number;',
'    ',
'begin',
'    v_body.put(''cliente'', :F_CDGO_CLNTE);',
'    v_body.put(''impuesto'', :P4_ID_IMPSTO);',
'    v_body.put(''subimpuesto'', :P4_ID_IMPSTO_SBMPSTO);',
'    v_body.put(''idsujeto'', :P4_ID_SJTO_IMPSTO);',
'    v_body.put(''fecha'', :P6_FCHA);',
'    v_body.put(''vigencias'', :P4_VGNCIA_PRDO);',
'    v_body.put(''abono'', :P6_VLOR_ABNO);',
'    v_body.put(''tipo'', :P6_CDGO_RCBO_TPO);',
'    ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    --apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'    v_json := apex_web_service.make_rest_request( p_url          => :F_DRCCION_SRVDOR_PRVDO || ''recibo/deudaProyectada''',
'                                                , p_http_method  => ''POST''',
'                                                , p_body         => v_body.stringify ); ',
'                                                /*, p_parm_name    => apex_string.string_to_table(''cliente&impuesto&subimpuesto&idsujeto&fecha&vigencias'',''&'')',
'                                                , p_parm_value   => apex_string.string_to_table(v_prmtros,''&''));*/ ',
'    ',
'    v_sql     := ''select * from json_table(''''''||v_json|| '''''' , ''''$[*]'''' columns('';',
'    v_array_t := json_array_t(v_json);',
'    ',
'    -- 08/02/2024',
'    -- Se inserta en la tabla create global temporary ',
'    -- ya que al seleccionar varias vigencias, la coleccion PROYECTADA',
unistr('    -- No carga todas las vigencias, solo carga 17 registros por el tam\00F1a\00F1o'),
'    -- del la sentencia v_sql que generaba',
'    insert into temp_json_rcbo_prtal (json) ',
'    values (v_json) ',
'    returning id_temp_json_rcbo_prtal into v_id_temp_json_rcbo_prtal;',
'	',
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
'    -- Se crea la sentencia para enviarsela a la coleccion',
'    v_sql := ''',
'select b.*  ',
'from temp_json_rcbo_prtal a,',
'json_table(',
'        a.json, ''''$[*]'''' ',
'        columns("CDGO_MVMNTO_ORGN" path ''''$."CDGO_MVMNTO_ORGN"'''',"ID_ORGEN" path ''''$."ID_ORGEN"'''',"VGNCIA" path ''''$."VGNCIA"'''',"PRDO" path ''''$."PRDO"'''',"DSCRPCION_MVNT_FNCRO_ESTDO" path ''''$."DSCRPCION_MVNT_FNCRO_ESTDO"'''',"VLOR_SLDO_CPTAL" path ''''$."V'
||'LOR_SLDO_CPTAL"'''',"VLOR_INTRES" path ''''$."VLOR_INTRES"'''',"VLOR_DSCNTO" path ''''$."VLOR_DSCNTO"'''',"VLOR_TTAL" path ''''$."VLOR_TTAL"'''',"VLOR_INTRES_BANCARIO" path ''''$."VLOR_INTRES_BANCARIO"'''')',
'        ) b',
'where a.id_temp_json_rcbo_prtal =  ''|| v_id_temp_json_rcbo_prtal ||  '''';',
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
end;
/
