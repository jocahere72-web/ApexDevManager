prompt --application/pages/page_00122
begin
wwv_flow_api.create_page(
 p_id=>122
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Cuotas por Vencer'
,p_page_mode=>'MODAL'
,p_step_title=>'Cuotas por Vencer'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'LOBREDOR'
,p_last_upd_yyyymmddhh24miss=>'20191016114444'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(85901644832345722)
,p_plug_name=>'Detalle'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md:margin-left-md:margin-right-md'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select c.nmro_cnvnio nmro,',
'        to_char(c.ttal_cnvnio, :F_FRMTO_MNDA) ttal_cnvnio ,',
'        to_char(sum(e.vlor_ttal), :F_FRMTO_MNDA) ttal_cuotas,',
'        c.fcha_slctud, ',
'        c.idntfccion_sjto_frmtda,',
'        c.fcha_mxma_ctas, ',
'        e.fcha_vncmnto, ',
'        c.nmbre_impsto,',
'        c.nmbre_impsto_sbmpsto,',
'        t.dscrpcion tpo,',
'        c.dscrpcion_cnvnio_estdo estdo',
'    from gf_g_convenios_extracto e',
'    join v_gf_g_convenios c on e.id_cnvnio = c.id_cnvnio',
'    join gf_d_convenios_tipo t on c.id_cnvnio_tpo = t.id_cnvnio_tpo',
'   where c.cdgo_clnte = :F_CDGO_CLNTE and trunc(e.fcha_vncmnto) between to_date(:P122_FECHA_INICIAL, ''dd/MM/yyyy'') and to_date(:P122_FECHA_FINAL, ''dd/MM/yyyy'')',
'     --and e.indcdor_cta_pgda = ''N''',
'     and c.cdgo_cnvnio_estdo = ''APL''',
'group by c.nmro_cnvnio, c.vlor_cta_incial, c.ttal_cnvnio,c.fcha_slctud, c.fcha_mxma_ctas, ',
'         c.fcha_rvctoria, e.fcha_vncmnto, c.nmbre_impsto, t.dscrpcion, c.dscrpcion_cnvnio_estdo, c.nmbre_impsto_sbmpsto, c.idntfccion_sjto_frmtda                    ',
'order by e.fcha_vncmnto',
'            '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P122_FECHA_INICIAL,P122_FECHA_FINAL'
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
 p_id=>wwv_flow_api.id(85901781065345723)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LOBREDOR'
,p_internal_uid=>85901781065345723
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85901829643345724)
,p_db_column_name=>'NMRO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero <br> Acuerdo')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85901913570345725)
,p_db_column_name=>'TTAL_CNVNIO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Total <br> Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85902192454345727)
,p_db_column_name=>'TTAL_CUOTAS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Total <br> Cuotas'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85902593600345731)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85902646836345732)
,p_db_column_name=>'TPO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Tipo Acuerdo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85902777577345733)
,p_db_column_name=>'ESTDO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estado '
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3471905010156618)
,p_db_column_name=>'FCHA_SLCTUD'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Fcha Slctud'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472026431156619)
,p_db_column_name=>'FCHA_MXMA_CTAS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Fcha Mxma Ctas'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472102951156620)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Fecha <br>Vencimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472248585156621)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Sub - Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(3472393199156622)
,p_db_column_name=>'IDNTFCCION_SJTO_FRMTDA'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Sujeto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(85971470170663551)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'859715'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:IDNTFCCION_SJTO_FRMTDA:TPO:ESTDO:FCHA_VNCMNTO:TTAL_CUOTAS:TTAL_CNVNIO:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85701263585401937)
,p_name=>'P122_FECHA_INICIAL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(85901644832345722)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85701321810401938)
,p_name=>'P122_FECHA_FINAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(85901644832345722)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
