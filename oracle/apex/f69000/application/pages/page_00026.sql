prompt --application/pages/page_00026
begin
wwv_flow_api.create_page(
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Tipos de Resoluciones '
,p_page_mode=>'MODAL'
,p_step_title=>'Tipos de Resoluciones '
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88496149054834641)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20200607195316'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68774745370989006)
,p_plug_name=>'Tipos de Registros'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(88543343085834669)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137519994717418873)
,p_plug_name=>unistr('Resoluci\00F3n Tipo II')
,p_parent_plug_id=>wwv_flow_api.id(68774745370989006)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select ( case when length(a.rfrncia_igac) = 15 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => a.rfrncia_igac , p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' )',
'                when length(a.rfrncia_igac) = 25 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => a.rfrncia_igac , p_frmto => ''xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'' , p_crcter_dlmtdor => ''-'' )',
'                else',
'                    a.rfrncia_igac',
'          end ) as rfrncia_igac_frmtda ',
'        , a.rfrncia_igac',
'        , a.mtrcla_inmblria',
'     from si_g_resolucion_igac_t2 a',
'    where a.id_prcso_crga in (',
'                                 select b.id_prcso_crga',
'                                   from et_g_procesos_carga b',
'                                  where b.id_prcso_crga = a.id_prcso_crga',
'                                    and b.cdgo_clnte        = :F_CDGO_CLNTE',
'                                    and b.id_impsto         = :P26_ID_IMPSTO ',
'                                    and b.id_impsto_sbmpsto = :P26_ID_IMPSTO_SBMPSTO',
'                             )',
'      and a.rslcion       = :P26_RSLCION',
'      and a.rdccion       = :P26_RDCCION',
'      and a.cncla_inscrbe = ''I''',
'      and a.rfrncia_igac  = :P26_RFRNCIA_IGAC',
'      and a.nmro_orden    = ''001''',
' order by a.rfrncia_igac',
'        , a.nmro_orden'))
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
 p_id=>wwv_flow_api.id(137520031120418874)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay datos de matriculas por mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>137520031120418874
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68787598967081957)
,p_db_column_name=>'RFRNCIA_IGAC_FRMTDA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68787992912081959)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68788377045081959)
,p_db_column_name=>'MTRCLA_INMBLRIA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Matricula'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(137560385315044366)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'687887'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RFRNCIA_IGAC_FRMTDA:RFRNCIA_IGAC:MTRCLA_INMBLRIA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(137529441812464483)
,p_plug_name=>unistr('Resoluci\00F3n Tipo III')
,p_parent_plug_id=>wwv_flow_api.id(68774745370989006)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select ( case when length(a.rfrncia_igac) = 15 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => a.rfrncia_igac , p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' )',
'                when length(a.rfrncia_igac) = 25 then',
'                    pkg_gn_generalidades.fnc_cl_formato_texto( p_txto => a.rfrncia_igac , p_frmto => ''xx-xx-xx-xx-xxxx-xxxx-x-xx-xx-xxxx'' , p_crcter_dlmtdor => ''-'' )',
'                else',
'                    a.rfrncia_igac',
'             end ) as rfrncia_igac_frmtda ',
'         , a.nmro_orden',
'         , a.ttal_rgstro',
'         , a.rfrncia_igac ',
'         , a.vgncia',
'         , a.avluo_ctstral',
'         , a.decrtos',
'      from si_g_resolucion_igac_t3 a',
'     where a.id_prcso_crga in (',
'                                 select b.id_prcso_crga',
'                                   from et_g_procesos_carga b',
'                                  where b.id_prcso_crga = a.id_prcso_crga',
'                                    and b.cdgo_clnte        = :F_CDGO_CLNTE',
'                                    and b.id_impsto         = :P26_ID_IMPSTO ',
'                                    and b.id_impsto_sbmpsto = :P26_ID_IMPSTO_SBMPSTO',
'                              )',
'      and a.rslcion       = :P26_RSLCION',
'      and a.rdccion       = :P26_RDCCION',
'      and a.rfrncia_igac  = :P26_RFRNCIA_IGAC',
' order by a.rfrncia_igac',
'        , a.nmro_orden',
'        , a.vgncia'))
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
 p_id=>wwv_flow_api.id(137529486798464484)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay decretos por mostrar.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'NARDILA'
,p_internal_uid=>137529486798464484
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68795554421127543)
,p_db_column_name=>'RFRNCIA_IGAC_FRMTDA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68795968649127543)
,p_db_column_name=>'RFRNCIA_IGAC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Referencia'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68796382808127543)
,p_db_column_name=>'NMRO_ORDEN'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Orden'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68796746573127544)
,p_db_column_name=>'TTAL_RGSTRO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68797187901127544)
,p_db_column_name=>'AVLUO_CTSTRAL'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Avalu\00F3')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68797584573127544)
,p_db_column_name=>'VGNCIA'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68797912251127544)
,p_db_column_name=>'DECRTOS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Decreto General'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(137581195358126701)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'687983'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RFRNCIA_IGAC_FRMTDA:RFRNCIA_IGAC:NMRO_ORDEN:TTAL_RGSTRO:AVLUO_CTSTRAL:VGNCIA:DECRTOS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68774863457989007)
,p_name=>'P26_RFRNCIA_IGAC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(68774745370989006)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68775008126989009)
,p_name=>'P26_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(68774745370989006)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68775116435989010)
,p_name=>'P26_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(68774745370989006)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68775207458989011)
,p_name=>'P26_RSLCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(68774745370989006)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(68775371201989012)
,p_name=>'P26_RDCCION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(68774745370989006)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
