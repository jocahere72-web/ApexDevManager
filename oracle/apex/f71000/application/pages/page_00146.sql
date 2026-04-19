prompt --application/pages/page_00146
begin
wwv_flow_api.create_page(
 p_id=>146
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Consulta de sujeto Impuesto-Provicional'
,p_page_mode=>'MODAL'
,p_step_title=>'Consulta de sujeto Impuesto'
,p_autocomplete_on_off=>'OFF'
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
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20190911101335'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(540050881900640373)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(540052446664640388)
,p_plug_name=>'Sujetos Tributos'
,p_region_css_classes=>'customAlternatingRow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select i.id_sjto_impsto,',
'       i.id_impsto, ',
'       i.id_sjto,',
'       i.nmbre_impsto,',
'       i.idntfccion_sjto,',
'       i.drccion,',
'       i.idntfccion_antrior,',
'       r.nmbre_rzon_scial,',
'       r.idntfccion_rspnsble,       ',
'       case when prncpal_s_n = ''S'' then',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="disabled" checked>'' ',
'        else  ',
'       ''<input type="checkbox" name="prncpal_s_n" disabled="disabled">'' ',
'       end as prncpal_s_n,',
'       i.cdgo_sjto_tpo',
' from v_si_i_sujetos_impuesto i',
' join sg_g_usuarios_impuesto b ',
'   on b.id_impsto = i.id_impsto',
'left join v_si_i_sujetos_responsable r on i.id_sjto = r.id_sjto',
'where  r.cdgo_clnte          = :F_CDGO_CLNTE',
'  and b.id_usrio = :F_ID_USRIO',
'  and (i.id_impsto           = :P146_ID_IMPSTO                        or :P146_ID_IMPSTO             is null)',
'  and (r.idntfccion_rspnsble = :P146_INDTFCCION_RSPNSBLE              or :P146_INDTFCCION_RSPNSBLE   is null)',
'  and (r.idntfccion_sjto          like ''%'' || :P146_IDNTFCCION      || ''%'' or :P146_IDNTFCCION            is null)',
'  and (i.drccion             like ''%'' || :P146_DRCCION         || ''%'' or :P146_DRCCION               is null)',
'  and (r.nmbre_rzon_scial      like ''%'' || :P146_NMBRE_RZON_SCIAL||''%''  or :P146_NMBRE_RZON_SCIAL      is null)',
'  and (i.idntfccion_antrior  = :P146_IDNTFCCION_ANTRIOR               or :P146_IDNTFCCION_ANTRIOR    is null)  ',
'  and (:P146_VLDAR_CRTRA is null or ( select sum(a.vlor_sldo_cptal+ a.vlor_intres)',
'                                            from v_gf_g_cartera_x_concepto a',
'                                           where a.cdgo_clnte = :F_CDGO_CLNTE',
'                                             and a.id_impsto = i.id_impsto',
'                                             and a.id_sjto_impsto = i.id_sjto_impsto ',
'                                             and a.cdgo_mvnt_fncro_estdo = ''NO''',
'                                             and a.vlor_sldo_cptal > 0',
'                                             and trunc(a.fcha_vncmnto) <= trunc(sysdate)',
'                                             and not exists(select 1 ',
'                                                              from cb_g_procesos_smu_mvmnto d ',
'                                                             where d.id_sjto_impsto = a.id_sjto_impsto ',
'                                                               and d.vgncia = a.vgncia',
'                                                               and d.id_prdo = a.id_prdo',
'                                                               and d.id_cncpto = a.id_cncpto))>0)',
'   and (:P146_ID_TPOS_EMBRGO is null or ( select sum(a.vlor_sldo_cptal+ a.vlor_intres)',
'                                            from v_gf_g_cartera_x_concepto a',
'                                           where a.cdgo_clnte = :F_CDGO_CLNTE',
'                                             and a.id_impsto = i.id_impsto',
'                                             and a.id_sjto_impsto = i.id_sjto_impsto ',
'                                             and trunc(a.fcha_vncmnto) <= trunc(sysdate)',
'                                             and a.cdgo_mvnt_fncro_estdo = ''NO''',
'                                             and a.vlor_sldo_cptal > 0',
'                                             and not exists(select 1 ',
'                                                                from MC_G_EMBARGOS_SMU_MVMNTO e ',
'                                                               where e.id_sjto_impsto = a.id_sjto_impsto ',
'                                                                 and e.vgncia = a.vgncia',
'                                                                 and e.id_prdo = a.id_prdo',
'                                                                 and e.id_cncpto = a.id_cncpto',
'                                                                 and exists (select 2',
'                                                                               from MC_G_EMBARGOS_SIMU_LOTE f, MC_G_EMBARGOS_SIMU_SUJETO g',
'                                                                              where f.ID_EMBRGOS_SMU_LTE = g.ID_EMBRGOS_SMU_LTE',
'                                                                                and g.ID_EMBRGOS_SMU_SJTO = e.ID_EMBRGOS_SMU_SJTO',
'                                                                                and f.id_tpos_mdda_ctlar = :P146_ID_TPOS_EMBRGO)))>0); ',
'                                                               '))
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
 p_id=>wwv_flow_api.id(547648391757981042)
