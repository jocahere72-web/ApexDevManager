prompt --application/pages/page_00039
begin
wwv_flow_api.create_page(
 p_id=>39
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Fiscalizaci\00F3n Acto Transici\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>'Resultado del cambio de etapa'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'100%'
,p_last_updated_by=>'1111111112'
,p_last_upd_yyyymmddhh24miss=>'20220518105104'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68280694946802401)
,p_plug_name=>'Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(68261786482212903)
,p_plug_name=>'Resultado del cambio de etapa'
,p_parent_plug_id=>wwv_flow_api.id(68280694946802401)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  b.idntfccion_sjto,',
'        e.nmbre_rzon_scial,',
'        a.id_instncia_fljo ,',
'        d.nmbre_trea,',
'        a.obsrvciones  ',
'from fi_g_fsclzcn_expdnt_act_trnscn a',
'left join v_si_i_sujetos_impuesto        b   on  a.id_sjto_impsto    =   b.id_sjto_impsto',
'left join si_i_personas                  e   on  a.id_sjto_impsto    =   e.id_sjto_impsto',
'left join wf_d_flujos_tarea              c   on  a.id_fljo_trea      =   c.id_fljo_trea',
'left join wf_d_tareas                    d   on  c.id_trea           =   d.id_trea',
'--where a.cdgo_clnte = 8758',
'--and a.id_fncnrio = 60;'))
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
 p_id=>wwv_flow_api.id(68261872916212904)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'LTORRES'
,p_internal_uid=>68261872916212904
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68262053817212906)
,p_db_column_name=>'ID_INSTNCIA_FLJO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Flujo'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68262222478212908)
,p_db_column_name=>'OBSRVCIONES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Observaciones'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68262301243212909)
,p_db_column_name=>'IDNTFCCION_SJTO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(68262448841212910)
,p_db_column_name=>'NMBRE_TREA'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Etapa'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(69426062750455601)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Candidato'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(68270582094843186)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'682706'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_INSTNCIA_FLJO:IDNTFCCION_SJTO:NMBRE_RZON_SCIAL:NMBRE_TREA:OBSRVCIONES:'
);
end;
/
