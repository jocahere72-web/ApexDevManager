prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Cartera Conceptos'
,p_page_mode=>'MODAL'
,p_step_title=>'Cartera Conceptos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191218081923'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24670564135198718)
,p_plug_name=>'Conceptos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.vgncia,',
'        a.prdo,',
'        a.cdgo_cncpto,',
'        a.dscrpcion_cncpto,',
'        to_char(a.fcha_vncmnto,''DD/MM/YYYY'') fcha_vncmnto,',
'        a.dscrpcion_mvnt_fncro_estdo,',
'        a.vlor_sldo_cptal,',
'        a.vlor_intres,',
'        (a.vlor_sldo_cptal + a.vlor_intres) vlor_sldo_ttal',
'  from v_gf_g_cartera_x_concepto a',
' where cdgo_clnte          = :F_CDGO_CLNTE ',
'   and id_sjto_impsto      = :P12_ID_SJTO_IMPSTO',
'   and vgncia              = :P12_VGNCIA',
'   and prdo                = :P12_PRDO',
'   and id_orgen            = :P12_ID_ORGEN'))
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
 p_id=>wwv_flow_api.id(24671213509198725)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>24671213509198725
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24671397463198726)
,p_db_column_name=>'VGNCIA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24671413456198727)
,p_db_column_name=>'PRDO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24671554225198728)
,p_db_column_name=>'CDGO_CNCPTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('C\00F3digo Concepto')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24671602157198729)
,p_db_column_name=>'DSCRPCION_CNCPTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Concepto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24671722855198730)
,p_db_column_name=>'FCHA_VNCMNTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha Vencimiento'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24671800486198731)
,p_db_column_name=>'DSCRPCION_MVNT_FNCRO_ESTDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Estado Movimiento Financiero'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24671909606198732)
,p_db_column_name=>'VLOR_SLDO_CPTAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Valor Saldo Capital'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24672043109198733)
,p_db_column_name=>'VLOR_INTRES'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Valor Inter\00E9s')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24672175586198734)
,p_db_column_name=>'VLOR_SLDO_TTAL'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Valor Saldo Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24812698623497981)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'248127'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'VGNCIA:PRDO:CDGO_CNCPTO:DSCRPCION_CNCPTO:FCHA_VNCMNTO:DSCRPCION_MVNT_FNCRO_ESTDO:VLOR_SLDO_CPTAL:VLOR_INTRES:VLOR_SLDO_TTAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24670700353198720)
,p_name=>'P12_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(24670564135198718)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24670840241198721)
,p_name=>'P12_FCHA_VNCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(24670564135198718)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24670903451198722)
,p_name=>'P12_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(24670564135198718)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24671021961198723)
,p_name=>'P12_PRDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(24670564135198718)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(48994085387511004)
,p_name=>'P12_ID_ORGEN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(24670564135198718)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
