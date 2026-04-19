prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>unistr('Saldo a Favor - Compensaci\00F3n ')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Compensaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'1111111112'
,p_last_upd_yyyymmddhh24miss=>'20230810105525'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25054077518296226)
,p_plug_name=>unistr('Compensaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto   as  "Impuesto",',
'       to_char(a.vlor_sldo_fvor, :F_FRMTO_MNDA) as "Valor Saldo a Favor",',
unistr('       to_char(b.vlor_cmpnscion, :F_FRMTO_MNDA) as "Valor Compensaci\00F3n",'),
'       b.vgncia         as  "Vigencia",',
'       e.prdo           as  "Periodo",',
'       d.dscrpcion      as  "Concepto",',
unistr('       f.idntfccion_sjto as "Identificaci\00F3n"'),
'from v_gf_g_saldos_favor a',
'join gf_g_sldos_fvr_cmpnscn_dtll  b on a.id_sldo_fvor         = b.id_sldo_fvor',
'join gf_g_saldos_favor_cmpnscion  c on b.id_sld_fvr_cmpnscion = c.id_sld_fvr_cmpnscion',
'join df_i_conceptos               d on b.id_cncpto            = d.id_cncpto',
'join df_i_periodos                e on b.id_prdo              = e.id_prdo',
'join v_si_i_sujetos_impuesto      f on b.id_sjto_impsto = f.id_sjto_impsto',
'where c.id_sldo_fvor_slctud = :P23_ID_SLDO_FVOR_SLCTUD'))
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
 p_id=>wwv_flow_api.id(25054166926296227)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>25054166926296227
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25054203014296228)
,p_db_column_name=>'Impuesto'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25054584094296231)
,p_db_column_name=>'Vigencia'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25054654124296232)
,p_db_column_name=>'Periodo'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25054700336296233)
,p_db_column_name=>'Concepto'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25054358704296229)
,p_db_column_name=>'Valor Saldo a Favor'
,p_display_order=>70
,p_column_identifier=>'B'
,p_column_label=>'Valor Saldo A Favor'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25054415482296230)
,p_db_column_name=>unistr('Valor Compensaci\00F3n')
,p_display_order=>80
,p_column_identifier=>'C'
,p_column_label=>unistr('Valor Compensaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(135410404252473301)
,p_db_column_name=>unistr('Identificaci\00F3n')
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25157992371739076)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'251580'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('Impuesto:Identificaci\00F3n:Vigencia:Periodo:Concepto:Valor Saldo a Favor:Valor Compensaci\00F3n:')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25054857798296234)
,p_name=>'P23_ID_SLDO_FVOR_SLCTUD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(25054077518296226)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
