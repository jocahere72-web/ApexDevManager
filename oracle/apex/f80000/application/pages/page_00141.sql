prompt --application/pages/page_00141
begin
wwv_flow_api.create_page(
 p_id=>141
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Lotes de notificaci\00F3n de actos - Masivos')
,p_step_title=>'Impresion de actos por lote'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const fnGenerarLoteNotificacion = () => {',
'    ',
unistr('    apex.message.confirm( "\00BFDesea generar lote de determinaci\00F3n para la poblaci\00F3n seleccionada?", function( okPressed ) { '),
'        if( okPressed ) {',
'            var popup = apex.widget.waitPopup();',
'            apex.server.process(',
'                "Generar_Lote_Notificacion",',
'                {    ',
'                    pageItems: ''#P141_ID_PRCSO_JRDCO_DCMNTO_LTE''',
'                },',
'                {',
'                    success: function( pData ){',
'                        popup.remove();',
'                        //console.log(''Respuesta al crear la caja. '', pData.o_cdgo_rspsta);',
'                        if (pData.o_cdgo_rspsta != 0){ ',
'                            //apex.message.clearErrors();',
'                            //apex.message.alert(  pData.o_mnsje_rspsta );',
'                            Swal.fire({        ',
'                                icon: ''error'',',
unistr('                                title:  ''<H2 >Validaci\00F3n</H2>'','),
'                                html:   `<h4>${pData.o_mnsje_rspsta}</h4>`',
'                            }); ',
'                            ',
'                        }else{',
unistr('                            //apex.message.showPageSuccess("Lote de notificaci\00F3n generado exitosamente!");'),
unistr('                            //apex.message.alert("Lote de notificaci\00F3n generado exitosamente!");'),
'                            Swal.fire({        ',
'                                icon: ''success'',',
unistr('                                title:  ''<H2 >Informaci\00F3n</H2>'','),
'                                html:   `<h4>Los actos se han enviado a notificar correctamente!</h4>`',
'                            }); ',
'                            //apex.submit();',
'                        }',
'                    }',
'                }',
'            );',
'        } // Fin if',
'    });',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JAGUAS'
,p_last_upd_yyyymmddhh24miss=>'20211213131513'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146797307502898526)
,p_plug_name=>'Lotes'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146797784507898530)
,p_plug_name=>'<b>Opciones</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(146799244735898545)
,p_plug_name=>'Actos contenidos en el lote'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id_prcsos_jrdco,',
'       nmro_prcso_jrdco,',
'       id_prcsos_jrdco_dcmnto,',
'       nmro_acto,',
'       fcha_acto,',
'       vlor_ttal_dda,',
'       idntfccion',
'FROM v_cb_g_procesos_jrdco_dcmnto',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_lte_imprsion = :P141_ID_PRCSO_JRDCO_DCMNTO_LTE',
'and id_acto is not null'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(146799450330898547)
,p_name=>'ID_PRCSOS_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO'
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
 p_id=>wwv_flow_api.id(146799663453898549)
,p_name=>'NMRO_PRCSO_JRDCO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_PRCSO_JRDCO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('N\00FAmero Proceso')
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
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(146964572771737102)
,p_name=>'VLOR_TTAL_DDA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VLOR_TTAL_DDA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor Adeudado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_format_mask=>'FM$999G999G999G999G999G999G990'
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
 p_id=>wwv_flow_api.id(146964996542737106)
,p_name=>'ID_PRCSOS_JRDCO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_JRDCO_DCMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
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
 p_id=>wwv_flow_api.id(146966256184737119)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
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
 p_id=>wwv_flow_api.id(146966842760737125)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(146967044364737127)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(146799327868898546)
