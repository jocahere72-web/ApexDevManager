prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('Flujo de Proceso Jur\00EDdico')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Flujo de Proceso Jur\00EDdico')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_last_updated_by=>'ABRACHE'
,p_last_upd_yyyymmddhh24miss=>'20200312173810'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36771609631538616)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'false'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38410318977757501)
,p_plug_name=>'Datos del Documento'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
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
 p_id=>wwv_flow_api.id(38410413154757502)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'MCARO'
,p_internal_uid=>38410413154757502
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38410598843757503)
,p_db_column_name=>'NMRO_PRCSO_JRDCO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>unistr('N\00FAmero Proceso Jur\00EDdico')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38410647278757504)
,p_db_column_name=>'NOMBRE_ETPA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38410718940757505)
,p_db_column_name=>'ESTDO_ETPA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Estado Etapa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38410830283757506)
,p_db_column_name=>'FUNCIONARIO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Funcionario'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38410935258757507)
,p_db_column_name=>'OBSRVCION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Observaci\00F3n Estado')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38411011285757508)
,p_db_column_name=>'VLOR_TTAL_DDA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Valor Total Proceso'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38411140840757509)
,p_db_column_name=>'ACTVO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Proceso Estado'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38411690581757514)
,p_db_column_name=>'PRCSO_ESTDO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Proceso Estado'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38411734770757515)
,p_db_column_name=>'FCHA_RGSTRO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Fecha Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(38489775582584310)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'384898'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_PRCSO_JRDCO:NOMBRE_ETPA:ESTDO_ETPA:FUNCIONARIO:OBSRVCION:VLOR_TTAL_DDA:ACTVO:PRCSO_ESTDO:FCHA_RGSTRO'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82192604010286231)
,p_plug_name=>'Documentos_Juridicos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT nmro_prcso_jrdco,',
'       id_prcsos_jrdco,',
'       id_prcsos_jrdco_dcmnto,',
'       NMRO_ACTO,',
'       to_char(FCHA_ACTO,''dd/mm/yyyy'') as FCHA_ACTO,',
'       nombre_etpa,',
'       id_acto,file_name,',
'       case when id_acto is not null',
'                then ''<button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0" aria-labelledby="id_tareas_ig_grid_vc_ctx id_tareas_ig_grid_vc_cur">Ver PDF <span class="fa fa-eye"></span>',
'</button>''',
'        else '' ''',
'       end as pdf',
'FROM V_CB_G_PROCESOS_JRDCO_DCMNTO',
'WHERE id_prcsos_jrdco = :p11_id_prcsos_jrdco '))
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
 p_id=>wwv_flow_api.id(82192729326286232)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ABRACHE'
,p_internal_uid=>82192729326286232
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82192879382286233)
,p_db_column_name=>'NMRO_PRCSO_JRDCO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Numero de Proceso Juridico'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82192930662286234)
,p_db_column_name=>'ID_PRCSOS_JRDCO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Id Prcsos Jrdco'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82193025013286235)
,p_db_column_name=>'ID_PRCSOS_JRDCO_DCMNTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Prcsos Jrdco Dcmnto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82193137176286236)
,p_db_column_name=>'NMRO_ACTO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Numero de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82193322763286238)
,p_db_column_name=>'NOMBRE_ETPA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo de Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(57849433753104908)
,p_db_column_name=>'FCHA_ACTO'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Fcha Acto'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82193476138286239)
,p_db_column_name=>'ID_ACTO'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'<p></p>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:V_CB_G_PROCESOS_JRDCO_DCMNTO:FILE_BLOB:ID_PRCSOS_JRDCO_DCMNTO::FILE_MIMETYPE:FILE_NAME:::attachment:<span class="t-Icon t-Icon--right fa fa-print" aria-hidden="true"></span>:'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(82193594954286240)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87070296458022944)
,p_db_column_name=>'PDF'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'<p></p>'
,p_column_link=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_FILENAME,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,file_blob,file_name,file_mimetype,id_acto,#ID_ACTO#'
,p_column_linktext=>'#PDF#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:::'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(82805261812035565)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'828053'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMRO_PRCSO_JRDCO:NMRO_ACTO:FCHA_ACTO:NOMBRE_ETPA:ID_ACTO:PDF:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36813780906872503)
,p_name=>'P11_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(36771609631538616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36813834697872504)
,p_name=>'P11_ID_FLJO_TREA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(36771609631538616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51073717436308405)
,p_name=>'P11_ID_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(36771609631538616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76653366302038532)
,p_name=>'P11_ID_PRCSOS_JRDCO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(36771609631538616)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(36813928505872505)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_INSTNCIA_FLJO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P11_ID_INSTNCIA_FLJO'
,p_compute_when=>'P11_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(36814077357872506)
,p_computation_sequence=>20
,p_computation_item=>'F_ID_FLJO_TREA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P11_ID_FLJO_TREA'
,p_compute_when=>'P11_ID_FLJO_TREA'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
