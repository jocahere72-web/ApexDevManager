prompt --application/pages/page_00033
begin
wwv_flow_api.create_page(
 p_id=>33
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Gesti\00F3n Condiciones Accion')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Condiciones Acci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20190822151958'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9858165861103250)
,p_plug_name=>unistr('Condiciones Acci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080387335707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_frmlrio_cndcion_accion,',
'       case a.accion when ''M'' then ''Mostrar''',
'                         when ''O'' then ''Ocultar''',
'                         when ''S'' then ''Setear''',
'       end accion,',
'       a.item_afctdo,',
unistr('       case a.tpo_vlor when ''C'' then ''C\00E1lculo'''),
unistr('                       when ''E'' then ''Est\00E1tico'''),
unistr('                       when ''F'' then ''Funci\00F3n'''),
'                       when ''S'' then ''SQL''',
'        end tpo_vlor,',
'       a.vlor',
'  from gi_d_frmlrios_cndcion_accn   a',
' where a.id_frmlrio_cndcion = :P33_ID_FRMLRIO_CNDCION',
'   and a.tpo_accion = :P33_TPO_ACCION;'))
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
 p_id=>wwv_flow_api.id(11666888565933101)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP,38:P38_ID_FRMLRIO_CNDCION_ACCION,P38_ID_FRMLRIO,P38_ID_FRMLRIO_RGION:#ID_FRMLRIO_CNDCION_ACCION#,&P33_ID_FRMLRIO.,&P33_ID_FRMLRIO_RGION.'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JDIAZ'
,p_internal_uid=>11666888565933101
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11666926952933102)
,p_db_column_name=>'ID_FRMLRIO_CNDCION_ACCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Frmlrio Cndcion Accion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11667380823933106)
,p_db_column_name=>'ITEM_AFCTDO'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>unistr('\00CDtem Afectado')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11891253479169136)
,p_db_column_name=>'ACCION'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Accion'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11890659924169130)
,p_db_column_name=>'TPO_VLOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Tipo Valor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(11667267189933105)
,p_db_column_name=>'VLOR'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Valor'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_column_alignment=>'CENTER'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(11674106457937850)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'116742'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ACCION:ITEM_AFCTDO:TPO_VLOR:VLOR:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11667501004933108)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9858165861103250)
,p_button_name=>'P33_BTN_NVA_ACCION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nueva Acci\00F3n')
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP,38:P38_ID_FRMLRIO_CNDCION,P38_ID_FRMLRIO,P38_ID_FRMLRIO_RGION,P38_TPO_ACCION:&P33_ID_FRMLRIO_CNDCION.,&P33_ID_FRMLRIO.,&P33_ID_FRMLRIO_RGION.,&P33_TPO_ACCION.'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11667483064933107)
,p_name=>'P33_ID_FRMLRIO_CNDCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(9858165861103250)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11669041104933123)
,p_name=>'P33_ID_FRMLRIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(9858165861103250)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Formulario'
,p_source=>'ID_FRMLRIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio',
'from    gi_d_formularios    a',
'where   a.id_frmlrio    =   :P33_ID_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11890929758169133)
,p_name=>'P33_TPO_ACCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(9858165861103250)
,p_prompt=>unistr('Tipo De Acci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Verdadero;V,Falso;F'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13520944937694020)
,p_name=>'P33_ID_FRMLRIO_RGION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(9858165861103250)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Regi\00F3n')
,p_source=>'ID_FRMLRIO_RGION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a',
'where   a.id_frmlrio_rgion  =   :P33_ID_FRMLRIO_RGION;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11890090945169124)
,p_name=>'P33_BTN_NVA_ACCION clic'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(11667501004933108)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11890120259169125)
,p_event_id=>wwv_flow_api.id(11890090945169124)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(9858165861103250)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11890231401169126)
,p_name=>'IG Close Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(9858165861103250)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11890336427169127)
,p_event_id=>wwv_flow_api.id(11890231401169126)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(9858165861103250)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13521020991694021)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch gi_d_formularios_condicion'
,p_attribute_02=>'GI_D_FORMULARIOS_CONDICION'
,p_attribute_03=>'P33_ID_FRMLRIO_CNDCION'
,p_attribute_04=>'ID_FRMLRIO_CNDCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
