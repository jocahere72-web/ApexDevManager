prompt --application/pages/page_00022
begin
wwv_flow_api.create_page(
 p_id=>22
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Saldo a Favor'
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Saldo a Favor'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1024'
,p_dialog_max_width=>'1024'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20230717081029'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(25052991397296215)
,p_plug_name=>'Saldo a Favor'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto as "Impuesto",',
'       a.nmbre_impsto_sbmpsto as "Sub-Impuesto",',
'       a.nmbre_sldo_fvor_tpo as "Tipo de Saldo a Favor",',
'       to_char(a.vlor_sldo_fvor, :F_FRMTO_MNDA) as "Valor de Saldo a Favor",',
'       a.indcdor_rcncdo as "Reconocido",',
'       trunc(a.fcha_rcncmnto) as "Fecha de Reconocimiento",',
'       to_char(a.vlor_cmpnscion, :F_FRMTO_MNDA) vlor_cmpnscion,',
'       to_char(a.vlor_dvlcion, :F_FRMTO_MNDA) vlor_dvlcion,',
'       to_char(a.sldo_fvor_dspnble,:F_FRMTO_MNDA) sldo_fvor_dspnble,',
'       a.obsrvcion',
'  from v_gf_g_saldos_favor a',
' where a.id_sjto_impsto = :P22_ID_SJTO_IMPSTO',
' ',
' /*',
' select  b.id_sldo_fvor_slctud,',
'        a.nmbre_impsto          as  "Impuesto",',
'        a.nmbre_impsto_sbmpsto  as  "Sub-Impuesto",',
'        a.nmbre_sldo_fvor_tpo   as  "Tipo de Saldo a Favor",',
'        to_char(a.vlor_sldo_fvor, :F_FRMTO_MNDA) as  "Valor de Saldo a Favor",',
'        a.indcdor_rcncdo         as "Reconocido",',
'        trunc(a.fcha_rcncmnto)  as  "Fecha de Reconocimiento",',
unistr('        ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' as "Compensaci\00F3n",'),
unistr('        ''<center><span class="fa fa-eye" aria-hidden="true"></span></center>'' as "Devoluci\00F3n"'),
'from v_gf_g_saldos_favor            a',
'left join gf_g_sldos_fvor_slctud_dtll    b   on a.id_sldo_fvor           =   b.id_sldo_fvor',
'where a.id_sjto_impsto = :P22_ID_SJTO_IMPSTO*/',
'',
''))
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
 p_id=>wwv_flow_api.id(25053048259296216)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'JCUAO'
,p_internal_uid=>25053048259296216
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25053251002296218)
,p_db_column_name=>'Impuesto'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25053340172296219)
,p_db_column_name=>'Sub-Impuesto'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25053406688296220)
,p_db_column_name=>'Tipo de Saldo a Favor'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Tipo de Saldo a Favor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25053582860296221)
,p_db_column_name=>'Valor de Saldo a Favor'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Valor Inicial Saldo a Favor'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(25053603202296222)
,p_db_column_name=>'Fecha de Reconocimiento'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Fecha de Reconocimiento'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8301145227612001)
,p_db_column_name=>'Reconocido'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Reconocido'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_api.id(23563595757684546)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94611030163345503)
,p_db_column_name=>'VLOR_CMPNSCION'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Valor Compensado'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94611192967345504)
,p_db_column_name=>'VLOR_DVLCION'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'Valor Devuelto'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(94610997883345502)
,p_db_column_name=>'SLDO_FVOR_DSPNBLE'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Saldo Disponible'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(45250517568758801)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(25131217758676992)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'251313'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Impuesto:Sub-Impuesto:Tipo de Saldo a Favor:Fecha de Reconocimiento:Reconocido:Valor de Saldo a Favor:VLOR_CMPNSCION:VLOR_DVLCION:SLDO_FVOR_DSPNBLE::OBSRVCION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(197716089990984268)
,p_plug_name=>'&P22_DSCRPCION.'
,p_icon_css_classes=>'&P22_ICNO.'
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
 p_id=>wwv_flow_api.id(25122130743664768)
,p_name=>'P22_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(197716089990984268)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25122508461664769)
,p_name=>'P22_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(197716089990984268)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(25122988041664769)
,p_name=>'P22_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(197716089990984268)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
