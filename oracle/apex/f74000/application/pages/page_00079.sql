prompt --application/pages/page_00079
begin
wwv_flow_api.create_page(
 p_id=>79
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Estado de fiscalizaci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>'Flujo de Medida Cautelar'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20220817134556'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(285491232584600855)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  x.nmbre_trea,',
'        y.estdo_trnscion ',
'      , v.id_instncia_fljo',
'      , y.id_estdo_trnscion',
'      , v.id_instncia_trnscion',
'      ,w.id_fljo_trea',
'from wf_g_instancias_transicion v',
'join wf_d_flujos_tarea w   ',
'on v.id_fljo_trea_orgen = w.id_fljo_trea',
'join wf_d_tareas x ',
'on w.id_trea = x.id_trea',
'join wf_d_estado_transicion y',
'on v.id_estdo_trnscion = y.id_estdo_trnscion',
'where v.id_instncia_fljo  = :P79_ID_INSTNCIA_FLJO                  ',
'--group by w.id_instncia_fljo  ',
';          '))
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
 p_id=>wwv_flow_api.id(190902738996263701)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LARIZA'
,p_internal_uid=>190902738996263701
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190903046442263704)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Flujo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190902854910263702)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'ETAPA'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190902985939263703)
,p_db_column_name=>'ESTDO_TRNSCION'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'ESTADO DE LA TAREA'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190903197048263705)
,p_db_column_name=>'ID_ESTDO_TRNSCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Id Estdo Trnscion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190903204186263706)
,p_db_column_name=>'ID_INSTNCIA_TRNSCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Id Instncia Trnscion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190903387179263707)
,p_db_column_name=>'ID_FLJO_TREA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Id Fljo Trea'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(190910368878418122)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1909104'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_INSTNCIA_FLJO:NMBRE_TREA:ESTDO_TRNSCION:ID_ESTDO_TRNSCION:ID_INSTNCIA_TRNSCION:ID_FLJO_TREA'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(287129941930819740)
,p_plug_name=>'Datos del Documento'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmro_prcso_jrdco,',
'       nombre_etpa,',
'       nvl2(actvo,  estdo_etpa, estdo_etpa_vsble)  estdo_etpa,',
'       funcionario,',
'       obsrvcion,',
'       vlor_ttal_dda,',
'       actvo,',
'       prcso_estdo,',
'       fcha_rgstro',
'  from v_cb_g_prcsos_jrdc_dcmnt_estd',
' where id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   and id_etpa = :F_ID_FLJO_TREA'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(287130036107819741)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>287130036107819741
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190888089270171898)
,p_db_column_name=>'NMRO_PRCSO_JRDCO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero Proceso Jur\00EDdico')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190888485065171912)
,p_db_column_name=>'NOMBRE_ETPA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190888716158171912)
,p_db_column_name=>'ESTDO_ETPA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Estado Etapa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190889110069171913)
,p_db_column_name=>'FUNCIONARIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Funcionario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190889578972171913)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Observaci\00F3n Estado')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190889967926171913)
,p_db_column_name=>'VLOR_TTAL_DDA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Total Proceso'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190890340319171913)
,p_db_column_name=>'ACTVO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Proceso Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190890734185171914)
,p_db_column_name=>'PRCSO_ESTDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Proceso Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190891117175171914)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(287209398535646549)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1908915'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_PRCSO_JRDCO:NOMBRE_ETPA:ESTDO_ETPA:FUNCIONARIO:OBSRVCION:VLOR_TTAL_DDA:ACTVO:PRCSO_ESTDO:FCHA_RGSTRO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(330912226963348470)
,p_plug_name=>'Documentos_Juridicos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT nmro_prcso_jrdco,',
'       id_prcsos_jrdco,',
'       id_prcsos_jrdco_dcmnto,',
'       NMRO_ACTO,',
'       FCHA_ACTO,',
'       nombre_etpa,',
'       id_acto,file_name,',
'       ''Ver PDF'' as pdf',
'FROM V_CB_G_PROCESOS_JRDCO_DCMNTO',
'WHERE id_prcsos_jrdco = :p79_id_prcsos_jrdco '))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
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
 p_id=>wwv_flow_api.id(330912352279348471)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ABRACHE'
,p_internal_uid=>330912352279348471
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190892283105171921)
,p_db_column_name=>'NMRO_PRCSO_JRDCO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Numero de Proceso Juridico'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190892698284171925)
,p_db_column_name=>'ID_PRCSOS_JRDCO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Prcsos Jrdco'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190893016353171925)
,p_db_column_name=>'ID_PRCSOS_JRDCO_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Prcsos Jrdco Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190893405260171926)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Numero de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190893811811171926)
,p_db_column_name=>'FCHA_ACTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Fecha de Acto'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190894214113171927)
,p_db_column_name=>'NOMBRE_ETPA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190894636862171928)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'<p></p>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:V_CB_G_PROCESOS_JRDCO_DCMNTO:FILE_BLOB:ID_PRCSOS_JRDCO_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="t-Icon t-Icon--right fa fa-print" aria-hidden="true"></span>:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190895002548171928)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(190895487113171928)
,p_db_column_name=>'PDF'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'<p></p>'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,#ID_ACTO#'
,p_column_linktext=>'#PDF#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(331524884765097804)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1908958'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_PRCSO_JRDCO:ID_PRCSOS_JRDCO:ID_PRCSOS_JRDCO_DCMNTO:NMRO_ACTO:FCHA_ACTO:NOMBRE_ETPA:ID_ACTO:FILE_NAME:PDF'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190886186789171877)
,p_name=>'P79_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(285491232584600855)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190886555204171893)
,p_name=>'P79_ID_FLJO_TREA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(285491232584600855)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190886920383171894)
,p_name=>'P79_ID_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(285491232584600855)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190887337089171894)
,p_name=>'P79_ID_PRCSOS_JRDCO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(285491232584600855)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(190896333769171942)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P79_ID_INSTNCIA_FLJO'
,p_compute_when=>'P79_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(190896775195171951)
,p_computation_sequence=>20
,p_computation_item=>'F_ID_FLJO_TREA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P79_ID_FLJO_TREA'
,p_compute_when=>'P79_ID_FLJO_TREA'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
