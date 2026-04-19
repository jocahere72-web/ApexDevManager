prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(237318207209524256)
,p_name=>unistr('Informe Varia Aval\00FAos Vehiculos')
,p_step_title=>unistr('Informe Aval\00FAos Vehiculos')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(237212187010524183)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20201230101716'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192444240402264420)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>' <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192444812509265193)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>30
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
unistr('Funcionalidad que permite ingresar, consultar, modificar y eliminar variaciones en los aval\00FAos de veh\00EDculos.'),
'<br>',
unistr('<br> Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196727523834132827)
,p_plug_name=>unistr('Informe Aval\00FAos Var\00EDa Veh\00EDculos')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(237244171633524200)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID_VHCLO_AVLUO_VRIA,',
'       CDGO_CLNTE,',
'       VGNCIA,',
'       CDGO_VHCLO_VRCION_TPO,',
'       DSCRPCION_VHCLO_VRCION_TPO,',
'       VLOR,',
'       TPO_OPRCION,',
'       TPO_VLOR,',
'       ORDEN',
'  from V_DF_C_VEHICULOS_AVALUO_VARIA',
' where CDGO_CLNTE = :F_CDGO_CLNTE'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(196727560132132827)
,p_name=>unistr('Informe Aval\00FAos Vehiculos')
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato ')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP:P18_ID_VHCLO_AVLUO_VRIA:#ID_VHCLO_AVLUO_VRIA#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>196727560132132827
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87021385968260832)
,p_db_column_name=>'ID_VHCLO_AVLUO_VRIA'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id Vhclo Avluo Vria'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87021702769260842)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>unistr('C\00F3digo Cliente')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87022191502260842)
,p_db_column_name=>'VGNCIA'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Vigencia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87022519675260843)
,p_db_column_name=>'CDGO_VHCLO_VRCION_TPO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>unistr('Tipo Variaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87022998831260843)
,p_db_column_name=>'VLOR'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Valor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87023398882260843)
,p_db_column_name=>'TPO_OPRCION'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>unistr('Tipo Operaci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(83123758689351888)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87023748034260844)
,p_db_column_name=>'TPO_VLOR'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Tipo Valor'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(87024184144260844)
,p_db_column_name=>'ORDEN'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Orden'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85478371468506144)
,p_db_column_name=>'DSCRPCION_VHCLO_VRCION_TPO'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>unistr('Tipo Variaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(196731830371138363)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'870245'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CDGO_CLNTE:VGNCIA:VLOR:DSCRPCION_VHCLO_VRCION_TPO:TPO_OPRCION:TPO_VLOR:ORDEN:'
,p_sort_column_1=>'VGNCIA'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(87024958438260851)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(192444240402264420)
,p_button_name=>unistr('Nuevo_Aval\00FAos_Varia_Vehiculo')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(237296397635524233)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo Aval\00FAo Varia')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP,18::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(87025296037260863)
,p_name=>'Refresh_region'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(196727523834132827)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(87025701984260867)
,p_event_id=>wwv_flow_api.id(87025296037260863)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(196727523834132827)
,p_stop_execution_on_error=>'Y'
);
end;
/
