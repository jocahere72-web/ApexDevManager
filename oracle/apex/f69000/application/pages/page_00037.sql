prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Consulta de Resoluci\00F3n')
,p_step_title=>unistr('Consulta de Resoluci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'ocultarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-noDataMsg {',
'    padding: 0;',
'}'))
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20260226095654'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72114563443007934)
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
 p_id=>wwv_flow_api.id(72114627939007935)
,p_plug_name=>unistr('Informe Consulta de Resoluci\00F3n ')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.rslcion',
'        , a.rdccion',
'        , a.tpo_trmte',
'        , a.clse_mtcion',
'        , a.rfrncia_igac',
'        , a.cncla_inscrbe',
'        , a.nmro_orden',
'        , a.ttal_rgstro',
'        , a.tpo_dcmnto',
'        , a.nmro_dcmnto',
'        , a.nmbre_prptrio',
'        , a.drccion',
'        , (select t.nmbre_dstno_igac from df_s_destinos_igac t where t.cdgo_dstno_igac =  a.dstno_ecnmco) cdgo_dstno_igac',
'        , a.area_trrno',
'        , a.area_cnstrda',
'        , a.avluo_ctstral',
'        , a.vgncia_igac',
'        , r.fcha_aplccion',
unistr('        , decode( a.aplcda , ''N'' , ''No'' , ''S\00ED'' ) as aplcda'),
'        , decode( a.cncla_inscrbe , ''I'' , ''<span aria-hidden="true" class="fa fa-eye" style="font-size: 20px;"></span>'' ) as link',
'        , case when a.cncla_inscrbe = ''I'' and h.rslcion is not null then (''<span aria-hidden="true" class="fa fa-eye" style="font-size: 20px;"></span>'' ) end as ver_adjunto -- REQ0028766',
'        , h.id_rsl_adjnto -- REQ0028766',
'     from si_g_resolucion_igac_t1 a',
'     left join si_g_resolucion_aplicada r on r.id_rslcion_aplcda = a.id_rslcion_aplcda',
'     left join v_si_g_resolucion_ctstopro_dtlle h on h.rdccion = a.rdccion and h.rslcion = a.rslcion--a.id_rslcion_igac_t1 = h.id_rslcion_igac_t1 -- -- REQ0028766',
'    where a.id_prcso_crga in (',
'                                 select b.id_prcso_crga',
'                                   from et_g_procesos_carga b',
'                                  where b.id_prcso_crga = a.id_prcso_crga',
'                                    and b.cdgo_clnte    = :F_CDGO_CLNTE',
'                             )',
'      and a.rslcion      = nvl( :P37_RSLCION , a.rslcion ) ',
'      and a.rdccion      = nvl( :P37_RDCCION , a.rdccion )',
'      and a.rfrncia_igac = nvl( :P37_IDNTFCCION , a.rfrncia_igac )',
' order by a.rslcion',
'        , a.rdccion',
'        , a.cncla_inscrbe',
'        , a.rfrncia_igac',
'        , a.nmro_orden'))
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
 p_id=>wwv_flow_api.id(72114748865007936)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP,26:P26_RFRNCIA_IGAC,P26_ID_IMPSTO,P26_ID_IMPSTO_SBMPSTO,P26_RSLCION,P26_RDCCION:#RFRNCIA_IGAC#,&P37_ID_IMPSTO.,&P37_ID_IMPSTO_SBMPSTO.,#RSLCION#,#RDCCION#'
