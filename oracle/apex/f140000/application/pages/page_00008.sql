prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Ajuste'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Ajuste'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20241016144458'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24534761368846434)
,p_plug_name=>'Ajustes'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ajste,',
'       a.id_instncia_fljo,',
'       a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'       to_char( a.fcha, ''DD/MM/YYYY HH12:MI:SS AM'')  fecha,',
'       a.numro_ajste,',
'       a.nmro_slctud,',
'       a.tpo_ajste,',
'       a.dscrpcion_estado,',
'       to_char(a.vlor + a.vlor_intres, :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''') vlor_ajste',
'  from v_gf_g_ajustes a',
' where a.id_sjto_impsto = :P8_ID_SJTO_IMPSTO ',
' and a.cdgo_ajste_estdo IN (''AP'',''RG'',''A'',''NAP'')',
' order by a.id_ajste desc',
' ',
'',
' ',
' '))
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
 p_id=>wwv_flow_api.id(24534873753846435)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=71000:197:&SESSION.::&DEBUG.:RP,197:P197_ID_AJSTE,P197_NUMRO_AJSTE,P197_ID_INSTNCIA_FLJO:#ID_AJSTE#,#NUMRO_AJSTE#,#ID_INSTNCIA_FLJO#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>24534873753846435
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24534915214846436)
,p_db_column_name=>'ID_AJSTE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Ajste'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535017611846437)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Instncia Fljo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535141604846438)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535254154846439)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sub Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535384091846440)
,p_db_column_name=>'FECHA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535457722846441)
,p_db_column_name=>'NUMRO_AJSTE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'No. Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535598914846442)
,p_db_column_name=>'NMRO_SLCTUD'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'No. Solicitud'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535643855846443)
,p_db_column_name=>'TPO_AJSTE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tipo de Ajuste'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535781919846444)
,p_db_column_name=>'DSCRPCION_ESTADO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24535895147846445)
,p_db_column_name=>'VLOR_AJSTE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Valor Ajuste'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24647368861081418)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'246474'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_AJSTE:ID_INSTNCIA_FLJO:NMBRE_IMPSTO:NMBRE_IMPSTO_SBMPSTO:FECHA:NUMRO_AJSTE:NMRO_SLCTUD:TPO_AJSTE:DSCRPCION_ESTADO:VLOR_AJSTE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97170910067591069)
,p_plug_name=>'&P8_DSCRPCION.'
,p_icon_css_classes=>'&P8_ICNO.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52124852663074800)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24619620347052684)
,p_name=>'P8_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(97170910067591069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24620079608052684)
,p_name=>'P8_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(97170910067591069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24620417651052684)
,p_name=>'P8_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(97170910067591069)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
