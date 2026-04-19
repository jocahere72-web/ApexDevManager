prompt --application/pages/page_00066
begin
wwv_flow_api.create_page(
 p_id=>66
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Homologaciones Veh\00EDculos')
,p_step_title=>unistr('Homologaciones Veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180918161353'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(97252515812015929)
,p_plug_name=>unistr('Homologaciones Veh\00EDculos')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_VHCLO_HMLGA,',
'       VGNCIA_DSDE,',
'       VGNCIA_HSTA,',
'       CDGO_CLSE_ANTRIOR,',
'       CDGO_CLSE_NVA,',
'       ORDEN',
'  from DF_S_VEHICULOS_HOMOLOGA'))
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
 p_id=>wwv_flow_api.id(97093731548562828)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:RP:P67_ID_VHCLO_HMLGA:#ID_VHCLO_HMLGA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>97093731548562828
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97093833179562829)
,p_db_column_name=>'ID_VHCLO_HMLGA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id vhclo hmlga'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97093945387562830)
,p_db_column_name=>'VGNCIA_DSDE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vigencia Inicial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97094037690562831)
,p_db_column_name=>'VGNCIA_HSTA'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vigencia Final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97094154965562832)
,p_db_column_name=>'CDGO_CLSE_ANTRIOR'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Clase anterior'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97094266210562833)
,p_db_column_name=>'CDGO_CLSE_NVA'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Clase nueva'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(97094303592562834)
,p_db_column_name=>'ORDEN'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(97283015265196267)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'972831'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID_VHCLO_HMLGA:VGNCIA_DSDE:VGNCIA_HSTA:CDGO_CLSE_ANTRIOR:CDGO_CLSE_NVA:ORDEN'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(97093671372562827)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(97252515812015929)
,p_button_name=>'Btn_Nuevo_Vehiculo_homologa'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva homologaci\00F3n ')
,p_button_position=>'TOP'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:RP,67::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(101377379818314806)
,p_name=>'Refresh_Region_Homologaciones_vehiculos'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(97252515812015929)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(101377474275314807)
,p_event_id=>wwv_flow_api.id(101377379818314806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(97252515812015929)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(97258413431015945)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(97252515812015929)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>' - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
