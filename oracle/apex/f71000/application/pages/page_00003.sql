prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Consulta de Sujeto Impuesto'
,p_page_mode=>'MODAL'
,p_step_title=>'Consulta de Sujeto Tributo'
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
,p_dialog_width=>'80%'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20230324171252'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(442400786668252835)
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
 p_id=>wwv_flow_api.id(442402351432252850)
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
'        i.id_impsto, ',
'        i.nmbre_impsto,',
'        i.idntfccion_sjto,',
'        i.drccion,',
'        i.idntfccion_antrior,',
'        r.nmbre_rzon_scial,',
'        p.nmbre_rzon_scial rzon_scial,',
'        r.idntfccion_rspnsble,       ',
'        case when prncpal_s_n = ''S'' then',
'        ''<input type="checkbox" name="prncpal_s_n" disabled="disabled" checked>'' ',
'         else  ',
'        ''<input type="checkbox" name="prncpal_s_n" disabled="disabled">'' ',
'        end as prncpal_s_n,',
'        i.cdgo_sjto_tpo,',
'        r.id_sjto_rspnsble,',
'        i.mtrcla_inmblria,',
'        i.dscrpcion_sjto_estdo,',
'        r.dscrpcion_rspnsble_tpo',
'   from v_si_i_sujetos_impuesto    i',
'   join sg_g_usuarios_impuesto     b on b.id_impsto = i.id_impsto',
'left join v_si_i_sujetos_responsable r on i.id_sjto_impsto = r.id_sjto_impsto',
'left join si_i_personas p on p.id_sjto_impsto = i.id_sjto_impsto',
'  where i.cdgo_clnte           = :F_CDGO_CLNTE',
'    and b.id_usrio             = :F_ID_USRIO',
'    and (i.id_impsto           = :P3_ID_IMPSTO                       or :P3_ID_IMPSTO             is null)',
'  /*  and (r.idntfccion_rspnsble = :P3_INDTFCCION_RSPNSBLE              or :P3_INDTFCCION_RSPNSBLE   is null)',
'    and (i.idntfccion_sjto     like ''%'' || :P3_IDNTFCCION      || ''%'' or :P3_IDNTFCCION            is null)',
'    and (i.drccion             like ''%'' || :P3_DRCCION         || ''%'' or :P3_DRCCION               is null)',
'    and (r.nmbre_rzon_scial    like ''%'' || :P3_NMBRE_RZON_SCIAL|| ''%'' or :P3_NMBRE_RZON_SCIAL      is null)',
'    and (p.nmbre_rzon_scial    like ''%'' || :P3_NMBRE_RZON_SCIAL|| ''%'' or :P3_NMBRE_RZON_SCIAL      is null)',
'    and (i.idntfccion_antrior  = :P3_IDNTFCCION_ANTRIOR               or :P3_IDNTFCCION_ANTRIOR    is null)  */',
'    and ((:P3_VLDAR_CRTRA      = ''S'' and ( select sum(vlor_sldo_cptal + vlor_intres)',
'                                             from v_gf_g_cartera_x_concepto m',
'                                            where i.id_sjto_impsto = m.id_sjto_impsto',
'                                              and (m.id_impsto               = :P3_ID_IMPSTO            or :P3_ID_IMPSTO            is null)',
'                                              and (m.id_impsto_sbmpsto       = :P3_ID_IMPSTO_SBMPSTO    or :P3_ID_IMPSTO_SBMPSTO    is null)',
'                                              and m.cdgo_mvnt_fncro_estdo    = ''NO''',
'                                              and (:P3_TNE_PRCSO_JRDCO is null or not exists(select 1 ',
'                                                                                               from cb_g_procesos_smu_mvmnto c ',
'                                                                                              where c.vgncia = m.vgncia',
'                                                                                                and c.id_prdo = m.id_prdo',
'                                                                                                and c.id_cncpto = m.id_cncpto',
'                                                                                                and c.id_sjto_impsto = m.id_sjto_impsto))',
'                                          ',
'                                         ) > 0 ) or :P3_VLDAR_CRTRA = ''N'' or :P3_VLDAR_CRTRA is null)',
'   '))
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
 p_id=>wwv_flow_api.id(449998296525593504)
