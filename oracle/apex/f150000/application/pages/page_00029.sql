prompt --application/pages/page_00029
begin
wwv_flow_api.create_page(
 p_id=>29
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Detalle del Pago'
,p_page_mode=>'MODAL'
,p_step_title=>'Detalle del Pago'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'LTORRES'
,p_last_upd_yyyymmddhh24miss=>'20200827083107'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(80581441122405831)
,p_plug_name=>'Detalle del Pago'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.vgncia as "Vigencia"',
'      , a.prdo as "Periodo"',
'      , initcap(a.dscrpcion_cncpto) as "Concepto"',
'      , to_char(a.vlor_cptal, ''FM$999G999G999G999G999G999G990'')     as "Valor Capital"',
'      , to_char(a.vlor_intres, ''FM$999G999G999G999G999G999G990'')    as "Valor Interes"',
'      , to_char(a.vlor_sldo_fvor, ''FM$999G999G999G999G999G999G990'') as "Valor Saldo a Favor"',
'      , to_char(a.vlor_ttal, ''FM$999G999G999G999G999G999G990'')    as "Valor Total"',
'   from v_re_g_recaudos_detalle a',
'  where a.id_rcdo = :P29_ID_RCDO;'))
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
 p_id=>wwv_flow_api.id(80581559633405832)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'LTORRES'
,p_internal_uid=>80581559633405832
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80581613916405833)
,p_db_column_name=>'Vigencia'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80581743205405834)
,p_db_column_name=>'Periodo'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80581941254405836)
,p_db_column_name=>'Concepto'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80582538766405842)
,p_db_column_name=>'Valor Capital'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'Valor Capital'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80582683690405843)
,p_db_column_name=>'Valor Interes'
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>'Valor Interes'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80582746751405844)
,p_db_column_name=>'Valor Saldo a Favor'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Valor Saldo A Favor'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(80582895581405845)
,p_db_column_name=>'Valor Total'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Valor Total'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(87701517107264274)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'877016'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Vigencia:Periodo:Concepto:Valor Capital:Valor Interes:Valor Saldo a Favor:Valor Total'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(80582470526405841)
,p_name=>'P29_ID_RCDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(80581441122405831)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
