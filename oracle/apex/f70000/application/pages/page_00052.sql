prompt --application/pages/page_00052
begin
wwv_flow_api.create_page(
 p_id=>52
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Revisi\00F3n T\00EDtulos Ejcutivos')
,p_step_title=>unistr('Revisi\00F3n T\00EDtulos Ejcutivos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191206083151'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(14997029793694101)
,p_plug_name=>'flow'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(34912918278576097)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83721613481026494)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'Funcionalidad que permite: <br><br>',
unistr('Visualizar la informaci\00F3n del T\00EDtulo Ejecutivo.<br><br>'),
unistr('Aprobar el T\00EDtulo Ejecutivo.<br><br>'),
unistr('Rechazar el T\00EDtulo Ejecutivo.<br><br>'),
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104848615658595364)
,p_plug_name=>'TAB-CONTAINER'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(164084128065707698)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104966309151459156)
,p_plug_name=>unistr('T\00EDtulo Ejecutivo')
,p_parent_plug_id=>wwv_flow_api.id(104848615658595364)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104964455116459137)
,p_plug_name=>'Conceptos'
,p_region_name=>'titulosEjecutivos'
,p_parent_plug_id=>wwv_flow_api.id(104966309151459156)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'onkeypress="return soloNumero(event)"'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion,',
'       a.vgncia,',
'       c.prdo,',
'       d.vlor_cptal,',
'       d.vlor_intres',
'from df_i_impuestos_acto_concepto    a',
'join df_i_conceptos                  b on a.id_cncpto             = b.id_cncpto',
'join df_i_periodos                   c on a.id_prdo               = c.id_prdo',
'join gi_g_titulos_ejctvo_cncpto      d on a.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'join gi_g_titulos_ejecutivo          e on d.id_ttlo_ejctvo        = e.id_ttlo_ejctvo    ',
'where e.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(90817240652364777)
,p_name=>'VLOR_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Capital'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
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
 p_id=>wwv_flow_api.id(104964901456459141)
,p_name=>'DSCRPCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(104965844301459151)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
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
 p_id=>wwv_flow_api.id(104965997595459152)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Per\00EDodo')
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
 p_id=>wwv_flow_api.id(109550023622327434)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Valor Inter\00E9s')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_item_attributes=>'onkeypress="return  validarExpresion(event, ''numeroEntero'')"  onkeyup="formatNumber(event,{decimal:'','',thousand:''.'',precision:0});"'
,p_is_required=>true
,p_max_length=>15
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
 p_id=>wwv_flow_api.id(104964546409459138)
,p_internal_uid=>104964546409459138
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
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
 p_id=>wwv_flow_api.id(104974864737549017)
