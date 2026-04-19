prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(22508582753660970)
,p_name=>unistr('Liquidaci\00F3n')
,p_page_mode=>'NON_MODAL'
,p_step_title=>unistr('Liquidaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220330110531'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23400545569655743)
,p_plug_name=>'&P3_DSCRPCION.'
,p_icon_css_classes=>'&P3_ICNO.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52124852663074800)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(23400705590655745)
,p_plug_name=>'Liquidaciones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(52128439135074801)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto_sbmpsto,',
'       a.vgncia,',
'       a.prdo,',
'       to_char(a.fcha_lqdcion, ''DD/MM/YYYY'') as fcha_lqdcion,',
'       a.vlor_ttal,',
'       a.dscrpcion_lqdcion_estdo,',
'       a.id_lqdcion,',
'       (select C.DSCRPCION_PRDIO_CLSFCCION',
'          from df_s_predios_clasificacion c',
'         where c.cdgo_prdio_clsfccion = t.cdgo_prdio_clsfccion) CLASE,',
'       (SELECT D.DSCRPCION',
'          FROM DF_I_PREDIOS_DESTINO D',
'         WHERE D.ID_PRDIO_DSTNO = T.ID_PRDIO_DSTNO',
'           AND D.ID_IMPSTO = a.ID_IMPSTO) DESTINO,',
'       (SELECT E.DSCRPCION_ESTRTO',
'          FROM DF_S_ESTRATOS E',
'         WHERE E.CDGO_ESTRTO = T.CDGO_ESTRTO) ESTRATO,',
'       T.AREA_TRRNO,',
'       T.AREA_CNSCTRDA, ',
'      (select nmbre from si_i_sujetos_sucursal s where a.id_sjto_scrsal = s.id_sjto_scrsal)  Sucursal',
'  from v_gi_g_liquidaciones a',
'  left join GI_G_LIQUIDACIONES_AD_PREDIO t on t.id_lqdcion = a.id_lqdcion',
' where a.id_sjto_impsto = :P3_ID_SJTO_IMPSTO',
' order by a.vgncia, a.prdo, a.vlor_ttal, a.dscrpcion_lqdcion_estdo'))
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
 p_id=>wwv_flow_api.id(23400861298655746)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos disponibles'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:RP,4:P4_ID_LQDCION:#ID_LQDCION#'
,p_detail_link_text=>'<center><span class="fa fa-eye" aria-hidden="true"></span></center>'
,p_owner=>'JCUAO'
,p_internal_uid=>23400861298655746
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23400901889655747)
,p_db_column_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Subtributo'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23401043622655748)
,p_db_column_name=>'VGNCIA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23401120774655749)
,p_db_column_name=>'PRDO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Periodo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(23401260592655750)
,p_db_column_name=>'FCHA_LQDCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Fecha Liquidaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24203034682799401)
,p_db_column_name=>'VLOR_TTAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Valor Total'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&F_FRMTO_MNDA.'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24203132445799402)
,p_db_column_name=>'DSCRPCION_LQDCION_ESTDO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24203284013799403)
,p_db_column_name=>'ID_LQDCION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('N\00B0 Liquidaci\00F3n')
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14776925272461901)
,p_db_column_name=>'CLASE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Clase'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14777097414461902)
,p_db_column_name=>'DESTINO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Destino'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14777125912461903)
,p_db_column_name=>'ESTRATO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Estrato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14777242765461904)
,p_db_column_name=>'AREA_TRRNO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'A. Terreno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(14777389381461905)
,p_db_column_name=>'AREA_CNSCTRDA'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'A. Construida'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(65784879311439001)
,p_db_column_name=>'SUCURSAL'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Sucursal'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(24213560194809184)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'242136'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_LQDCION:NMBRE_IMPSTO_SBMPSTO:SUCURSAL:VGNCIA:PRDO:FCHA_LQDCION:VLOR_TTAL:DSCRPCION_LQDCION_ESTDO:CLASE:DESTINO:ESTRATO:AREA_TRRNO:AREA_CNSCTRDA:'
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PRDO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'FCHA_LQDCION'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'DSCRPCION_LQDCION_ESTDO'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(23400630168655744)
,p_name=>'P3_ID_SJTO_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(23400705590655745)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24207923471799450)
,p_name=>'P3_ICNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(23400545569655743)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(24531480519846401)
,p_name=>'P3_DSCRPCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(23400545569655743)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
