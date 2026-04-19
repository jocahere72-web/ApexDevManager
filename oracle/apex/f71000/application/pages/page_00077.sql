prompt --application/pages/page_00077
begin
wwv_flow_api.create_page(
 p_id=>77
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Generaci\00F3n Solicitud Convenio - Cartera')
,p_step_title=>unistr('Generaci\00F3n Solicitud Convenio - Cartera')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}',
'',
'function VigenciasSeleccionadas() {',
'        var i, records, record, sal, model,',
'            vgncia_prdo = '''',',
'            num_vigencias_seleccionadas = 0,',
'            view = apex.region("deuda").widget().interactiveGrid("getCurrentView");',
'            model = view.model;',
'            records = view.getSelectedRecords();',
'            if ( records.length > 0 ) {',
'             ',
'                for ( i = 0; i < records.length; i++ ) {',
'                    record = records[i];',
'                    num_vigencias_seleccionadas = num_vigencias_seleccionadas + 1; ',
'                    vgncia_prdo = vgncia_prdo + '':'' + parseFloat(model.getValue(record, "VGNCIA")) + '',''+ parseFloat(model.getValue(record, "PRDO"));',
'               }',
'            } ',
'            ',
'             $s("P43_NMRO_VGNCIA_SLCCNDA", num_vigencias_seleccionadas);',
'             $s("P43_VGNCIA_PRDO", vgncia_prdo);',
'             $s("P43_VGNCIA_PRDO_CNCPTO", vgncia_prdo);',
'}',
'',
' '))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20190128095930'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117046677235967430)
,p_plug_name=>'Cartera'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(73655524996021574)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(117046777052967430)
,p_plug_name=>'Cartera'
,p_region_name=>'deuda'
,p_parent_plug_id=>wwv_flow_api.id(117046677235967430)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.vgncia,',
'        a.prdo,',
'        a.vlor_sldo_cptal,',
'        a.vlor_intres,',
'        a.vlor_sldo_cptal + a.vlor_intres vlor_ttal',
'   from v_gf_g_cartera_x_vigencia a',
'   join gf_g_movimientos_financiero b on b.id_sjto_impsto = a.id_sjto_impsto',
'  where b.cdgo_mvnt_fncro_estdo <> ''CN'' ',
'    and a.id_sjto_impsto = :P41_ID_SJTO_IMPSTO',
'    and a.id_impsto = :P41_ID_IMPSTO',
'    and a.id_impsto_sbmpsto = :P41_ID_IMPSTO_SBMPSTO;',
'    ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(115941696477016540)
,p_name=>'VLOR_TTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Total'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(115941859100016541)
,p_name=>'Selector'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(116924596146193265)
,p_name=>'VGNCIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VGNCIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vigencia'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
 p_id=>wwv_flow_api.id(116924703586193266)
,p_name=>'PRDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Periodo'
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
 p_id=>wwv_flow_api.id(116924866760193267)
,p_name=>'VLOR_SLDO_CPTAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_SLDO_CPTAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Saldo Capital'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(116924952428193268)
,p_name=>'VLOR_INTRES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_INTRES'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Interes'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(116924481786193264)
,p_internal_uid=>116924481786193264
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
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
 p_id=>wwv_flow_api.id(117513203308683891)
,p_interactive_grid_id=>wwv_flow_api.id(116924481786193264)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(117513349028683892)
,p_report_id=>wwv_flow_api.id(117513203308683891)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117513779638683894)
,p_view_id=>wwv_flow_api.id(117513349028683892)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(116924596146193265)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117514377312683897)
,p_view_id=>wwv_flow_api.id(117513349028683892)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(116924703586193266)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117514868430683899)
,p_view_id=>wwv_flow_api.id(117513349028683892)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(116924866760193267)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117515299046683900)
,p_view_id=>wwv_flow_api.id(117513349028683892)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(116924952428193268)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(117862685458232826)
,p_view_id=>wwv_flow_api.id(117513349028683892)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(115941696477016540)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(197686604742714325)
,p_plug_name=>'<b>DATOS DEL CONVENIO</b>'
,p_parent_plug_id=>wwv_flow_api.id(117046677235967430)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(118269776072281924)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
unistr('    <p align="justify"> Funcionalidad de Proyecci\00F3n de pagos.<br> '),
'        <b> <center> Paso 2 Seleccionar Cartera </center> </b> <br>',
'        Se muestran las vigencias con saldo y adaptas para ser parte de un convenio. <br> <br>',
unistr('        De acuerdo al tipo de convenio seleccionado, se deber\00E1n seleccionar todas las vigencias o solo algunas.<br>   '),
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73597398642901146)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(117046677235967430)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP,41,43,53,44,72::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73598180909901147)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(117046677235967430)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(73597720457901147)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(117046677235967430)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(73605333569901211)
,p_branch_name=>'Go To Page 70 - Garantia'
,p_branch_action=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73598180909901147)
,p_branch_sequence=>20
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(73605771803901211)
,p_branch_name=>unistr('Go To Page 52 - Informaci\00F3n B\00E1sica')
,p_branch_action=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(73597720457901147)
,p_branch_sequence=>30
,p_branch_condition_type=>'NOT_EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select id_cnvnio_tpo ',
'  from gf_d_convenios_tipo a ',
' where a.id_cnvnio_tpo = :P41_ID_CNVNIO_TPO ',
'   and a.indcdor_exge_cta_incial= ''S'''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73601765041901182)
,p_name=>'P77_NMRO_VGNCIA_SLCCNDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(117046777052967430)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73602194609901186)
,p_name=>'P77_VGNCIA_PRDO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(117046777052967430)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73606755578911101)
,p_name=>'P77_VLOR_CTA_INCIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(197686604742714325)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor de la Cuota Inicial'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_source=>'P53_VLOR_CTA_INCIAL'
,p_source_type=>'ITEM'
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
 p_id=>wwv_flow_api.id(73607158090911103)
,p_name=>'P77_FCHA_PGO_CTA_INCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(197686604742714325)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr(' Fecha L\00EDmite Pago ')
,p_source=>'P53_FCHA_PGO_CTA_INCIAL'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73607533621911103)
,p_name=>'P77_FCHA_PRMRA_CTA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(197686604742714325)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Primera Cuota'
,p_source=>'P44_FCHA_PRMRA_CTA'
,p_source_type=>'ITEM'
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
 p_id=>wwv_flow_api.id(73607998672911103)
,p_name=>'P77_NMRO_CTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(197686604742714325)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Cuotas')
,p_source=>'P44_NMRO_CTAS'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73608397773911103)
,p_name=>'P77_CDGO_PRDCDAD'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(197686604742714325)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Periodicidad'
,p_source=>'P44_PRDCDAD_CTA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_PERIODICIDAD'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_prdcdad as r',
'  from df_s_periodicidad',
' order by cntdad_vce_anio desc'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(73603602015901200)
,p_validation_name=>unistr('Selecci\00F3n una o mas Vigencias-Periodo')
,p_validation_sequence=>10
,p_validation=>'P77_NMRO_VGNCIA_SLCCNDA'
,p_validation_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_error_message=>unistr('Debe seleccionar una o m\00E1s Vigencias para poder continuar')
,p_when_button_pressed=>wwv_flow_api.id(73598180909901147)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(73603979860901206)
,p_name=>'Al seleccionar Contar las Vigencias Seleccionadas'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(117046777052967430)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(73604428311901207)
,p_event_id=>wwv_flow_api.id(73603979860901206)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'VigenciasSeleccionadas();'
,p_stop_execution_on_error=>'Y'
);
end;
/