,p_interactive_grid_id=>wwv_flow_api.id(104964546409459138)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(104974984921549017)
,p_report_id=>wwv_flow_api.id(104974864737549017)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(90823612301368569)
,p_view_id=>wwv_flow_api.id(104974984921549017)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(90817240652364777)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104976834265549022)
,p_view_id=>wwv_flow_api.id(104974984921549017)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(104964901456459141)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>307
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104990663251800399)
,p_view_id=>wwv_flow_api.id(104974984921549017)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(104965844301459151)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(104991253098800401)
,p_view_id=>wwv_flow_api.id(104974984921549017)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(104965997595459152)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(109556186307348963)
,p_view_id=>wwv_flow_api.id(104974984921549017)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(109550023622327434)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109003933397985760)
,p_plug_name=>'Nuevo'
,p_parent_plug_id=>wwv_flow_api.id(104966309151459156)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(pkg_gi_titulos_ejecutivo.fnc_gn_region_metadatos(p_cdgo_clnte => :F_CDGO_CLNTE,',
'                                                        p_id_impsto => :P52_IMPUESTO,',
'                                                        p_id_impsto_sbmpsto => :P52_SUB_IMPUESTO,',
'                                                        p_id_orgen => :P52_ID_TTLO_EJCTVO,',
'                                                        p_dsbled   => ''S''));'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110919541335225233)
,p_plug_name=>'Sujeto Impuesto'
,p_parent_plug_id=>wwv_flow_api.id(104848615658595364)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(104581710555161973)
,p_plug_name=>'Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(110919541335225233)
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(164079332454707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(110004296201198833)
,p_plug_name=>'Plugin Sujeto Tributo'
,p_parent_plug_id=>wwv_flow_api.id(110919541335225233)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P52_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15052928556336219)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(34912918278576097)
,p_button_name=>'BTN_RGRSR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15066814881372601)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(34912918278576097)
,p_button_name=>'BTN_APRBAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aprobar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de aprobar el TÃ­tulo Ejecutivo?'',''BTN_APRBAR'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    wf_g_instancias_transicion  a',
'where   a.id_instncia_fljo      =   :F_ID_INSTNCIA_FLJO',
'and     a.id_fljo_trea_orgen    =   :F_ID_FLJO_TREA',
'and     a.id_estdo_trnscion     in  (1, 2);'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(15066965098372602)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(34912918278576097)
,p_button_name=>'BTN_RCHZAR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Rechazar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de rechazar el TÃ­tulo Ejecutivo?'',''BTN_RCHZAR'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    wf_g_instancias_transicion  a',
'where   a.id_instncia_fljo      =   :F_ID_INSTNCIA_FLJO',
'and     a.id_fljo_trea_orgen    =   :F_ID_FLJO_TREA',
'and     a.id_estdo_trnscion     in  (1, 2);'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45435172663830018)
,p_name=>'P52_ACTOS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_prompt=>'Acto'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_impsto_acto as d,',
'        a.id_impsto_acto as r',
'from df_i_impuestos_acto a',
'where a.id_impsto_sbmpsto = :P52_SUB_IMPUESTO',
'and a.actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_cSize=>100
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45435533551830031)
,p_name=>'P52_SECRETARIA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_prompt=>'Origen'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_area as d,',
'       a.id_area    as r',
'from df_c_areas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45435938877830032)
,p_name=>'P52_NMRO_TTLO_EJCTVO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_prompt=>unistr('# T\00EDtulo Ejecutivo')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45436351133830032)
,p_name=>'P52_FCHA_TTLO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_item_default=>'nvl(:P52_FCHA_TTLO,sysdate)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha T\00EDtulo Ejecutivo')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45436735064830033)
,p_name=>'P52_FCHA_NTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_item_default=>'nvl(:P52_FCHA_NTFCCION,SYSDATE)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>unistr('Fecha Notificaci\00F3n')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P52_FCHA_TTLO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45437147229830033)
,p_name=>'P52_FCHA_VNCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_item_default=>'nvl(:P52_FCHA_VNCMNTO,SYSDATE)'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Vencimiento'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P52_FCHA_TTLO.'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-04:+00'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45437554416830033)
,p_name=>'P52_N_GUIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_prompt=>unistr('No. Gu\00EDa')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45437967164830033)
,p_name=>'P52_MDIO_NTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_prompt=>unistr('Medio Notificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.dscrpcion as d,',
'       m.id_mdio as r',
'from nt_d_medio m;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45438258575830050)
,p_name=>'P52_FILE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_07=>'&P52_FILE_NAME.'
,p_attribute_08=>'attachment'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45438688228830050)
,p_name=>'P52_OBSRVCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_prompt=>unistr('Observaci\00F3n')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45439011436830050)
,p_name=>'P52_FILE_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_use_cache_before_default=>'NO'
,p_source=>'FILE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45439400153830050)
,p_name=>'P52_ID_DCMNTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45439847760830051)
,p_name=>'P52_IMPUESTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45440296350830051)
,p_name=>'P52_SUB_IMPUESTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45440670370830051)
,p_name=>'P52_ID_TTLO_EJCTVO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(104966309151459156)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(45444851887830100)
,p_name=>'P52_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(104581710555161973)
,p_prompt=>'Id Sjto Impsto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19273350833475201)
,p_name=>'Nuevo'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(15066965098372602)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19273408674475202)
,p_event_id=>wwv_flow_api.id(19273350833475201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(19273522700475203)
,p_name=>'Nuevo_1'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(15066814881372601)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(19273650869475204)
,p_event_id=>wwv_flow_api.id(19273522700475203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'window.localStorage.clear();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39785692693960401)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Cargar Archivo'
,p_attribute_02=>'GD_G_DOCUMENTOS'
,p_attribute_03=>'P52_ID_DCMNTO'
,p_attribute_04=>'ID_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45446106560834748)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Cargar Informaci\00F3n T\00EDtulo Ejecutivo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'    begin',
'        select a.nmro_ttlo_ejctvo,',
'               a.id_area,',
'               b.id_impsto,',
'               b.id_impsto_sbmpsto,',
'               a.id_impsto_acto,',
'               a.fcha_cnsttcion,',
'               a.fcha_ntfccion,',
'               a.fcha_vncmnto,',
'               a.nmro_guia,',
'               a.mdio_ntfccion,',
'               a.id_dcmnto,',
'               a.obsrvcion,',
'               a.id_sjto_impsto,',
'               a.id_ttlo_ejctvo',
'        into   :P52_NMRO_TTLO_EJCTVO,',
'               :P52_SECRETARIA,',
'               :P52_IMPUESTO,',
'               :P52_SUB_IMPUESTO,',
'               :P52_ACTOS,',
'               :P52_FCHA_TTLO,',
'               :P52_FCHA_NTFCCION,',
'               :P52_FCHA_VNCMNTO,',
'               :P52_N_GUIA,',
'               :P52_MDIO_NTFCCION,',
'               :P52_ID_DCMNTO,',
'               :P52_OBSRVCION,',
'               :P52_ID_SJTO_IMPSTO,',
'               :P52_ID_TTLO_EJCTVO',
'        from gi_g_titulos_ejecutivo a ',
'        join df_i_impuestos_acto    b on a.id_impsto_acto = b.id_impsto_acto',
'        join v_si_i_sujetos_impuesto c on a.id_sjto_impsto = c.id_sjto_impsto',
'        where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO;',
'        ',
'    exception',
'        when no_data_found then',
'               :P52_NMRO_TTLO_EJCTVO := null;',
'               :P52_SECRETARIA := null;',
'               :P52_IMPUESTO := null;',
'               :P52_SUB_IMPUESTO := null;',
'               :P52_ACTOS := null;',
'               :P52_FCHA_TTLO := null;',
'               :P52_FCHA_NTFCCION := null;',
'               :P52_FCHA_VNCMNTO := null;',
'               :P52_N_GUIA := null;',
'               :P52_MDIO_NTFCCION := null;',
'               :P52_ID_DCMNTO := null;',
'               :P52_OBSRVCION := null;',
'    end;',
'',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15739623999375801)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'',
'begin',
'    update gi_g_titulos_ejecutivo a',
'    set a.id_usrio_aprbo = :F_ID_USRIO',
'    where a.id_ttlo_ejctvo = :P52_ID_TTLO_EJCTVO;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(15066814881372601)
,p_process_success_message=>unistr('Operaci\00F3n realizada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19589546512000002)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rechazar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'',
'begin',
'    update gi_g_titulos_ejecutivo a',
'    set a.id_usrio_aprbo = null',
'    where a.id_ttlo_ejctvo = :P52_TTLO_EJCTVO;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(15066965098372602)
,p_process_success_message=>unistr('Operaci\00F3n realizada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(19203006325760501)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Siguiente'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
