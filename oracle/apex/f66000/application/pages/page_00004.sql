prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Comparativos Ajustes Modal'
,p_page_mode=>'MODAL'
,p_step_title=>'Comparativos Modal'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'1200'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20191106170229'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96490011009576202)
,p_plug_name=>unistr('Par\00E1metros')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(96490427802576206)
,p_plug_name=>'Ajustes Realizados'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35741315331290409)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   ',
'   select b.ID_AJSTE,',
'       b.numro_ajste,',
'       trim( to_char((a.VLOR_AJSTE),:F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''')) Valor_ajuste,',
'       b.nmbre_impsto,',
'       b.nmro_slctud,',
'       b.idntfccion_sjto,',
'       b.dscrpcion_motivo,',
'      -- b.tpo_ajste,',
'       case',
'			when b.tpo_ajste = ''Debito'' then',
unistr('				''D\00E9bito'''),
'			else',
unistr('				''Cr\00E9dito'''),
'	  end tpo_ajste,',
'       fcha_frmtda,',
'       b.dscrpcion_estado,',
'       a.vgncia,',
'       c.nmbre_trcro   ',
'   from v_gf_g_ajuste_detalle a  ',
'join v_gf_g_ajustes  b on a.id_ajste = b.id_ajste',
' join v_sg_g_usuarios            c on b.id_usrio = c.id_usrio',
'--where a.vgncia between :P4_VIGENCIA_INICIAL and  :P4_VIGENCIA_FINAL',
'where a.vgncia =:P4_VIGENCIA',
'and b.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_impsto            = nvl(:P4_ID_IMPSTO,b.id_impsto)',
'   and b.id_impsto_sbmpsto    = nvl(:P4_ID_IMPSTO_SBMPSTO,b.id_impsto_sbmpsto)',
'   and b.cdgo_ajste_estdo =nvl(:P4_CDGO_AJSTE_ESTDO,''AP'')',
'',
'   and b.cdgo_tpo_ajste =nvl(:P4_CDGO_TPO_AJSTE,b.cdgo_tpo_ajste);',
'   ',
'   '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P4_VIGENCIA_INICIAL,P4_CDGO_TPO_AJSTE,P4_CDGO_AJSTE_ESTDO,P4_USRIO'
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
 p_id=>wwv_flow_api.id(96490530680576207)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'AHERNANDEZ'
,p_internal_uid=>96490530680576207
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96492828874576230)
,p_db_column_name=>'ID_AJSTE'
,p_display_order=>30
,p_column_identifier=>'S'
,p_column_label=>'No Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96493100496576233)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>60
,p_column_identifier=>'V'
,p_column_label=>'Impuesto'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96493272919576234)
,p_db_column_name=>'NMRO_SLCTUD'
,p_display_order=>70
,p_column_identifier=>'W'
,p_column_label=>'Solicitud'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96493310897576235)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>80
,p_column_identifier=>'X'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96493421843576236)
,p_db_column_name=>'DSCRPCION_MOTIVO'
,p_display_order=>90
,p_column_identifier=>'Y'
,p_column_label=>'Motivo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96493555074576237)
,p_db_column_name=>'TPO_AJSTE'
,p_display_order=>100
,p_column_identifier=>'Z'
,p_column_label=>'Tipo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96493626411576238)
,p_db_column_name=>'FCHA_FRMTDA'
,p_display_order=>110
,p_column_identifier=>'AA'
,p_column_label=>'Fecha Movimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96493894343576240)
,p_db_column_name=>'VALOR_AJUSTE'
,p_display_order=>130
,p_column_identifier=>'AC'
,p_column_label=>'Valor Ajuste'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96493900553576241)
,p_db_column_name=>'NMBRE_TRCRO'
,p_display_order=>140
,p_column_identifier=>'AD'
,p_column_label=>'Usuario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96494284357576244)
,p_db_column_name=>'DSCRPCION_ESTADO'
,p_display_order=>150
,p_column_identifier=>'AF'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113824647686014701)
,p_db_column_name=>'NUMRO_AJSTE'
,p_display_order=>160
,p_column_identifier=>'AG'
,p_column_label=>'No. Ajuste'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(113824829157014703)
,p_db_column_name=>'VGNCIA'
,p_display_order=>170
,p_column_identifier=>'AH'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(96578880959049508)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'965789'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NUMRO_AJSTE:NMBRE_IMPSTO:NMRO_SLCTUD:IDNTFCCION_SJTO:DSCRPCION_MOTIVO:TPO_AJSTE:FCHA_FRMTDA:VALOR_AJUSTE:NMBRE_TRCRO:DSCRPCION_ESTADO:VGNCIA:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24477668528711328)
,p_name=>'P4_ID_IMPSTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24477751247711329)
,p_name=>'P4_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96490175784576203)
,p_name=>'P4_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96490208382576204)
,p_name=>'P4_FECHA_FINAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96490366065576205)
,p_name=>'P4_VIGENCIA_INICIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_prompt=>'<b>VIGENCIA INICIAL</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96492240068576224)
,p_name=>'P4_VIGENCIA_FINAL_MES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96492390685576225)
,p_name=>'P4_CDGO_TPO_AJSTE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96494086413576242)
,p_name=>'P4_CDGO_AJSTE_ESTDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113824784905014702)
,p_name=>'P4_VIGENCIA_FINAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_prompt=>'<b>VIGENCIA FINAL</b>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(35793988741290432)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(113824904227014704)
,p_name=>'P4_VIGENCIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(96490011009576202)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
