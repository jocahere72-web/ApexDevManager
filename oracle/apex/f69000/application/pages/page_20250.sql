prompt --application/pages/page_20250
begin
wwv_flow_api.create_page(
 p_id=>2025004
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Gesti\00F3n Resoluciones a Aprobar')
,p_step_title=>unistr('Gesti\00F3n Resoluciones a Aprobar')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20251218175101'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20607280539978370)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88184817099296363)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88184881595296364)
,p_plug_name=>'Informe Resoluciones por Aprobar'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select 	a.rslcion',
'        , a.rdccion',
'        , a.tpo_trmte',
'        , a.clse_mtcion',
unistr('        , decode( a.aplcda , ''N'' , ''No'' , ''R'', ''Aplicada'',''S\00ED'' ) as aplcda'),
'        , decode( a.cncla_inscrbe , ''I'' , ''<span aria-hidden="true" class="fa fa-eye" style="font-size: 20px;"></span>'' ) as link',
'from 	si_g_resolucion_igac_t1 a',
'left 	join si_g_resolucion_aplicada r on r.id_rslcion_aplcda = a.id_rslcion_aplcda',
'where 	a.id_prcso_crga in (',
'                            select 	b.id_prcso_crga',
'                            from 	et_g_procesos_carga b',
'                            where 	b.id_prcso_crga = a.id_prcso_crga',
'                            and 	b.cdgo_clnte    = :F_CDGO_CLNTE',
'                            )',
'--and     ( ( a.id_usrio_rlqda = :F_ID_USRIO and a.aplcda = ''R'' ) or ( r.id_usrio = :F_ID_USRIO and a.aplcda = ''S'' )  )',
'and 	a.rslcion      = nvl( :P2025004_RSLCION , a.rslcion ) ',
'and 	a.rdccion      = nvl( :P2025004_RDCCION , a.rdccion )',
'and 	a.rfrncia_igac = nvl( :P2025004_IDNTFCCION , a.rfrncia_igac )',
'--and     a.aplcda in (''R'',''S'')',
'and     a.cncla_inscrbe  =''I''',
'group by a.rslcion',
'        , a.rdccion',
'        , a.tpo_trmte',
'        , a.clse_mtcion , a.aplcda , a.cncla_inscrbe)',
'order by  rslcion',
'        , rdccion',
'        '))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_api.id(88185002521296365)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:2025005:&SESSION.::&DEBUG.:RP,2025005:P2025005_ID_IMPSTO,P2025005_ID_IMPSTO_SBMPSTO,P2025005_RSLCION,P2025005_RDCCION:&P2025004_ID_IMPSTO.,&P2025004_ID_IMPSTO_SBMPSTO.,#RSLCION#,#RDCCION#'
,p_detail_link_text=>'#LINK#'
,p_detail_link_attr=>'title="Ver"'
,p_owner=>'NARDILA'
,p_internal_uid=>88185002521296365
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16073507306288435)
,p_db_column_name=>'RSLCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Resoluci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16073926325288436)
,p_db_column_name=>'RDCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Radicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16079573393288440)
,p_db_column_name=>'APLCDA'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFAprobada?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16079956593288440)
,p_db_column_name=>'CLSE_MTCION'
,p_display_order=>170
,p_column_identifier=>'S'
,p_column_label=>unistr('Clase de Mutaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(89494709908470580)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16080319044288440)
,p_db_column_name=>'TPO_TRMTE'
,p_display_order=>180
,p_column_identifier=>'T'
,p_column_label=>'Tipo Tramite'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(89151809889991326)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(16080752915288441)
,p_db_column_name=>'LINK'
,p_display_order=>190
,p_column_identifier=>'U'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(90226814198896832)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'160811'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RSLCION:RDCCION:TPO_TRMTE:CLSE_MTCION:APLCDA::LINK'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(229403983969810361)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <i>',
'        <b> ',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>  ',
'        </b>',
'    </i>',
'</h5>',
'<i>',
'    Funcionalidad que permite consultar y gestionar las resoluciones igac pendientes por Aprobar.',
'    <br><br>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10623098199158943)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(20607280539978370)
,p_button_name=>'BTN_APLCA_RSLCION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aprobar Resoluci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'F_ID_USRIO'
,p_button_condition2=>'238238'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10413346060494335)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(20607280539978370)
,p_button_name=>'BTN_RSLCION_RVRSDA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_image_alt=>'Resoluciones Reversadas'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'F_ID_USRIO'
,p_button_condition2=>'238238'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16070802434288430)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(88184817099296363)
,p_button_name=>'Btn_Consultar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10414441134494346)
,p_branch_name=>'Ir a 25'
,p_branch_action=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP,25::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(10623098199158943)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10414385924494345)
,p_branch_name=>'Ir a 82'
,p_branch_action=>'f?p=&APP_ID.:82:&SESSION.::&DEBUG.:RP,82::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(10413346060494335)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16071288027288430)
,p_name=>'P2025004_RSLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(88184817099296363)
,p_prompt=>unistr('Resoluci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Radicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>13
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16071616527288430)
,p_name=>'P2025004_RDCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(88184817099296363)
,p_prompt=>unistr('Radicaci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Resoluci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16072078422288430)
,p_name=>'P2025004_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(88184817099296363)
,p_prompt=>unistr('Identificaci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Identificaci\00F3n ')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16072459537288431)
,p_name=>'P2025004_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(88184817099296363)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16072866381288431)
,p_name=>'P2025004_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(88184817099296363)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16083026692288446)
,p_name=>'Al Dar Doble Click Resolucion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025004_RSLCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16083505624288447)
,p_event_id=>wwv_flow_api.id(16083026692288446)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2025004_RSLCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16083915817288448)
,p_name=>'Al Dar Doble Click Radicacion'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025004_RDCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16084488017288448)
,p_event_id=>wwv_flow_api.id(16083915817288448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2025004_RDCCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(16084877961288448)
,p_name=>'Al Dar Doble Click Identificacion'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2025004_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(16085309800288449)
,p_event_id=>wwv_flow_api.id(16084877961288448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2025004_IDNTFCCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16082668879288446)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Busca los Datos del Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_impsto',
'         , a.id_impsto_sbmpsto',
'      into :P2025004_ID_IMPSTO',
'         , :P2025004_ID_IMPSTO_SBMPSTO',
'      from df_i_impuestos_subimpuesto a',
'     where a.cdgo_clnte          = :F_CDGO_CLNTE',
'       and a.cdgo_impsto_sbmpsto = ''IPU'';',
'exception',
'     when others then ',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2025004_ID_IMPSTO_SBMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