,p_internal_uid=>146799327868898546
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_api.id(146970385804737274)
,p_interactive_grid_id=>wwv_flow_api.id(146799327868898546)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(146970457632737279)
,p_report_id=>wwv_flow_api.id(146970385804737274)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(146970952737737289)
,p_view_id=>wwv_flow_api.id(146970457632737279)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(146799450330898547)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(146971976655737299)
,p_view_id=>wwv_flow_api.id(146970457632737279)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(146799663453898549)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(146973407659737306)
,p_view_id=>wwv_flow_api.id(146970457632737279)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(146964572771737102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(146975428981737314)
,p_view_id=>wwv_flow_api.id(146970457632737279)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(146964996542737106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(146981827253737344)
,p_view_id=>wwv_flow_api.id(146970457632737279)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(146966256184737119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(146984894346737357)
,p_view_id=>wwv_flow_api.id(146970457632737279)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(146966842760737125)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(146985857059737361)
,p_view_id=>wwv_flow_api.id(146970457632737279)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(146967044364737127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146797888428898531)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(146797784507898530)
,p_button_name=>'BTN_NVO_LTE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo Lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.:RP,142::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146799023569898543)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(146797784507898530)
,p_button_name=>'BTN_AGRGAR_ACTOS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Agregar Actos al lote'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.:RP:P143_ID_PRCSO_JRDCO_DCMNTO_LTE:&P141_ID_PRCSO_JRDCO_DCMNTO_LTE.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147019219014824409)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(146797784507898530)
,p_button_name=>'BTN_IMPRMIR_LTE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Imprimir Lote'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(147808697739721601)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(146797784507898530)
,p_button_name=>'BTN_GNRAR_LTE_NTFCCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Enviar actos a Notificar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-send-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146797601231898529)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(146797307502898526)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17409089099919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(147020037523824417)
,p_branch_name=>'Go To Page 71'
,p_branch_action=>'f?p=66000:71:&SESSION.:ImprimirLoteZip:&DEBUG.:RP:P71_ID_RPRTE,P71_NMBRE_ZIP,P71_JSON:&P141_ID_RPRTE.,Documentos_Cobro_Lote_&P141_ID_PRCSO_JRDCO_DCMNTO_LTE.,&P141_ID_PRCSO_JRDCO_DCMNTO_LTE.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(147019219014824409)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146797434745898527)
,p_name=>'P141_ID_PRCSO_JRDCO_DCMNTO_LTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(146797307502898526)
,p_prompt=>'Lotes:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Lote No. ''||a.id_prcso_jrdco_dcmnto_lte||'', fecha: ''||to_char(a.fcha_lte,''dd/mm/yyyy'')||'' - ''||b.dscrpcion as d,',
'        a.id_prcso_jrdco_dcmnto_lte as v',
'from cb_g_prcsos_jrdco_dcmnt_lte a',
'join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_usrio = :F_ID_USRIO',
'order by a.id_prcso_jrdco_dcmnto_lte'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147019678804824413)
,p_name=>'P141_ID_ETPA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(146797307502898526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(147019752754824414)
,p_name=>'P141_ID_RPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(146797307502898526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(147021898763824435)
,p_computation_sequence=>10
,p_computation_item=>'P141_ID_ETPA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct a.id_etpa',
'from v_cb_g_procesos_jrdco_dcmnto a',
'join cb_g_prcsos_jrdco_dcmnt_lte b on b.id_acto_tpo = a.id_acto_tpo',
'where a.id_lte_imprsion = :P141_ID_PRCSO_JRDCO_DCMNTO_LTE'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(147021968533824436)
,p_computation_sequence=>20
,p_computation_item=>'P141_ID_RPRTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.id_rprte',
'from gn_d_plantillas a',
'join gn_d_actos_tipo_tarea c on C.id_acto_tpo = A.id_acto_tpo ',
'where C.id_fljo_trea = :P141_ID_ETPA',
'group by A.id_rprte;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(147808915867721604)
,p_name=>'Al dar Click en BTN_GNRAR_LTE_NTFCCION'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(147808697739721601)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(147809067676721605)
,p_event_id=>wwv_flow_api.id(147808915867721604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnGenerarLoteNotificacion();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(147808899516721603)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Lote_Notificacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta     number;',
'    o_mnsje_rspsta    varchar2(1000);',
'    v_cdgo_acto_tpo   varchar2(10);',
'    v_indcdor_ntfccion varchar2(3);',
'    v_dcmntos_ascdos_lte    number;',
'begin',
'    ',
'    begin',
'        select b.cdgo_acto_tpo, b.indcdor_ntfccion',
'        into v_cdgo_acto_tpo, v_indcdor_ntfccion',
'        from cb_g_prcsos_jrdco_dcmnt_lte a',
'        join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'        where a.id_prcso_jrdco_dcmnto_lte = :P141_ID_PRCSO_JRDCO_DCMNTO_LTE;',
'    exception',
'        when others then',
'            apex_json.open_object();',
'            apex_json.write(''o_cdgo_rspsta'', 10);',
unistr('            apex_json.write(''o_mnsje_rspsta'', ''Error al intentar consultar el C\00F3digo del Acto del Lote.'');'),
'            apex_json.close_object();',
'            return;',
'    end;',
'    ',
'    select count(1) into v_dcmntos_ascdos_lte',
'    from cb_g_procesos_jrdco_dcmnto',
'    where id_lte_imprsion = :P141_ID_PRCSO_JRDCO_DCMNTO_LTE;',
'    ',
'    if v_dcmntos_ascdos_lte > 0 then',
'    ',
'        if v_indcdor_ntfccion = ''S'' then',
'',
'            pkg_cb_proceso_juridico.prc_gn_notificacion_cobros ( p_cdgo_clnte		=> :F_CDGO_CLNTE,',
'                                                                 p_cdgo_acto_tpo	=> v_cdgo_acto_tpo,',
'                                                                 p_id_usuario		=> :F_ID_USRIO,',
'                                                                 p_id_lte_imprsion 	=> :P141_ID_PRCSO_JRDCO_DCMNTO_LTE,',
'                                                                 o_cdgo_rspsta		=> o_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta		=> o_mnsje_rspsta',
'                                                              );',
'',
'             apex_json.open_object();',
'             apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'             apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'             apex_json.close_object();',
'         else',
'             apex_json.open_object();',
'             apex_json.write(''o_cdgo_rspsta'', 20);',
'             apex_json.write(''o_mnsje_rspsta'', ''El tipo de Acto no es notificable.'');',
'             apex_json.close_object();',
'         end if;',
'    else',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 30);',
'        apex_json.write(''o_mnsje_rspsta'', ''El lote seleccionado no tiene actos asociados.'');',
'        apex_json.close_object();',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