,p_max_rows_per_page=>'5'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&P3_NMRO_APP.:&P3_NMRO_PGNA.:&SESSION.:PRMTRO_BSQDA:&DEBUG.:RP:&P3_NMBRE_ITEM.,&P3_NMBRE_ITEM_IMPSTO.,&P3_NMBRE_ITEM_SBIMPSTO.:#ID_SJTO_IMPSTO#,#ID_IMPSTO#,&P3_IMPSTO_SBMPSTO.'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span aria-hidden="true" class="fa fa-check-square-o"></span>',
'',
'',
' '))
,p_detail_link_attr=>'style="color:align:center"'
,p_owner=>'SROMERO'
,p_internal_uid=>447819857114995045
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178765536362720386)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Sujeto Impuesto'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178765845852720386)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Impuesto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178766250903720387)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178767132430720387)
,p_db_column_name=>'DRCCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178767464258720388)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Identificaci\00F3n Responsable')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178767888350720388)
,p_db_column_name=>'PRNCPAL_S_N'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'Principal'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178765131287720381)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67292243408147603)
,p_db_column_name=>'RZON_SCIAL'
,p_display_order=>140
,p_column_identifier=>'S'
,p_column_label=>unistr('Raz\00F3n Social')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178769106104720391)
,p_db_column_name=>'CDGO_SJTO_TPO'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Cdgo sjto tpo'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(178768310501720388)
,p_db_column_name=>'IDNTFCCION_ANTRIOR'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>unistr('Identificaci\00F3n Anterior')
,p_column_type=>'STRING'
,p_column_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 20200211',
unistr('-- Se Quito Condici\00F3n de Columna'),
'-- Jose Yi',
unistr('La columna estaba condicionada a que el \00EDtem '),
'P3_INDCDOR_IDNTFCCION_ANT = ''S'''))
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31615732688993004)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74321435703173716)
,p_db_column_name=>'ID_SJTO_RSPNSBLE'
,p_display_order=>180
,p_column_identifier=>'P'
,p_column_label=>'Id Sjto Rspnsble'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(76959475997275601)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>190
,p_column_identifier=>'Q'
,p_column_label=>'Matricula Inmobiliaria '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(67292036337147601)
,p_db_column_name=>'DSCRPCION_SJTO_ESTDO'
,p_display_order=>200
,p_column_identifier=>'R'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94611256570345505)
,p_db_column_name=>'DSCRPCION_RSPNSBLE_TPO'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Tipo Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(450028540661672574)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1765910'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'PRNCPAL_S_N:DSCRPCION_RSPNSBLE_TPO:NMBRE_RZON_SCIAL:IDNTFCCION_RSPNSBLE:RZON_SCIAL:IDNTFCCION_SJTO:IDNTFCCION_ANTRIOR:DRCCION:NMBRE_IMPSTO:MTRCLA_INMBLRIA:DSCRPCION_SJTO_ESTDO:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(178770160745720422)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(442400786668252835)
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
 p_id=>wwv_flow_api.id(171623431441492205)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(442400786668252835)
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
 p_id=>wwv_flow_api.id(47251536205112316)
,p_name=>'P3_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47251645942112317)
,p_name=>'P3_NMBRE_ITEM_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47251744749112318)
,p_name=>'P3_NMBRE_ITEM_SBIMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83525095017102902)
,p_name=>'P3_VLDAR_CRTRA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(442402351432252850)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100103810318598001)
,p_name=>'P3_TNE_PRCSO_JRDCO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(442402351432252850)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171620704660492178)
,p_name=>'P3_NMRO_PGNA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171623682975492208)
,p_name=>'P3_NMBRE_ITEM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(171623744550492209)
,p_name=>'P3_NMRO_APP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178770620711720424)
,p_name=>'P3_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_prompt=>'Tributo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178771005091720432)
,p_name=>'P3_IDNTFCCION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_prompt=>unistr('Identificaci\00F3n')
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
 p_id=>wwv_flow_api.id(178771362170720433)
,p_name=>'P3_INDTFCCION_RSPNSBLE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
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
 p_id=>wwv_flow_api.id(178771836566720433)
,p_name=>'P3_NMBRE_RZON_SCIAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
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
 p_id=>wwv_flow_api.id(178772165696720433)
,p_name=>'P3_DRCCION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
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
 p_id=>wwv_flow_api.id(178772613275720433)
,p_name=>'P3_IDNTFCCION_ANTRIOR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_prompt=>unistr('Identificaci\00F3n Anterior')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>38
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_idntfccion_ant ',
'  from df_c_impuestos ',
' where id_impsto = :P3_ID_IMPSTO ',
'   and indcdor_idntfccion_ant = ''S'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178772953229720434)
,p_name=>'P3_CDGO_SJTO_TPO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178773386427720434)
,p_name=>'P3_INDCDOR_IDNTFCCION_ANT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(178773780742720434)
,p_name=>'P3_ID_SJTO_IMPSTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(442400786668252835)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(178774152547720448)
,p_name=>'Set to Upper_Case nombre razon social'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_NMBRE_RZON_SCIAL'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(178774667487720449)
,p_event_id=>wwv_flow_api.id(178774152547720448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_NMBRE_RZON_SCIAL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value.toUpperCase();'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(178775128919720449)
,p_name=>'Set to Upper_Case direccion'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_DRCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(178775597831720450)
,p_event_id=>wwv_flow_api.id(178775128919720449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_DRCCION'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'this.triggeringElement.value.toUpperCase().trim();'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(178775972588720450)
,p_name=>'Calcular Tipo de Sujeto'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_ID_IMPSTO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(178776472473720450)
,p_event_id=>wwv_flow_api.id(178775972588720450)
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
'         where id_impsto = :P3_ID_IMPSTO ',
'           and cdgo_clnte = :F_CDGO_CLNTE;',
'    exception ',
'        when no_data_found then ',
'        v_cdgo_sjto_tpo := -1;',
'        v_indcdor_idntfccion_ant := ''N'';',
'        ',
'    end;',
'    :P3_CDGO_SJTO_TPO := v_cdgo_sjto_tpo;',
'    :P3_INDCDOR_IDNTFCCION_ANT := v_indcdor_idntfccion_ant;',
'',
'end;'))
,p_attribute_02=>'P3_ID_IMPSTO,F_CDGO_CLNTE'
,p_attribute_03=>'P3_CDGO_SJTO_TPO,P3_INDCDOR_IDNTFCCION_ANT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(178777745708720452)
,p_name=>unistr('Al cambiar indicador de identidicacion a S se mostrar \00EDtem identificaci\00F3n anterior')
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_INDCDOR_IDNTFCCION_ANT'
,p_condition_element=>'P3_INDCDOR_IDNTFCCION_ANT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(178778274558720452)
,p_event_id=>wwv_flow_api.id(178777745708720452)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(178778785394720453)
,p_event_id=>wwv_flow_api.id(178777745708720452)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_IDNTFCCION_ANTRIOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(171623513666492206)
,p_name=>'New'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(171623431441492205)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(171623605076492207)
,p_event_id=>wwv_flow_api.id(171623513666492206)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
end;
/
