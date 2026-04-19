prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Consulta de Sujeto Impuesto'
,p_page_mode=>'MODAL'
,p_step_title=>'Consulta de Sujeto Tributo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccion_sujeto(v_id_sjto_impsto) {',
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
,p_last_upd_yyyymmddhh24miss=>'20190201031553'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(201013953152287245)
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
 p_id=>wwv_flow_api.id(201015517916287260)
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
'  and (r.id_impsto           = :P4_ID_IMPSTO                        or :P4_ID_IMPSTO             is null)',
'  and (r.idntfccion_rspnsble = :P4_INDTFCCION_RSPNSBLE              or :P4_INDTFCCION_RSPNSBLE   is null)',
'  and (r.idntfccion          like ''%'' || :P4_IDNTFCCION      || ''%'' or :P4_IDNTFCCION            is null)',
'  and (r.drccion             like ''%'' || :P4_DRCCION         || ''%'' or :P4_DRCCION               is null)',
'  and (r.nmbre_rspnsble      like ''%'' || :P4_NMBRE_RZON_SCIAL||''%''  or :P4_NMBRE_RZON_SCIAL      is null)',
'  and (r.idntfccion_antrior  = :P4_IDNTFCCION_ANTRIOR               or :P4_IDNTFCCION_ANTRIOR    is null)  ;'))
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
 p_id=>wwv_flow_api.id(208611463009627914)
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
,p_internal_uid=>208611463009627914
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113921954739738990)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sujeto Impuesto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113922321742738990)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Impuesto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113922759127738991)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P4_ID_IMPSTO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113923118357738992)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113923591593738993)
,p_db_column_name=>'DRCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113923947937738993)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Responsable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113924378968738993)
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
 p_id=>wwv_flow_api.id(113921642988738978)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>unistr('Nombre / Raz\00F3n Social')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P4_CDGO_SJTO_TPO'
,p_display_condition2=>'E'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113925100382738994)
,p_db_column_name=>'NMBRE_RSPNSBLE'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113925501926738994)
,p_db_column_name=>'CDGO_SJTO_TPO'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Cdgo sjto tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113924706251738994)
,p_db_column_name=>'IDNTFCCION_ANTRIOR'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>unistr('Identificaci\00F3n Anterior')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P4_INDCDOR_IDNTFCCION_ANT'
,p_display_condition2=>'S'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(208641707145706984)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1139259'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'NMBRE_IMPSTO:IDNTFCCION:DRCCION:IDNTFCCION_RSPNSBLE:NMBRE_RZON_SCIAL:PRNCPAL_S_N:NMBRE_RSPNSBLE::CDGO_SJTO_TPO:IDNTFCCION_ANTRIOR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(113926693510739027)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(201013953152287245)
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
 p_id=>wwv_flow_api.id(113927057454739032)
,p_name=>'P4_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(201013953152287245)
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
 p_id=>wwv_flow_api.id(113927462287739035)
,p_name=>'P4_IDNTFCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(201013953152287245)
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
 p_id=>wwv_flow_api.id(113927873052739036)
,p_name=>'P4_INDTFCCION_RSPNSBLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(201013953152287245)
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
 p_id=>wwv_flow_api.id(113928293180739036)
,p_name=>'P4_NMBRE_RZON_SCIAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(201013953152287245)
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
 p_id=>wwv_flow_api.id(113928690250739036)
,p_name=>'P4_DRCCION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(201013953152287245)
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
 p_id=>wwv_flow_api.id(113929069222739036)
,p_name=>'P4_IDNTFCCION_ANTRIOR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(201013953152287245)
,p_prompt=>unistr('Identificaci\00F3n Anterior')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_idntfccion_ant ',
'  from df_c_impuestos ',
' where id_impsto = :P4_ID_IMPSTO ',
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
 p_id=>wwv_flow_api.id(113929411459739037)
,p_name=>'P4_CDGO_SJTO_TPO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(201013953152287245)
,p_prompt=>'New'
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
 p_id=>wwv_flow_api.id(113929839152739037)
,p_name=>'P4_INDCDOR_IDNTFCCION_ANT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(201013953152287245)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113933461068739054)
,p_name=>'Set to Upper_Case'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_NMBRE_RZON_SCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113933917497739054)
,p_event_id=>wwv_flow_api.id(113933461068739054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_NMBRE_RZON_SCIAL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value.toUpperCase();'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113931603179739052)
,p_name=>'Set to Upper_Case_1'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_DRCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113932143539739053)
,p_event_id=>wwv_flow_api.id(113931603179739052)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_DRCCION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value.toUpperCase().trim();'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113932545240739053)
,p_name=>'Calcular Tipo de Sujeto'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113933081601739053)
,p_event_id=>wwv_flow_api.id(113932545240739053)
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
' where id_impsto = :P4_ID_IMPSTO ',
'   and cdgo_clnte = :F_CDGO_CLNTE;',
'   ',
':P4_CDGO_SJTO_TPO := v_cdgo_sjto_tpo;',
':P4_INDCDOR_IDNTFCCION_ANT := v_indcdor_idntfccion_ant;',
'',
'end;'))
,p_attribute_02=>'P4_ID_IMPSTO,F_CDGO_CLNTE'
,p_attribute_03=>'P4_CDGO_SJTO_TPO,P4_INDCDOR_IDNTFCCION_ANT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113934355059739054)
,p_name=>unistr('Mostrar \00EDtem identificaci\00F3n anterior')
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_INDCDOR_IDNTFCCION_ANT'
,p_condition_element=>'P4_INDCDOR_IDNTFCCION_ANT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113934829553739055)
,p_event_id=>wwv_flow_api.id(113934355059739054)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(113930295348739050)
,p_name=>unistr('Mostrar Identificaci\00F3n Anterior')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_INDCDOR_IDNTFCCION_ANT'
,p_condition_element=>'P4_INDCDOR_IDNTFCCION_ANT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113930707774739052)
,p_event_id=>wwv_flow_api.id(113930295348739050)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(113931202855739052)
,p_event_id=>wwv_flow_api.id(113930295348739050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