,p_max_row_count=>'5'
,p_max_rows_per_page=>'5'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&P146_NMRO_APP.:&P146_NMRO_PGNA.:&SESSION.::&DEBUG.:RP:&P146_NMBRE_ITEM.:#ID_SJTO#'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" class="fa fa-check-square-o"></span>',
'',
'',
' '))
,p_detail_link_attr=>'style="color:align:center"'
,p_owner=>'SROMERO'
,p_internal_uid=>547648391757981042
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97657442779387577)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sujeto Impuesto'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97657816116387577)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Impuesto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97658242579387578)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'ITEM_IS_NULL'
,p_display_condition=>'P146_ID_IMPSTO'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97658699604387578)
,p_db_column_name=>'DRCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97659034915387578)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Responsable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97659465212387578)
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
 p_id=>wwv_flow_api.id(97657083559387577)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>unistr('Nombre / Raz\00F3n Social')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97660266376387579)
,p_db_column_name=>'CDGO_SJTO_TPO'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Cdgo sjto tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97659857533387579)
,p_db_column_name=>'IDNTFCCION_ANTRIOR'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>unistr('Identificaci\00F3n Anterior')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P146_INDCDOR_IDNTFCCION_ANT'
,p_display_condition2=>'S'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97656683579387575)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>'Idntfccion Sjto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97506703042584006)
,p_db_column_name=>'ID_SJTO'
,p_display_order=>180
,p_column_identifier=>'P'
,p_column_label=>'Id Sjto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(547678635894060112)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'976606'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'NMBRE_RZON_SCIAL:DRCCION:IDNTFCCION_RSPNSBLE:PRNCPAL_S_N::IDNTFCCION_SJTO:ID_SJTO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97650767979387561)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(540050881900640373)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97651102404387564)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(540050881900640373)
,p_button_name=>'CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96981723681168004)
,p_name=>'P146_ID_TPOS_EMBRGO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(540052446664640388)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97651514096387565)
,p_name=>'P146_NMRO_APP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97651926729387567)
,p_name=>'P146_NMRO_PGNA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97652376761387567)
,p_name=>'P146_NMBRE_ITEM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97652775637387567)
,p_name=>'P146_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto,',
'       id_impsto',
'  from df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'order by nmbre_impsto'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97653189319387568)
,p_name=>'P146_IDNTFCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97653563235387568)
,p_name=>'P146_INDTFCCION_RSPNSBLE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_prompt=>unistr('Identificaci\00F3n Responsable')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97653957312387569)
,p_name=>'P146_NMBRE_RZON_SCIAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_prompt=>unistr('Nombre / Raz\00F3n Social')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97654307309387569)
,p_name=>'P146_DRCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97654763653387569)
,p_name=>'P146_IDNTFCCION_ANTRIOR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_prompt=>unistr('Identificaci\00F3n Anterior')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_idntfccion_ant ',
'  from df_c_impuestos ',
' where id_impsto = :P146_ID_IMPSTO ',
'   and indcdor_idntfccion_ant = ''S'';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97655173320387570)
,p_name=>'P146_CDGO_SJTO_TPO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97655501018387570)
,p_name=>'P146_INDCDOR_IDNTFCCION_ANT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97655991718387570)
,p_name=>'P146_ID_SJTO_IMPSTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(540050881900640373)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97661028170387582)
,p_name=>'P146_VLDAR_CRTRA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(540052446664640388)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97661427696387591)
,p_name=>'Set to Upper_Case nombre razon social'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_NMBRE_RZON_SCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97661927706387592)
,p_event_id=>wwv_flow_api.id(97661427696387591)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_NMBRE_RZON_SCIAL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value.toUpperCase();'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97662355591387592)
,p_name=>'Set to Upper_Case direccion'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_DRCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97662852458387593)
,p_event_id=>wwv_flow_api.id(97662355591387592)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_DRCCION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value.toUpperCase().trim();'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97663200681387593)
,p_name=>'Calcular Tipo de Sujeto'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97663704703387593)
,p_event_id=>wwv_flow_api.id(97663200681387593)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_cdgo_sjto_tpo varchar2(3);',
'    v_indcdor_idntfccion_ant varchar2(1);',
' ',
'begin',
'',
'    v_cdgo_sjto_tpo := -1;',
'    v_indcdor_idntfccion_ant := ''N'';',
'',
'    begin',
'        select cdgo_sjto_tpo, ',
'               indcdor_idntfccion_ant ',
'          into v_cdgo_sjto_tpo, ',
'               v_indcdor_idntfccion_ant ',
'          from df_c_impuestos ',
'         where id_impsto = :P146_ID_IMPSTO ',
'           and cdgo_clnte = :F_CDGO_CLNTE;',
'    exception ',
'        when no_data_found then ',
'        v_cdgo_sjto_tpo := -1;',
'        v_indcdor_idntfccion_ant := ''N'';',
'        ',
'    end;',
'    :P146_CDGO_SJTO_TPO := v_cdgo_sjto_tpo;',
'    :P146_INDCDOR_IDNTFCCION_ANT := v_indcdor_idntfccion_ant;',
'',
'end;'))
,p_attribute_02=>'P146_ID_IMPSTO,F_CDGO_CLNTE'
,p_attribute_03=>'P146_CDGO_SJTO_TPO,P146_INDCDOR_IDNTFCCION_ANT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97664194288387593)
,p_name=>unistr('Al cambiar indicador de identidicacion a S se mostrar \00EDtem identificaci\00F3n anterior')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P146_INDCDOR_IDNTFCCION_ANT'
,p_condition_element=>'P146_INDCDOR_IDNTFCCION_ANT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97664681994387593)
,p_event_id=>wwv_flow_api.id(97664194288387593)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97665146501387594)
,p_event_id=>wwv_flow_api.id(97664194288387593)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P146_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(97665500857387594)
,p_name=>'New'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(97651102404387564)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(97666017037387594)
,p_event_id=>wwv_flow_api.id(97665500857387594)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
