prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>'Declaraciones '
,p_page_mode=>'NON_MODAL'
,p_step_title=>'Declaraciones '
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20251126091619'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204060643008284919)
,p_plug_name=>'Declaraciones '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_sjto_impsto,',
'            a.id_dclrcion,',
'            a.nmro_cnsctvo,',
'            k.nmbre_dclrcion_uso,',
'            f.dscrpcion dscrpcion_tpo_dcrlcion,',
'            c.vgncia,',
'            d.dscrpcion dscrpcion_prdo,',
'            i.idntfccion_sjto,',
'            trunc(a.fcha_prsntcion) fcha_prsntcion,',
'            to_char(a.VLOR_PAGO, ''$999G999G999G999G999G999G999G999G999G999'') vlor_ttal,',
'            case when a.id_rcdo is null then',
'                    ''No''',
'                 else ',
unistr('                    ''S\00ED'''),
unistr('            end as "\00BFPagada ?",'),
'            case when trunc(l.fcha_rcdo) > trunc(a.fcha_prsntcion_pryctda) then',
unistr('                    ''S\00ED'''),
'                 else ',
'                    ''No''',
unistr('            end as "\00BFPago Extempor\00E1neo?",      '),
'            case when m.id_lqdcion is null then',
'                    ''No''',
'                 else ',
unistr('                    ''S\00ED'''),
unistr('            end as "\00BFLiquidaci\00F3n Aforo?"'),
'from        gi_g_declaraciones          a',
'join        gi_d_dclrcnes_vgncias_frmlr b   on  b.id_dclrcion_vgncia_frmlrio    =   a.id_dclrcion_vgncia_frmlrio',
'join        gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcion_tpo_vgncia        =   b.id_dclrcion_tpo_vgncia',
'join        df_i_periodos               d   on  d.id_prdo                       =   c.id_prdo',
'join        df_s_periodicidad           e   on  e.cdgo_prdcdad                  =   d.cdgo_prdcdad',
'join        gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo                 =   c.id_dclrcn_tpo',
'join        v_si_i_sujetos_impuesto     i   on  i.id_sjto_impsto                =   a.id_sjto_impsto',
'join        si_i_personas               j   on  j.id_sjto_impsto                =   i.id_sjto_impsto',
'join        gi_d_declaraciones_uso      k   on  k.id_dclrcion_uso               =   a.id_dclrcion_uso',
'left join   v_re_g_recaudos             l   on a.id_rcdo                        =   l.id_rcdo',
'                                           and l.cdgo_rcdo_estdo                =   ''AP''             ',
'left join   gi_g_liquidaciones          m   on m.id_lqdcion = a.id_lqdcion ',
'                                           and m.id_lqdcion_tpo = 26',
'where       a.id_sjto_impsto        = :P33_ID_SJTO_IMPSTO',
'AND (A.INDCDOR_MGRDO <> ''C'' OR A.INDCDOR_MGRDO IS NULL)',
'and         a.cdgo_dclrcion_estdo   in  (''PRS'', ''APL'', ''FRM'',''COR'');'))
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
 p_id=>wwv_flow_api.id(204061195840284924)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP,34:P34_ID_DCLRCION:#ID_DCLRCION##I'
,p_detail_link_text=>'<span aria-hidden="true" class="fa fa-eye"></span>'
,p_detail_link_attr=>'title="Ver"'
,p_owner=>'AMOLINA'
,p_internal_uid=>204061195840284924
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102105424442585366)
,p_db_column_name=>'ID_SJTO_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Id Sjto Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102118274843598501)
,p_db_column_name=>'ID_DCLRCION'
,p_display_order=>20
,p_column_identifier=>'Z'
,p_column_label=>'Id Dclrcion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102118321409598502)
,p_db_column_name=>'NMRO_CNSCTVO'
,p_display_order=>30
,p_column_identifier=>'AA'
,p_column_label=>'Consecutivo '
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102118475447598503)
,p_db_column_name=>'NMBRE_DCLRCION_USO'
,p_display_order=>40
,p_column_identifier=>'AB'
,p_column_label=>unistr('Uso Declaraci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102118502291598504)
,p_db_column_name=>'DSCRPCION_TPO_DCRLCION'
,p_display_order=>50
,p_column_identifier=>'AC'
,p_column_label=>unistr('Tipo Declaraci\00F3n ')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102118639542598505)
,p_db_column_name=>'VGNCIA'
,p_display_order=>60
,p_column_identifier=>'AD'
,p_column_label=>'Vigencia '
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102118741319598506)
,p_db_column_name=>'DSCRPCION_PRDO'
,p_display_order=>70
,p_column_identifier=>'AE'
,p_column_label=>'Periodo '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102118839840598507)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>80
,p_column_identifier=>'AF'
,p_column_label=>unistr('Identificaci\00F3n del Sujeto ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102118983491598508)
,p_db_column_name=>'FCHA_PRSNTCION'
,p_display_order=>90
,p_column_identifier=>'AG'
,p_column_label=>unistr('Fecha Presentaci\00F3n ')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102119098227598509)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>100
,p_column_identifier=>'AH'
,p_column_label=>'Valor Total '
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(102293517158405401)
,p_db_column_name=>unistr('\00BFPagada ?')
,p_display_order=>110
,p_column_identifier=>'AI'
,p_column_label=>unistr('\00BFPagada?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89961408683975924)
,p_db_column_name=>unistr('\00BFPago Extempor\00E1neo?')
,p_display_order=>120
,p_column_identifier=>'AK'
,p_column_label=>unistr('\00BFPago Extempor\00E1neo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(89961549981975925)
,p_db_column_name=>unistr('\00BFLiquidaci\00F3n Aforo?')
,p_display_order=>130
,p_column_identifier=>'AL'
,p_column_label=>unistr('\00BFLiquidaci\00F3n Aforo?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(204072674084325330)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1021149'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>unistr('NMRO_CNSCTVO:NMBRE_DCLRCION_USO:DSCRPCION_TPO_DCRLCION:VGNCIA:DSCRPCION_PRDO:IDNTFCCION_SJTO:FCHA_PRSNTCION:VLOR_TTAL::\00BFPagada ?:\00BFPago Extempor\00E1neo?:\00BFLiquidaci\00F3n Aforo?')
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'FCHA_PRSNTCION'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(204061082647284923)
,p_plug_name=>'&P33_DSCRPCION.'
,p_icon_css_classes=>'&P33_ICNO.'
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
 p_id=>wwv_flow_api.id(102116184733585444)
,p_name=>'P33_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(204060643008284919)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102116860525585463)
,p_name=>'P33_DSCRPCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(204061082647284923)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(102117221483585463)
,p_name=>'P33_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(204061082647284923)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
