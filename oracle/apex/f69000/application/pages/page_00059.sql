prompt --application/pages/page_00059
begin
wwv_flow_api.create_page(
 p_id=>59
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Detalle Cargue Masivo Estratos'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle Cargue Masivo Estratos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220526103557'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236061359979560245)
,p_plug_name=>'Incosistencias'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from   si_g_novedades_prdio_crgue	',
'where  id_prcso_crga = :P59_ID_PRCSO_CRGA',
'and    indcdor_error = ''S'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(236060443267560236)
,p_plug_name=>'Detalle de Incosistencias'
,p_parent_plug_id=>wwv_flow_api.id(236061359979560245)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select idntfccion_sjto, ',
'       cdgo_estrto_crgue, ',
'       mnsje_rspsta',
'from   si_g_novedades_prdio_crgue	',
'where  id_prcso_crga = :P59_ID_PRCSO_CRGA',
'and    indcdor_error = ''S''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P59_ID_NVDAD_PRDIO_RSMEN'
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
 p_id=>wwv_flow_api.id(236060567025560237)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'SROMERO'
,p_internal_uid=>236060567025560237
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10664004180872618)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>unistr('Identificaci\00F3n<br>Sujeto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10664148578872619)
,p_db_column_name=>'CDGO_ESTRTO_CRGUE'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Estrato del<br>Cargue'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(10664259127872620)
,p_db_column_name=>'MNSJE_RSPSTA'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Mensaje Error'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(236977683939470138)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1882984'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>':IDNTFCCION_SJTO:CDGO_ESTRTO_CRGUE:MNSJE_RSPSTA'
,p_sort_column_1=>'IDNTFCCION_SJTO_FRMTDA'
,p_sort_direction_1=>'ASC NULLS LAST'
,p_sort_column_2=>'VGNCIA'
,p_sort_direction_2=>'ASC NULLS LAST'
,p_sort_column_3=>'PRDO'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(561417323192400089)
,p_plug_name=>'Cargue de Estratos Masivos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-top-sm:margin-bottom-sm:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188302185743145373)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(561417323192400089)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10663979539872617)
,p_name=>'P59_ID_PRCSO_CRGA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_PRCSO_CRGA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>unistr('Tributo al que pertenece el lote de determinaci\00F3n')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188302543275145375)
,p_name=>'P59_ID_NVDAD_PRDIO_RSMEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_NVDAD_PRDIO_RSMEN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188302959291145377)
,p_name=>'P59_ID_USRIO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_prompt=>'<i><b>ProcesoNo. &P59_ID_DTRMNCION_LTE.</b></i> creado por:'
,p_source=>'ID_USRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_trcro, ',
'        id_usrio ',
'   from v_sg_g_usuarios ',
'  where cdgo_clnte = :F_CDGO_CLNTE'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Nombre del Usuario que gener\00F3 el Lote de Determinaci\00F3n')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188303887175145384)
,p_name=>'P59_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Inicio'
,p_format_mask=>'DD-MON-YYYY HH:MI:SS PM'
,p_source=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha de Generaci\00F3n del Lote de Determinaci\00F3n')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188304733355145385)
,p_name=>'P59_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Fin'
,p_format_mask=>'DD-MON-YYYY HH:MI:SS PM'
,p_source=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Fecha de Generaci\00F3n del Lote de Determinaci\00F3n')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188305698555145385)
,p_name=>'P59_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tributo'
,p_source=>'ID_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Tributo al que pertenece el lote de determinaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188306578273145389)
,p_name=>'P59_ID_IMSPTO_SBMPSTO'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sub-Tributo'
,p_source=>'ID_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_impsto_sbmpsto d, ',
'        id_impsto_sbmpsto r',
'   from df_i_impuestoS_subimpuesto ',
'  where cdgo_clnte = :F_CDGO_CLNTE ',
'    and id_impsto = :P59_ID_IMPSTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P59_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Sub-Tributo al que pertenece el lote de determinaci\00F3n')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188313709746145398)
,p_name=>'P59_NMRO_RGSTRO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Registros')
,p_source=>'NMRO_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero de sujetos del tributo que se obtuvieron del m\00E9todo de selecci\00F3n. ')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188314680379145399)
,p_name=>'P59_NMRO_CMBIO_ESTRTOS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(561417323192400089)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('N\00B0 Cambios Realizados')
,p_source=>'NMRO_CMBIO_ESTRTOS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588037754834705)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Indica el n\00FAmero de sujetos del tributo que fueron determinados.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(188315802110145408)
,p_name=>unistr('Al hacer clic en el bot\00F3n regresarClose Dialog')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(188302185743145373)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(188316359768145409)
,p_event_id=>wwv_flow_api.id(188315802110145408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(188315462227145407)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from SI_G_NOVEDADES_PRDIO_RSUMEN'
,p_attribute_02=>'SI_G_NOVEDADES_PRDIO_RSUMEN'
,p_attribute_03=>'P59_ID_NVDAD_PRDIO_RSMEN'
,p_attribute_04=>'ID_NVDAD_PRDIO_RSMEN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