,p_detail_link_text=>'#LINK#'
,p_detail_link_attr=>'title="Ver"'
,p_owner=>'NARDILA'
,p_internal_uid=>72114748865007936
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72114866672007937)
,p_db_column_name=>'RSLCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Resoluci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72114963033007938)
,p_db_column_name=>'RDCCION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>unistr('Radicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115091601007939)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115118817007940)
,p_db_column_name=>'CNCLA_INSCRBE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'C/I'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115223284007941)
,p_db_column_name=>'NMRO_ORDEN'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Orden'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115358178007942)
,p_db_column_name=>'TTAL_RGSTRO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Total Registro'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115463542007943)
,p_db_column_name=>'TPO_DCMNTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Tipo de Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115570820007944)
,p_db_column_name=>'NMRO_DCMNTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Identificaci\00F3n Propietario')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115662296007945)
,p_db_column_name=>'NMBRE_PRPTRIO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Propietario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115715379007946)
,p_db_column_name=>'DRCCION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72115901336007948)
,p_db_column_name=>'AREA_TRRNO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('\00C1rea Terreno')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72116085910007949)
,p_db_column_name=>'AREA_CNSTRDA'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('\00C1rea Construida')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(72116185971007950)
,p_db_column_name=>'AVLUO_CTSTRAL'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Avalu\00F3')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74146549125606901)
,p_db_column_name=>'VGNCIA_IGAC'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Vigencia Igac'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74146690271606902)
,p_db_column_name=>'APLCDA'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('\00BFAplicada?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(91565160678444701)
,p_db_column_name=>'FCHA_APLCCION'
,p_display_order=>170
,p_column_identifier=>'V'
,p_column_label=>'Fecha'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74148362526606919)
,p_db_column_name=>'CLSE_MTCION'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>unistr('Clase de Mutaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(89494709908470580)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74148482892606920)
,p_db_column_name=>'TPO_TRMTE'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'Tipo Tramite'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(89151809889991326)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(74447359243817921)
,p_db_column_name=>'LINK'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89953588624968610)
,p_db_column_name=>'CDGO_DSTNO_IGAC'
,p_display_order=>210
,p_column_identifier=>'W'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17091733294983904)
,p_db_column_name=>'VER_ADJUNTO'
,p_display_order=>220
,p_column_identifier=>'X'
,p_column_label=>'Ver Adjunto'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_CLAVE_PRIMARIA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_BFILE,P127_VALOR:SI_G_RESOLUCIONES_ADJUNTO,ID_RSL_ADJNTO,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,FILE_B'
||'FILE,#ID_RSL_ADJNTO#'
,p_column_linktext=>'#VER_ADJUNTO#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17091867419983905)
,p_db_column_name=>'ID_RSL_ADJNTO'
,p_display_order=>230
,p_column_identifier=>'Y'
,p_column_label=>'Id Rsl Adjnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(74156560542608403)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'741566'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RSLCION:RDCCION:TPO_TRMTE:CLSE_MTCION:RFRNCIA_IGAC:CNCLA_INSCRBE:NMRO_ORDEN:TTAL_RGSTRO:TPO_DCMNTO:NMRO_DCMNTO:NMBRE_PRPTRIO:DRCCION:AREA_TRRNO:AREA_CNSTRDA:AVLUO_CTSTRAL:VGNCIA_IGAC:APLCDA::LINK:FCHA_APLCCION:CDGO_DSTNO_IGAC:VER_ADJUNTO:ID_RSL_ADJNT'
||'O'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(74710266324109814)
,p_report_id=>wwv_flow_api.id(74156560542608403)
,p_name=>'Inscribe'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CNCLA_INSCRBE'
,p_operator=>'='
,p_expr=>'I'
,p_condition_sql=>' (case when ("CNCLA_INSCRBE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''I''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#99FF99'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(74710674810109815)
,p_report_id=>wwv_flow_api.id(74156560542608403)
,p_name=>'Cancela'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'CNCLA_INSCRBE'
,p_operator=>'='
,p_expr=>'C'
,p_condition_sql=>' (case when ("CNCLA_INSCRBE" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''C''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#FF7755'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(213333730313521932)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>30
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
'    Funcionalidad que permite consultar las resoluciones igac registrada y aplicada.',
'    <br><br>',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(74147075880606906)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(72114563443007934)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74146750932606903)
,p_name=>'P37_RSLCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72114563443007934)
,p_prompt=>unistr('Resoluci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Resoluci\00F3n')
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
 p_id=>wwv_flow_api.id(74146812709606904)
,p_name=>'P37_RDCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(72114563443007934)
,p_prompt=>unistr('Radicaci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Radicaci\00F3n')
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
 p_id=>wwv_flow_api.id(74146924017606905)
,p_name=>'P37_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(72114563443007934)
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
 p_id=>wwv_flow_api.id(74447138352817919)
,p_name=>'P37_ID_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(72114563443007934)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(74447275395817920)
,p_name=>'P37_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(72114563443007934)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74147142077606907)
,p_name=>'Al Dar Doble Click Resolucion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_RSLCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74147215219606908)
,p_event_id=>wwv_flow_api.id(74147142077606907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P37_RSLCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74147586465606911)
,p_name=>'Al Dar Doble Click Radicacion'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_RDCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74147753661606913)
,p_event_id=>wwv_flow_api.id(74147586465606911)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P37_RDCCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74147855987606914)
,p_name=>'Al Dar Doble Click Identificacion'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'dblclick'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74148015610606916)
,p_event_id=>wwv_flow_api.id(74147855987606914)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P37_IDNTFCCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(74447040290817918)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Busca los Datos del Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.id_impsto',
'         , a.id_impsto_sbmpsto',
'      into :P37_ID_IMPSTO',
'         , :P37_ID_IMPSTO_SBMPSTO',
'      from df_i_impuestos_subimpuesto a',
'     where a.cdgo_clnte          = :F_CDGO_CLNTE',
'       and a.cdgo_impsto_sbmpsto = ''IPU'';',
'exception',
'     when others then ',
'          null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P37_ID_IMPSTO_SBMPSTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
