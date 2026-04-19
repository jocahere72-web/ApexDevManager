prompt --application/pages/page_00179
begin
wwv_flow_api.create_page(
 p_id=>179
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Proyecci\00F3n de Sanci\00F3n VUR')
,p_step_title=>unistr('Proyecci\00F3n de Sanci\00F3n VUR')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var sel = [];',
'',
'',
'function seleccionar_liquidacion(this_) {',
'',
'    if (this_.data.selectedRecords.length === 0) {',
'        return;',
'    };',
'',
'    var i, records, record, model, no_pgdas, id_rnta, ',
'        view = apex.region("luquidaciones_anteriores").widget().interactiveGrid("getCurrentView");',
'    model = view.model;',
'    records = view.getSelectedRecords();',
'',
'    records = records.filter(function (record) {',
'        return model.getValue(record, "CNTDAD_RNTAS_NO_PGDAS")',
'    });',
'     ',
'    if (records.length > 0) {',
'        for (i = 0; i < records.length; i++) {',
'',
'            record = records[i];',
'            id_rnta = parseFloat(model.getValue(record, "ID_RNTA"));',
'            no_pgdas = model.getValue(record, "CNTDAD_RNTAS_NO_PGDAS")',
'            ',
'        }',
'    }',
'',
'    if (no_pgdas > 0) {',
'        Swal.fire({',
'            icon: ''error'',',
'            title:  ''<H2 >RENTAS VARIAS</H2>'',',
unistr('            html: ''<H4>No es posible seleccionar esta liquidaci\00F3n, existen liquidaciones adicionales pendientes por pagar.</H4>'''),
'        });',
'       apex.region("luquidaciones_anteriores").widget().interactiveGrid("setSelectedRecords", []);',
'    } else {',
'        apex.region("luquidaciones_anteriores").widget().interactiveGrid("setSelectedRecords", records);',
'    }',
'        ',
'    ',
'}',
'',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if($v(''P138_INDCDOR_LQDCCION_ADCNAL'') === ''S''){',
'    apex.region("luquidaciones_anteriores").widget().interactiveGrid("setSelectedRecords", []);',
'}',
'ocultarAyudaD();',
'',
'/*',
'var vgncia_prdo = [];',
'    ',
'    // trae el valor del json',
'    if($v(''P141_ID_RNTA_ANTRIOR'')){',
'        try{',
'            // convierte en tipo json',
'            vgncia_prdo = JSON.parse($v(''P141_ID_RNTA_ANTRIOR''));                    ',
'        }catch(e){',
'            vgncia_prdo = [];',
'        }',
'    }   ',
'*/',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20201202095055'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(174711013430326447)
,p_plug_name=>unistr('Proyecci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98291212359719704)
,p_plug_name=>'<b>Conceptos</b>'
,p_parent_plug_id=>wwv_flow_api.id(174711013430326447)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_cncpto || '' - '' || a.dscrpcion  dscrpcion_cncpto',
'    , a.bse_grvble',
'    , a.dias_mra',
'    , a.vlor_lqddo',
' from dual, table (pkg_gi_rentas.fnc_cl_select_cncpto_sncion( p_cdgo_clnte             => :F_CDGO_CLNTE',
'                                                        , p_id_impsto            => :P178_ID_IMPSTO',
'                                                        , p_id_impsto_sbmpsto    => :P178_ID_IMPSTO_SBMPSTO',
'                                                        , p_vgncia               => :P178_VGNCIA_ACTUAL  ',
'                                                        , p_id_prdo              => :P178_PRDO_ACTUAL',
'                                                        , p_id_cncpto            => :P179_ID_CNCPTO										  ',
'                                                        , p_vlor_bse           	 => :P179_VLOR_BSE_GRVBLE',
'                                                        , p_fcha_incio_vncmnto   => :P179_FCHA_EXPDCION',
'                                                        , p_fcha_vncmnto         => :P179_FCHA_VNCMNTO ) ) a',
' where a.cdgo_clnte    = :F_CDGO_CLNTE',
'   and a.id_cncpto     = :P179_ID_CNCPTO   ',
'   and abs(a.vlor_lqddo)   > 0                                                   ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(98291401184719706)
,p_name=>'DSCRPCION_CNCPTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNCPTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Concepto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>106
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
 p_id=>wwv_flow_api.id(98291559999719707)
,p_name=>'BSE_GRVBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BSE_GRVBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Base Gravable'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(98291825239719710)
,p_name=>'DIAS_MRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DIAS_MRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('D\00EDas Mora')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(98291942175719711)
,p_name=>'VLOR_LQDDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_LQDDO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Liquidado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_api.id(98291327972719705)
,p_internal_uid=>98291327972719705
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
 p_id=>wwv_flow_api.id(98320384095061681)
,p_interactive_grid_id=>wwv_flow_api.id(98291327972719705)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(98320407921061681)
,p_report_id=>wwv_flow_api.id(98320384095061681)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98320939103061686)
,p_view_id=>wwv_flow_api.id(98320407921061681)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(98291401184719706)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98321450204061689)
,p_view_id=>wwv_flow_api.id(98320407921061681)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(98291559999719707)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98325814610079152)
,p_view_id=>wwv_flow_api.id(98320407921061681)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(98291825239719710)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(98328258824155652)
,p_view_id=>wwv_flow_api.id(98320407921061681)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(98291942175719711)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177823649527798026)
,p_plug_name=>unistr('Informaci\00F3n Renta')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164070834422707671)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(327285389578114075)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
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
unistr('    <p align="center"><b>Liquidaci\00F3n de Rentas Varias.</b> <br> <br> '),
unistr('      Proyecci\00F3n<br><br>  </p>'),
unistr('      <p align="justify">En este paso se debe ingresar el valor de la base gravable en el caso que se requiera, la fecha de suscripci\00F3n o expedici\00F3n y la fecha de vencimiento. <br><br>'),
unistr('      Luego de ingresar la informaci\00F3n anterior en la regi\00F3n inferior se muestra la proyecci\00F3n de la liquidaci\00F3n.</p>'),
'    ',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98181322984122053)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(98291212359719704)
,p_button_name=>'BTN_GENERAR_SANCION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>unistr('Registrar Sanci\00F3n')
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de registrar su solicitud liquidaciÃ³n?'',''BTN_GENERAR_SANCION'');'
,p_button_condition=>'P179_ID_RNTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98293166355719723)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(98291212359719704)
,p_button_name=>'BTN_IMPRIMIR_RECIBO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Imprimir Recibo'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_condition=>':P179_ID_RNTA is not null'
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(98171303057121985)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(177823649527798026)
,p_button_name=>'PREVIUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:178:&SESSION.::&DEBUG.:RP,179::'
,p_button_condition=>'P179_ID_RNTA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(98293226072719724)
,p_branch_name=>'Imprimir Documento'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_NMBRE_RPRTE,P2_PRMTRO_1,P2_PRMTRO_2:&P179_ID_RPRTE.,Sancion_&P179_NMRO_RNTA.,&P179_ID_RNTA.,&F_ID_DCMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(98293166355719723)
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P179_ID_RNTA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96760206549114850)
,p_name=>'P179_ID_IMPSTO_ACTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98172017364121988)
,p_name=>'P179_VLOR_BSE_GRVBLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(174711013430326447)
,p_format_mask=>'&F_FRMTO_MNDA.'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('Consiste en la base o monto para hallar el valor liquidado de la sanci\00F3n.')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98172981893122010)
,p_name=>'P179_FCHA_EXPDCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(174711013430326447)
,p_prompt=>'Fecha Vencimiento Impuesto Registro'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Fecha de Vencido el Impuesto de Registro.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98174258461122011)
,p_name=>'P179_FCHA_VNCMNTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(174711013430326447)
,p_prompt=>'Fecha de Pago'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>'P179_ID_RNTA'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione la fecha de vencimiento para el pago de la liquidaci\00F3n del hecho generador.')
,p_attribute_02=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98290937593719701)
,p_name=>'P179_ID_IMPSTO_ACTO_PDRE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98291136320719703)
,p_name=>'P179_ID_CNCPTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98292945604719721)
,p_name=>'P179_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98293001354719722)
,p_name=>'P179_ID_RNTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98293476587719726)
,p_name=>'P179_ID_RPRTE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98293536818719727)
,p_name=>'P179_NMRO_DCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98293695513719728)
,p_name=>'P179_NMRO_RNTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_prompt=>unistr('N\00B0 Liquidaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P179_NMRO_RNTA'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98293836244719730)
,p_name=>'P179_CNCPTOS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98293905019719731)
,p_name=>'P179_ID_IMPSTO_ACTO_CNCPTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(177823649527798026)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98294118093719733)
,p_name=>'P179_BSE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(174711013430326447)
,p_prompt=>'Valor Impuesto Registro'
,p_format_mask=>'999G999G999G999G990D00'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Consiste en la base o monto para hallar el valor liquidado de la sanci\00F3n.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98190295805122094)
,p_validation_name=>'Valor de Base no nula'
,p_validation_sequence=>10
,p_validation=>'P179_VLOR_BSE_GRVBLE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe ingresar el Valor del Impuesto Registro'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(98181322984122053)
,p_associated_item=>wwv_flow_api.id(98172017364121988)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98189836248122094)
,p_validation_name=>unistr('Fecha de Expedici\00F3n No nula')
,p_validation_sequence=>20
,p_validation=>'P179_FCHA_EXPDCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar la &P138_LBEL_FCHA.'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(98181322984122053)
,p_associated_item=>wwv_flow_api.id(98172981893122010)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98190675508122102)
,p_validation_name=>'Fecha de Vencimiento no Nula'
,p_validation_sequence=>30
,p_validation=>'P179_FCHA_VNCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar la fecha de vencimiento'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_api.id(98181322984122053)
,p_associated_item=>wwv_flow_api.id(98174258461122011)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98188626670122092)
,p_validation_name=>'Validar que la fecha de vencimiento este en el rango de tasas mora'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' v_fcha_vlda          varchar2(1);',
'begin     ',
'    ',
'    begin',
'        v_fcha_vlda := pkg_gn_generalidades.fnc_vl_fcha_vncmnto_tsas_mra (:F_CDGO_CLNTE, :P178_ID_IMPSTO, to_date(:P179_FCHA_VNCMNTO));',
'        if v_fcha_vlda = ''S''  then',
'            return true;',
'        else ',
'            return false;',
'        end if;       ',
'    exception',
unistr('        when no_data_found then -- no genera inter\00E9s mora. NLCZ'),
'            return true;             ',
'        when others then ',
'            raise_application_error(-20001, sqlerrm);',
'            return false;',
'    end;',
'    ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Debe seleccionar una fecha valida para poder continuar. Se debe revisar que la fecha de vencimiento se encuentre en un rango de tasa mora parametrizado'
,p_validation_condition=>'P179_FCHA_VNCMNTO'
,p_validation_condition_type=>'ITEM_IS_NOT_NULL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(98189081448122093)
,p_validation_name=>unistr('Validar que la proyecci\00F3n se valida')
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_cncpto || '' - '' || a.dscrpcion  dscrpcion_cncpto',
'    , a.bse_grvble',
'    , a.dias_mra',
'    , a.vlor_lqddo',
' from dual, table (pkg_gi_rentas.fnc_cl_select_cncpto_sncion( p_cdgo_clnte             => :F_CDGO_CLNTE',
'                                                        , p_id_impsto            => :P178_ID_IMPSTO',
'                                                        , p_id_impsto_sbmpsto    => :P178_ID_IMPSTO_SBMPSTO',
'                                                        , p_vgncia               => :P178_VGNCIA_ACTUAL  ',
'                                                        , p_id_prdo              => :P178_PRDO_ACTUAL',
'                                                        , p_id_cncpto            => :P179_ID_CNCPTO										  ',
'                                                        , p_vlor_bse           	 => :P179_VLOR_BSE_GRVBLE',
'                                                        , p_fcha_incio_vncmnto   => :P179_FCHA_EXPDCION',
'                                                        , p_fcha_vncmnto         => :P179_FCHA_VNCMNTO ) ) a',
' where a.cdgo_clnte    = :F_CDGO_CLNTE',
'   and a.id_cncpto     = :P179_ID_CNCPTO   ',
'   and abs(a.vlor_lqddo)   > 0'))
,p_validation_type=>'EXISTS'
,p_error_message=>unistr('Proyecci\00F3n no valida')
,p_when_button_pressed=>wwv_flow_api.id(98181322984122053)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(98292401858719716)
,p_name=>'Actualizar'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P179_FCHA_VNCMNTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(98292585660719717)
,p_event_id=>wwv_flow_api.id(98292401858719716)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98292683604719718)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar sanci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_cdgo_rspsta        number;',
'	v_mnsje_rspsta		 varchar2(2000)	:= ''Inicio'';',
'    v_id_sjto_impsto     number;',
'    v_id_rnta            number;',
'    v_nmro_rnta          number;',
'    v_id_dcmnto          number;',
'    v_nmro_dcmnto        number;',
'',
'begin',
'',
'    begin',
'         select json_arrayagg(json_object(  key ''ID_IMPSTO_ACTO_CNCPTO'' is :P179_ID_IMPSTO_ACTO_CNCPTO',
'                                           ,key ''ID_IMPSTO_ACTO''        is :P179_ID_IMPSTO_ACTO',
'                                           ,key ''FCHA_VNCMNTO''          is :P179_FCHA_VNCMNTO',
'                                           ,key ''DIAS_MRA''              is nvl(a.dias_mra,''0'')',
'                                           ,key ''BSE_CNCPTO''            is a.bse_grvble',
'                                           ,key ''VLOR_INDCDOR''          is nvl(a.vlor_indcdor,''0'')',
'                                           ,key ''VLOR_TRFA''             is nvl(a.vlor_trfa,''0'')',
'                                           ,key ''VLOR''                  is nvl(a.vlor,''0'')',
'                                           ,key ''TXTO_TRFA''             is to_char(nvl(a.vlor_trfa,''0''))||''%'' --a.txto_trfa',
'                                           ,key ''VLOR_LQDDO''            is a.vlor_lqddo		',
'                                           ,key ''VLOR_INTRES_MRA''       is 0',
'                                         )',
'                              )cncptos',
'         into :P179_CNCPTOS',
'         from dual, table (pkg_gi_rentas.fnc_cl_select_cncpto_sncion( p_cdgo_clnte           => :F_CDGO_CLNTE',
'                                                                    , p_id_impsto            => :P178_ID_IMPSTO',
'                                                                    , p_id_impsto_sbmpsto    => :P178_ID_IMPSTO_SBMPSTO',
'                                                                    , p_vgncia               => :P178_VGNCIA_ACTUAL  ',
'                                                                    , p_id_prdo              => :P178_PRDO_ACTUAL',
'                                                                    , p_id_cncpto            => :P179_ID_CNCPTO										  ',
'                                                                    , p_vlor_bse           	 => :P179_VLOR_BSE_GRVBLE',
'                                                                    , p_fcha_incio_vncmnto   => :P179_FCHA_EXPDCION',
'                                                                    , p_fcha_vncmnto         => :P179_FCHA_VNCMNTO ) ) a',
'         where a.cdgo_clnte    = :F_CDGO_CLNTE',
'           and a.id_cncpto     = :P179_ID_CNCPTO   ',
'           and abs(a.vlor_lqddo)   > 0;',
'        ',
'    exception',
'      when others then',
'        rollback;',
'        v_mnsje_rspsta    := ''No se encontraron los conceptos'' ;',
'        raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta || '' - '' || sqlerrm);',
'    end;',
'',
'	-- Se registra el sujeto impuesto si no existe para rentas',
'    if :P178_ID_SJTO is not null then ',
'        begin ',
'            pkg_si_novedades_persona.prc_rg_sjto_impsto_sjto_exstnt (p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                                     p_id_sjto           => :P178_ID_SJTO,',
'                                                                     p_id_impsto         => :P178_ID_IMPSTO,',
'                                                                     p_id_usrio          => :F_ID_USRIO,',
'                                                                     o_id_sjto_impsto    => v_id_sjto_impsto,',
'                                                                     o_cdgo_rspsta		 => v_cdgo_rspsta,',
'                                                                     o_mnsje_rspsta		 => v_mnsje_rspsta);',
'             if(v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''2. Error: '' || v_mnsje_rspsta);',
'             end if;',
'            ',
'        exception',
'            when others then ',
'                rollback;',
'		        raise_application_error(-20001, ''3. '' ||v_mnsje_rspsta);',
'        end;',
'    else',
'        v_id_sjto_impsto  := :P178_ID_SJTO_IMPSTO;',
'    end if;',
'    	',
'    if v_id_sjto_impsto is not null then',
'        begin',
'            pkg_gi_rentas.prc_rg_proyeccion_sancion(  p_cdgo_clnte				=> :F_CDGO_CLNTE',
'													, p_id_impsto				=> :P178_ID_IMPSTO',
'													, p_id_impsto_sbmpsto		=> :P178_ID_IMPSTO_SBMPSTO',
'													, p_id_sjto_impsto			=> v_id_sjto_impsto',
'													, p_actos_cncpto			=> :P179_CNCPTOS',
'													, p_fcha_expdcion			=> nvl(:P179_FCHA_EXPDCION, sysdate)',
'													, p_vlor_bse_grvble			=> :P179_VLOR_BSE_GRVBLE --to_number(:P179_VLOR_BSE_GRVBLE, ''999G999G999G999G999G999G990D99'')',
'													, p_fcha_vncmnto_dcmnto		=> nvl(:P179_FCHA_VNCMNTO, sysdate)',
'													, p_entrno					=> ''PRVDO''',
'													, p_id_usrio				=> :F_ID_USRIO ',
'													, p_id_rnta_ascda           => :P178_ID_RNTA_ASCDA ',
'													, o_id_rnta					=> v_id_rnta',
'													, o_nmro_rnta				=> v_nmro_rnta',
'                                                    , o_id_dcmnto               => v_id_dcmnto',
'                                                    , o_nmro_dcmnto             => v_nmro_dcmnto',
'													, o_cdgo_rspsta				=> v_cdgo_rspsta',
'													, o_mnsje_rspsta			=> v_mnsje_rspsta',
'													);',
'            if(v_cdgo_rspsta = 0) then',
'                :P179_ID_RNTA        := v_id_rnta;',
'                :P179_NMRO_RNTA      := v_nmro_rnta;',
'                :F_ID_DCMNTO         := v_id_dcmnto;',
'                :P179_NMRO_DCMNTO    := v_nmro_dcmnto;',
unistr('                :P179_RSPSTA         := ''\00A1Preliquidaci\00F3n Generada Satisfactoriamente!'';'),
'            else',
'                rollback;',
'                :P179_ID_RNTA        := null;',
'                :P179_NMRO_RNTA      := null;',
'                :F_ID_DCMNTO         := null;',
'                :P179_NMRO_DCMNTO    := null;',
'                raise_application_error(-20001, ''4. Error: '' || v_mnsje_rspsta);',
'                    ',
'            end if;',
'        exception',
'            when others then ',
'                rollback;',
'                :P179_ID_RNTA        := null;',
'                :P179_NMRO_RNTA      := null;',
'                :F_ID_DCMNTO         := null;',
'                :P179_NMRO_DCMNTO    := null;',
'                raise_application_error(-20001, ''5. Error: '' ||v_cdgo_rspsta||'':''|| v_mnsje_rspsta || '' - '' || sqlerrm);',
'        end;',
'    else',
'        rollback;',
'        v_mnsje_rspsta    := ''No se registro el sujeto impuesto'' ;',
'        raise_application_error(-20001, ''6. Error: '' || v_mnsje_rspsta || '' - '' || sqlerrm);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(98181322984122053)
,p_process_when=>'BTN_GENERAR_SANCION'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('La sanci\00F3n ha sido registrada con \00C9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98291048099719702)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar Impuesto de Registro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select a.fcha_aprbcion - 60 -- colocar +60',
'          ,b.vlor_lqddo',
'          ,to_char(b.vlor_lqddo, :F_FRMTO_MNDA) ',
'          --, to_char(to_number(b.vlor_lqddo, ''999G999G999G999G999G999G990D99'') , ''999G999G999G999G990'') ',
'          ,b.id_impsto_acto',
'     into :P179_FCHA_EXPDCION',
'        , :P179_VLOR_BSE_GRVBLE',
'        , :P179_BSE',
'        , :P179_ID_IMPSTO_ACTO_PDRE',
'     from gi_g_rentas   a ',
'     join v_gi_g_rentas_acto_concepto b on a.id_rnta = b.id_rnta',
unistr('                                       and b.gnra_intres_mra = ''S\00ED'''),
'     where a.id_rnta = :P178_ID_RNTA_ASCDA ',
'     ;',
'',
'   select id_impsto_acto ',
'     into :P179_ID_IMPSTO_ACTO',
'     from df_i_impuestos_acto ',
'    where id_impsto_acto_pdre = :P179_ID_IMPSTO_ACTO_PDRE;',
'',
'  select id_cncpto,        id_impsto_acto_cncpto',
'    into :P179_ID_CNCPTO, :P179_ID_IMPSTO_ACTO_CNCPTO',
'    from df_i_impuestos_acto_concepto ',
'   where id_impsto_acto = :P179_ID_IMPSTO_ACTO; ',
'   ',
'exception',
'    when others then',
'        :P179_FCHA_EXPDCION          := null;',
'        :P179_VLOR_BSE_GRVBLE        := null;',
'        :P179_BSE                    := null;',
'        :P179_ID_CNCPTO              := null;',
'        :P179_ID_IMPSTO_ACTO_CNCPTO  := null;',
'end; ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(98293331538719725)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta de Reporte de Recibo de Rentas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_rprte',
'      into :P179_ID_RPRTE',
'      from gn_d_reportes   a',
'       join gn_d_reporte_cliente    b on a.id_rprte = b.id_rprte',
'       and cdgo_clnte              = :F_CDGO_CLNTE',
'     where cdgo_rprte_grpo = ''RRV'' ',
'       and a.indcdor_gnrco = ''N'';',
'exception',
'    when no_data_found then ',
'       begin ',
'           select a.id_rprte',
'          into :P179_ID_RPRTE',
'          from gn_d_reportes   a',
'         where cdgo_rprte_grpo = ''RRV'' ',
'           and a.indcdor_gnrco = ''S''',
'           and rownum = 1;',
'       exception ',
'           when others then ',
'               null;',
'       end;',
'    when others then ',
'        :P179_ID_RPRTE := NULL;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
null;
end;
/
