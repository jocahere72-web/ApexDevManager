prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Consulta Recaudo'
,p_step_title=>'Consulta Recaudo'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-body>p {',
'    background-color: #fff;',
'    border: 1px solid rgba(0, 0, 0, .1);',
'    color: rgba(255, 0, 0, 0.89);',
'    padding: 1rem;',
'    text-align: center;',
'}',
'',
'.table-inf {',
'    margin-left: 10px;',
'}',
'',
'.table-inf td {',
'    font-size: 14px;',
'    text-align: left;',
'}',
'',
'.table-inf td:nth-child(odd) {',
'    font-weight: 700;',
'}',
'',
'.table-inf td:nth-child(3) {',
'    padding-left: 20rem;',
'}',
'',
'.table-inf td:nth-child(odd)::after {',
'    content: '':''',
'}',
'',
'.table-inf td:nth-child(even) {',
'    padding-left: 5px;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200827103446'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80579174434405808)
,p_plug_name=>'Registros de Pagos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80579205915405809)
,p_plug_name=>'Recaudos'
,p_parent_plug_id=>wwv_flow_api.id(80579174434405808)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select  a."N\00B0 Documento",'),
'        a."Tipo de Documento", ',
'        a."Fecha de Pago", ',
'        a."Valor Pago", ',
'        a."Estado", ',
'        a."Identificacion",',
'        a."Tributo",',
'        a.id_rcdo',
'from (',
unistr('    select a.nmro_dcmnto as "N\00B0 Documento"'),
'         , a.dscrpcion_rcdo_orgn_tpo as "Tipo de Documento"',
'         , to_char( a.fcha_rcdo , ''DD/MM/YYYY'' ) as "Fecha de Pago"',
'         , to_char(a.vlor, ''FM$999G999G999G999G999G999G990'') as "Valor Pago"',
'         , to_char( a.fcha_apliccion , ''DD/MM/YYYY'' ) as "Fecha de Aplicacion"',
'         , a.obsrvcion as "Observacion"',
'         , a.dscrpcion_rcdo_estdo as "Estado"',
'         , a.id_rcdo',
'         , case when a.cdgo_rcdo_orgn_tpo = ''DC'' then',
'                 ( select d.fcha_vncmnto from re_g_documentos d where d.id_dcmnto = a.id_orgen )',
'                when a.cdgo_rcdo_orgn_tpo = ''DL'' then',
'                 ( select d.fcha_prsntcion_pryctda from gi_g_declaraciones d where d.id_dclrcion = a.id_orgen )',
'           end as fcha_vncmnto',
'         , a.fcha_rcdo',
'         , c.idntfccion_sjto as "Identificacion"',
'         , d.nmbre_impsto as "Tributo"',
'       from v_re_g_recaudos a',
'       join sg_g_usrios_sjto_impsto b on a.id_sjto_impsto = b.id_sjto_impsto',
'       join v_si_i_sujetos_impuesto c on b.id_sjto_impsto = c.id_sjto_impsto',
'       join df_c_impuestos d on a.id_impsto = d.id_impsto',
'       where b.id_usrio  = :F_ID_USRIO',
'       and a.id_impsto = nvl(:P24_ID_IMPSTO, a.id_impsto)',
'       and a.id_impsto_sbmpsto = nvl(:P24_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'       and c.idntfccion_sjto = nvl(:P24_IDNTFCCION_SJTO, c.idntfccion_sjto)',
'       and a.cdgo_rcdo_estdo in ( ''AP'' , ''RG'' )',
'       order by c.idntfccion_sjto',
'              , d.id_impsto',
') a;'))
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
 p_id=>wwv_flow_api.id(80579600519405813)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP,29:P29_ID_RCDO:#ID_RCDO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'LTORRES'
,p_internal_uid=>80579600519405813
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80579711545405814)
,p_db_column_name=>unistr('N\00B0 Documento')
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00B0 Documento')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80580346654405820)
,p_db_column_name=>'Estado'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80580417675405821)
,p_db_column_name=>'ID_RCDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Id Rcdo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80580727430405824)
,p_db_column_name=>'Tipo de Documento'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Tipo De Documento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80580984841405826)
,p_db_column_name=>'Tributo'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80581023761405827)
,p_db_column_name=>'Fecha de Pago'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'Fecha De Pago'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80581295388405829)
,p_db_column_name=>'Identificacion'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Identificacion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80581382305405830)
,p_db_column_name=>'Valor Pago'
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>'Valor Pago'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(87659426473869163)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'876595'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Identificacion:Tributo:Tipo de Documento:N\00B0 Documento:Fecha de Pago:Estado:Valor Pago:')
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(80583160588405848)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(80579174434405808)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-table-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(83694889580840846)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(80579174434405808)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1:P1_CDGO_CLNTE:&F_CDGO_CLNTE.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80579478135405811)
,p_name=>'P24_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(80579174434405808)
,p_prompt=>'SubTributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto_sbmpsto as d,',
'       a.id_impsto_sbmpsto as r',
'from df_i_impuestos_subimpuesto a',
'where a.id_impsto= :P24_ID_IMPSTO;'))
,p_lov_cascade_parent_items=>'P24_ID_IMPSTO'
,p_ajax_items_to_submit=>'P24_ID_IMPSTO_SBMPSTO,P24_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80579505645405812)
,p_name=>'P24_IDNTFCCION_SJTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(80579174434405808)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80583093022405847)
,p_name=>'P24_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80579174434405808)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmbre_impsto,',
'       c.id_impsto',
'from sg_g_usrios_sjto_impsto a',
'join si_i_sujetos_impuesto b on a.id_sjto_impsto = b.id_sjto_impsto',
'join df_c_impuestos c on b.id_impsto = c.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'group by c.nmbre_impsto,',
'         c.id_impsto;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
end;
/
