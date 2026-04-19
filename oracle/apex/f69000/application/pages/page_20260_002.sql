prompt --application/pages/page_20260_002
begin
wwv_flow_api.create_page(
 p_id=>2026005
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>'Resoluciones No Aplicadas'
,p_step_title=>'Resoluciones No Aplicadas'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(88500439538834642)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DBALDOVINO'
,p_last_upd_yyyymmddhh24miss=>'20260227105205'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(24581434318457343)
,p_plug_name=>'Resoluciones'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(88535445650834666)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto, a.id_impsto_sbmpsto, ',
'a.rslcion, a.rdccion, a.tpo_trmte, ',
'a.clse_mtcion, a.vgncia_igac, a.fcha_aplccion, ',
'trunc(a.fcha_rgstro), a.rslcion_aplcda, a.obsrvcion_no_aplcda',
'from si_g_reslcion_no_aplcda a',
'where ( a.rdccion = :P2026005_RDCCION or :P2026005_RDCCION is null)',
'and ( a.rslcion = :P2026005_RSLUCION or :P2026005_RSLUCION is null)',
'and (trunc(a.fcha_rgstro) between nvl(:P2026005_FCHA_INCIO,trunc(sysdate)) and nvl(:P2026005_FCHA_FIN,trunc(sysdate) ) )',
'--and ( rslcion_aplcda = :P2026005_RSLCION_APLCADA or :P2026005_RSLCION_APLCADA is null)',
'and not exists (select 1 ',
'                from si_g_resolucion_igac_t1 x',
'                join si_g_resolucion_aplicada r on r.id_rslcion_aplcda = x.id_rslcion_aplcda ',
'                where a.rdccion = x.rdccion',
'                and a.rslcion = x.rslcion)',
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
 p_id=>wwv_flow_api.id(24581557599457344)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No se encontraron resoluciones'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DBALDOVINO'
,p_internal_uid=>24581557599457344
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24581637706457345)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tributo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105706992941748015)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24581749258457346)
,p_db_column_name=>'ID_IMPSTO_SBMPSTO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sub-Tributo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_api.id(105707499495748016)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24581867820457347)
,p_db_column_name=>'RSLCION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Resoluci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24581994892457348)
,p_db_column_name=>'RDCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Radicaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24582036673457349)
,p_db_column_name=>'TPO_TRMTE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tipo Tramite '
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(89151809889991326)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(24582166503457350)
,p_db_column_name=>'CLSE_MTCION'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Clase Mutaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(89494709908470580)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31534712980621101)
,p_db_column_name=>'VGNCIA_IGAC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31534896173621102)
,p_db_column_name=>'FCHA_APLCCION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Fecha de Aplicaci\00F3n')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31535018277621104)
,p_db_column_name=>'RSLCION_APLCDA'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('\00BFResoluci\00F3n Aplicada?')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(105710618312748017)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(31535145930621105)
,p_db_column_name=>'OBSRVCION_NO_APLCDA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Observaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17092099490983907)
,p_db_column_name=>'TRUNC(A.FCHA_RGSTRO)'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Fecha de Registro'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(31543457748617947)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'315435'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TPO_TRMTE:CLSE_MTCION:RSLCION:RDCCION:RSLCION_APLCDA:OBSRVCION_NO_APLCDA::TRUNC(A.FCHA_RGSTRO)'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31535239671621106)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad que permite consultar resoluciones que no hayan sido aplicadas.',
'       <br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31535372330621107)
,p_plug_name=>unistr('Par\00E1metros de Consulta')
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88525409177834657)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(31536133937621115)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(31535372330621107)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31535421652621108)
,p_name=>'P2026005_RSLUCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(31535372330621107)
,p_prompt=>unistr('Resoluci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Resoluci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31535563856621109)
,p_name=>'P2026005_RDCCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(31535372330621107)
,p_prompt=>unistr('Radicaci\00F3n')
,p_placeholder=>unistr('Digite N\00B0 Radicaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31535623299621110)
,p_name=>'P2026005_FCHA_INCIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(31535372330621107)
,p_prompt=>'Fecha de Registro Inicial'
,p_placeholder=>'Digite Fecha de Inicio'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31535783078621111)
,p_name=>'P2026005_FCHA_FIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(31535372330621107)
,p_prompt=>'Fecha de Registro Fin'
,p_placeholder=>'Digite Fecha Fin'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_02=>'&P2026005_FCHA_INCIO.'
,p_attribute_03=>'+0d'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31536074220621114)
,p_name=>'P2026005_RSLCION_APLCADA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(31535372330621107)
,p_prompt=>unistr('\00BFResoluci\00F3n Aplicada?')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_SI_NO'
,p_lov=>'.'||wwv_flow_api.id(105710618312748017)||'.'
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(88588114931834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31535880359621112)
,p_name=>'Al Seleccionar Fecha Inicio'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2026005_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31535926640621113)
,p_event_id=>wwv_flow_api.id(31535880359621112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P2026005_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P2026005_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
end;
/
