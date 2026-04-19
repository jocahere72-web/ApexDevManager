prompt --application/pages/page_00024
begin
wwv_flow_api.create_page(
 p_id=>24
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>unistr('Devoluci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Devoluci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20191017115929'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25054945926296235)
,p_plug_name=>unistr('Devoluci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto   as  "Impuesto",',
unistr('       to_char(b.vlor_dvlcion, :F_FRMTO_MNDA)   as  "Valor de la Devoluci\00F3n",'),
'       d.nmbre_bnco     as  "Banco",',
'       c.nmro_cnta      as  "Numero Cuenta"',
'from v_gf_g_saldos_favor a',
'join gf_g_sldos_fvr_dvlcion_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_devlucion  c on b.id_sldo_fvor_dvlcion = c.id_sldo_fvor_dvlcion',
'join df_c_bancos                  d on c.id_bnco              = d.id_bnco',
'join v_si_i_sujetos_impuesto      f on a.id_sjto_impsto       = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud =    :P24_ID_SLDO_FVOR_SLCTUD'))
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
 p_id=>wwv_flow_api.id(25055000477296236)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>25055000477296236
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25055184637296237)
,p_db_column_name=>'Impuesto'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25055496457296240)
,p_db_column_name=>'Numero Cuenta'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Numero Cuenta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25055252819296238)
,p_db_column_name=>unistr('Valor de la Devoluci\00F3n')
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>unistr('Valor De La Devoluci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25055363415296239)
,p_db_column_name=>'Banco'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Banco'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25158537334739445)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'251586'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Impuesto:Numero Cuenta:Valor de la Devoluci\00F3n:Banco')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25055534466296241)
,p_name=>'P24_ID_SLDO_FVOR_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25054945926296235)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
