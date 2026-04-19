prompt --application/pages/page_00386
begin
wwv_flow_api.create_page(
 p_id=>386
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Consulta Cartera por Responsable'
,p_page_mode=>'MODAL'
,p_step_title=>'Sujetos con Cartera por Responsable'
,p_autocomplete_on_off=>'OFF'
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
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'70%'
,p_last_updated_by=>'1111111112'
,p_last_upd_yyyymmddhh24miss=>'20230804101533'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(328139612369261961)
,p_plug_name=>'Gestion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from ( ',
'select 	a.idntfccion_rspnsble , ',
'        a.nmbre_rzon_scial, ',
'        a.idntfccion_sjto , ',
'        a.id_sjto_impsto,         ',
'        b.id_impsto, ',
'        sum(vlor_sldo_cptal) capital, ',
'        sum(vlor_intres) interes,  ',
'        sum(vlor_sldo_cptal + vlor_intres) total ,',
'        listagg(b.vgncia, '', '') within group(order by b.vgncia) as vgncias',
'from 	v_si_i_sujetos_responsable  a',
'join    v_gf_g_cartera_x_vigencia   b on a.id_sjto_impsto = b.id_sjto_impsto ',
'                                     and vlor_sldo_cptal > 0',
'where 	a.idntfccion_rspnsble  = :P386_IDNTFCCION_RSPNSBLE',
'group by a.idntfccion_rspnsble , a.nmbre_rzon_scial, a.idntfccion_sjto , a.id_sjto_impsto , b.id_impsto',
'order by a.idntfccion_sjto',
')',
'where id_sjto_impsto != :P386_ID_SJTO_IMPSTO'))
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
 p_id=>wwv_flow_api.id(134916316890015506)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&P386_NMRO_APP.:&P386_NMRO_PGNA.:&SESSION.:PRMTRO_BSQDA:&DEBUG.:RP:&P386_NMBRE_ITEM.,&P386_NMBRE_ITEM_IMPSTO.,&P386_NMBRE_ITEM_SBIMPSTO.:#ID_SJTO_IMPSTO#,#ID_IMPSTO#,&P386_IMPSTO_SBMPSTO.'
,p_detail_link_text=>'<span aria-hidden="true" class="fa fa-check-square-o"></span>'
,p_detail_link_attr=>'style="color:align:center"'
,p_owner=>'NCARRASQUILLA'
,p_internal_uid=>134916316890015506
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134916459412015507)
,p_db_column_name=>'IDNTFCCION_RSPNSBLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('Identificaci\00F3n Responsable')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134916596645015508)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre Responsable'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134916685396015509)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Identificaci\00F3n Sujeto')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134916782645015510)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134932853507537602)
,p_db_column_name=>'CAPITAL'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134916978476015512)
,p_db_column_name=>'INTERES'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134917058426015513)
,p_db_column_name=>'TOTAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134917125676015514)
,p_db_column_name=>'VGNCIAS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Vigencias'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(134917273683015515)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(134929265759193539)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1349293'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'IDNTFCCION_RSPNSBLE:NMBRE_RZON_SCIAL:IDNTFCCION_SJTO:CAPITAL:INTERES:TOTAL:VGNCIAS:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134599361228485809)
,p_name=>'P386_IDNTFCCION_RSPNSBLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134600508547485821)
,p_name=>'P386_NMBRE_RSPNSBLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134915858528015501)
,p_name=>'P386_NMRO_APP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134915971099015502)
,p_name=>'P386_NMRO_PGNA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134916024923015503)
,p_name=>'P386_NMBRE_ITEM'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134916159826015504)
,p_name=>'P386_NMBRE_ITEM_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134916253961015505)
,p_name=>'P386_NMBRE_ITEM_SBIMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134917337244015516)
,p_name=>'P386_IMPSTO_SBMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(134932963397537603)
,p_name=>'P386_ID_SJTO_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(328139612369261961)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
