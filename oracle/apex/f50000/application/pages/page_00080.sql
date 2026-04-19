prompt --application/pages/page_00080
begin
wwv_flow_api.create_page(
 p_id=>80
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Consulta de Sujeto Impuesto'
,p_page_mode=>'MODAL'
,p_step_title=>'Consulta de Sujeto Tributo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccion_sujeto(v_id_sjto_impsto) {',
'    ',
'    apex.item("P80_ID_SJTO_IMPSTO").setValue(v_id_sjto_impsto);',
'     alert(v_id_sjto_impsto);',
'    ',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Caracteristicas del IRR*/ ',
'.a-IRR, .t-Form-label {',
'    font-size: 1rem;',
'    padding: 1px;',
'}',
'',
'.t-Button {',
'    font-size: 1rem;',
'    padding: 6px;',
'}',
'',
'',
'',
'/* Clases para el IRR -Alternar colores por Filas-*/ ',
'.customAlternatingRow .a-IRR-table tr:nth-child(odd) td {',
'    background-color: #ffffff;',
'}',
'',
'.customAlternatingRow .a-IRR-table tr:nth-child(even) td {',
'    background-color: #f1f6fa;',
'}',
'',
'.customAlternatingRow .a-IRR-table tr:hover td {',
'    background-color: #ffffb3;',
'    font-weight: bold;',
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_last_upd_yyyymmddhh24miss=>'20190201031553'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(263636327677532495)
,p_plug_name=>'Parametros de Busqueda'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(263637892441532510)
,p_plug_name=>'Sujetos Tributos'
,p_region_css_classes=>'customAlternatingRow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.id_sjto_impsto,',
'       r.id_impsto, ',
'       r.nmbre_impsto,',
'       r.idntfccion,',
'       r.drccion,',
'       r.idntfccion_antrior,',
'       r.nmbre_rzon_scial,',
'       r.idntfccion_rspnsble,',
'       r.nmbre_rspnsble,',
'       case when prncpal_s_n = ''S'' then',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="disabled" checked>'' ',
'        else  ',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="disabled">'' ',
'       end as prncpal_s_n,',
'       r.cdgo_sjto_tpo',
' from v_si_i_sujetos_responsable r',
'where  r.cdgo_clnte          = :F_CDGO_CLNTE',
'  and (r.id_impsto           = :P80_ID_IMPSTO                        or :P80_ID_IMPSTO             is null)',
'  and (r.idntfccion_rspnsble = :P80_INDTFCCION_RSPNSBLE              or :P80_INDTFCCION_RSPNSBLE   is null)',
'  and (r.idntfccion          like ''%'' || :P80_IDNTFCCION      || ''%'' or :P80_IDNTFCCION            is null)',
'  and (r.drccion             like ''%'' || :P80_DRCCION         || ''%'' or :P80_DRCCION               is null)',
'  and (r.nmbre_rspnsble      like ''%'' || :P80_NMBRE_RZON_SCIAL||''%''  or :P80_NMBRE_RZON_SCIAL      is null)',
'  and (r.idntfccion_antrior  = :P80_IDNTFCCION_ANTRIOR               or :P80_IDNTFCCION_ANTRIOR    is null)  ;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'ALWAYS'
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
 p_id=>wwv_flow_api.id(271233837534873164)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'javascript:(seleccion_sujeto(#ID_SJTO_IMPSTO#))'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'SROMERO'
,p_internal_uid=>271233837534873164
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176548248566984247)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sujeto Impuesto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176548693802984248)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Impuesto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176549057616984248)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P80_ID_IMPSTO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176549466672984248)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176549826561984249)
,p_db_column_name=>'DRCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176550270031984249)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Responsable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176550693530984249)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'Principal'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176547869692984239)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>unistr('Nombre / Raz\00F3n Social')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P80_CDGO_SJTO_TPO'
,p_display_condition2=>'E'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176551469324984250)
,p_db_column_name=>'NMBRE_RSPNSBLE'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176551826321984250)
,p_db_column_name=>'CDGO_SJTO_TPO'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Cdgo sjto tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176551070795984249)
,p_db_column_name=>'IDNTFCCION_ANTRIOR'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>unistr('Identificaci\00F3n Anterior')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P80_INDCDOR_IDNTFCCION_ANT'
,p_display_condition2=>'S'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(271264081670952234)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1765522'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'NMBRE_IMPSTO:IDNTFCCION:DRCCION:IDNTFCCION_RSPNSBLE:NMBRE_RZON_SCIAL:PRNCPAL_S_N:NMBRE_RSPNSBLE::CDGO_SJTO_TPO:IDNTFCCION_ANTRIOR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(176544052554984194)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(263636327677532495)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(169441683212893713)
,p_name=>'P80_ID_SJTO_IMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_prompt=>'Id sjto impsto'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176544445738984212)
,p_name=>'P80_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_prompt=>'Tributos'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto,',
'       id_impsto',
'  from df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'order by nmbre_impsto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176544700909984221)
,p_name=>'P80_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176545133641984222)
,p_name=>'P80_INDTFCCION_RSPNSBLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_prompt=>unistr('Identificaci\00F3n Responsable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176545563819984223)
,p_name=>'P80_NMBRE_RZON_SCIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_prompt=>unistr('Nombre / Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176545962929984223)
,p_name=>'P80_DRCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176546384914984223)
,p_name=>'P80_IDNTFCCION_ANTRIOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_prompt=>unistr('Identificaci\00F3n Anterior')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_idntfccion_ant ',
'  from df_c_impuestos ',
' where id_impsto = :P80_ID_IMPSTO ',
'   and indcdor_idntfccion_ant = ''S'';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176546745035984224)
,p_name=>'P80_CDGO_SJTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176547153955984224)
,p_name=>'P80_INDCDOR_IDNTFCCION_ANT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(263636327677532495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(176552620503984272)
,p_name=>'Set to Upper_Case'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_NMBRE_RZON_SCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176553165735984276)
,p_event_id=>wwv_flow_api.id(176552620503984272)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_NMBRE_RZON_SCIAL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value.toUpperCase();'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(176553567708984276)
,p_name=>'Set to Upper_Case_1'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_DRCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176554019442984277)
,p_event_id=>wwv_flow_api.id(176553567708984276)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_DRCCION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value.toUpperCase().trim();'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(176554452607984277)
,p_name=>'Calcular Tipo de Sujeto'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176554925608984277)
,p_event_id=>wwv_flow_api.id(176554452607984277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_cdgo_sjto_tpo varchar2(3);',
'v_indcdor_idntfccion_ant varchar2(1);',
'',
'begin',
'',
'v_cdgo_sjto_tpo := -1;',
'v_indcdor_idntfccion_ant := ''N'';',
'',
'select cdgo_sjto_tpo, ',
'       indcdor_idntfccion_ant ',
'  into v_cdgo_sjto_tpo, ',
'       v_indcdor_idntfccion_ant ',
'  from df_c_impuestos ',
' where id_impsto = :P80_ID_IMPSTO ',
'   and cdgo_clnte = :F_CDGO_CLNTE;',
'   ',
':P80_CDGO_SJTO_TPO := v_cdgo_sjto_tpo;',
':P80_INDCDOR_IDNTFCCION_ANT := v_indcdor_idntfccion_ant;',
'',
'end;'))
,p_attribute_02=>'P80_ID_IMPSTO,F_CDGO_CLNTE'
,p_attribute_03=>'P80_CDGO_SJTO_TPO,P80_INDCDOR_IDNTFCCION_ANT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(176555385508984277)
,p_name=>unistr('Mostrar \00EDtem identificaci\00F3n anterior')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_INDCDOR_IDNTFCCION_ANT'
,p_condition_element=>'P80_INDCDOR_IDNTFCCION_ANT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176555801239984285)
,p_event_id=>wwv_flow_api.id(176555385508984277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(176556285112984285)
,p_name=>unistr('Mostrar Identificaci\00F3n Anterior')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_INDCDOR_IDNTFCCION_ANT'
,p_condition_element=>'P80_INDCDOR_IDNTFCCION_ANT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176556799983984286)
,p_event_id=>wwv_flow_api.id(176556285112984285)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(176557271841984286)
,p_event_id=>wwv_flow_api.id(176556285112984285)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
