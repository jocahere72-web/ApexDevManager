prompt --application/pages/page_00097
begin
wwv_flow_api.create_page(
 p_id=>97
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>unistr('Informe de grupos de veh\00EDculos')
,p_step_title=>unistr('Informe de grupos de veh\00EDculos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ELAFAURIE'
,p_last_upd_yyyymmddhh24miss=>'20191209174011'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29430051069772721)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
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
unistr('Funcionalidad que permite gestionar los veh\00EDculos de acuerdo con la vigencia y las caracter\00EDsticas del mismo.<br>'),
'',
unistr('<b>1.</b> Consultar un grupo de veh\00EDculos: seleccione la vigencia y hacer clic en el bot\00F3n Consultar, se mostrar\00E1 en la parte inferior de los par\00E1metros de b\00FAsqueda los grupos de veh\00EDculos existentes para la vigencia seleccionada.<br>'),
'',
unistr('<b>2.</b> Insertar un grupo de veh\00EDculos: seleccione la vigencia y hacer clic en el bot\00F3n Nuevo Grupo, se abrir\00E1 una ventana para diligenciar los datos del veh\00EDculo, ingrese los datos obligatorios, hacer clic en el bot\00F3n Insertar para guardar el regi')
||'stro.<br>',
'',
unistr('<b>3.</b> Modificar un grupo de veh\00EDculos: seleccione la vigencia y hacer clic en el bot\00F3n Consultar, se mostrar\00E1 en la parte inferior de los par\00E1metros de b\00FAsqueda los grupos de veh\00EDculos existentes para la vigencia seleccionada, hacer clic en el \00EDc')
||unistr('ono de l\00E1piz del registro que desea modificar, se abrir\00E1 una ventana con los datos del registro seleccionado del veh\00EDculo, realice las modificaciones necesarias al registro y hacer clic en el bot\00F3n Aplicar Cambios para guardar los cambios.<br>'),
'',
unistr('<b>4.</b> Eliminar un grupo de veh\00EDculos: seleccione la vigencia y hacer clic en el bot\00F3n Consultar, se mostrara en la parte inferior de los par\00E1metros de b\00FAsqueda los grupos de veh\00EDculos existentes para la vigencia seleccionada, hacer clic en el \00EDco')
||unistr('no de l\00E1piz del registro que desea eliminar, se abrir\00E1 una ventana con los datos del registro seleccionado del veh\00EDculo, hacer clic en el bot\00F3n Eliminar para eliminar el registro.<br>'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'        </i>',
'        </i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36335338945352203)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P97_VGNCIA'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(99831628248444646)
,p_plug_name=>unistr('Informe de grupos de veh\00EDculos')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_vhclo_grpo,',
'       cdgo_vhclo_clse,',
'       nmbre_vhclo_clse,',
'       nmbre_vhclo_ctgtria,',
'       nmbre_vhclo_mrca,',
'       dscrpcion_vhclo_lnea, ',
'       clndrje_dsde, ',
'       clndrje_hsta, ',
'       cpcdad_dsde, ',
'       cpcdad_hsta, ',
'       dscrpcion_vhclo_srvcio, ',
'       dscrpcion_vhclo_oprcion,',
'       dscrpcion_vhclo_crrcria, ',
'       grpo ',
'  from v_df_s_vehiculos_grupo',
' where vgncia = :P97_VGNCIA',
' order by grpo	'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P97_VGNCIA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(99831702914444646)
,p_name=>unistr('Informe de grupos de veh\00EDculos')
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No se encontraron datos de grupos en la vigencia seleccionada'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:98:&SESSION.::&DEBUG.:RP,98:P98_ID_VHCLO_GRPO,P98_CLSE_VHCLO:#ID_VHCLO_GRPO#,#CDGO_VHCLO_CLSE#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'AURUETA'
,p_internal_uid=>99831702914444646
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99836834354444670)
,p_db_column_name=>'GRPO'
,p_display_order=>10
,p_column_identifier=>'M'
,p_column_label=>'Grupo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99832141282444660)
,p_db_column_name=>'ID_VHCLO_GRPO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Id Vhclo Grpo'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96897173325650718)
,p_db_column_name=>'NMBRE_VHCLO_CLSE'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>unistr('Clase de Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96897223655650719)
,p_db_column_name=>'NMBRE_VHCLO_CTGTRIA'
,p_display_order=>40
,p_column_identifier=>'O'
,p_column_label=>unistr('Categor\00EDa de Veh\00EDculo')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96897380229650720)
,p_db_column_name=>'NMBRE_VHCLO_MRCA'
,p_display_order=>50
,p_column_identifier=>'P'
,p_column_label=>'Marca'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96897481662650721)
,p_db_column_name=>'DSCRPCION_VHCLO_LNEA'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>unistr('L\00EDnea')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96897522575650722)
,p_db_column_name=>'DSCRPCION_VHCLO_SRVCIO'
,p_display_order=>70
,p_column_identifier=>'R'
,p_column_label=>'Servicio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96897611639650723)
,p_db_column_name=>'DSCRPCION_VHCLO_OPRCION'
,p_display_order=>80
,p_column_identifier=>'S'
,p_column_label=>unistr('Operaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96897706403650724)
,p_db_column_name=>'DSCRPCION_VHCLO_CRRCRIA'
,p_display_order=>90
,p_column_identifier=>'T'
,p_column_label=>unistr('Carrocer\00EDa')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(96898862059650735)
,p_db_column_name=>'CDGO_VHCLO_CLSE'
,p_display_order=>100
,p_column_identifier=>'U'
,p_column_label=>'Cdgo vhclo clse'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99834022663444668)
,p_db_column_name=>'CLNDRJE_DSDE'
,p_display_order=>110
,p_column_identifier=>'F'
,p_column_label=>'Cilindraje Inicial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99834455301444668)
,p_db_column_name=>'CLNDRJE_HSTA'
,p_display_order=>120
,p_column_identifier=>'G'
,p_column_label=>'Cilindraje Final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99834887742444668)
,p_db_column_name=>'CPCDAD_DSDE'
,p_display_order=>130
,p_column_identifier=>'H'
,p_column_label=>'Capacidad Inicial'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(99835223830444668)
,p_db_column_name=>'CPCDAD_HSTA'
,p_display_order=>140
,p_column_identifier=>'I'
,p_column_label=>'Capacidad Final'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(99845257116482226)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'998453'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GRPO:NMBRE_VHCLO_CLSE:NMBRE_VHCLO_CTGTRIA:NMBRE_VHCLO_MRCA:DSCRPCION_VHCLO_LNEA:DSCRPCION_VHCLO_SRVCIO:DSCRPCION_VHCLO_OPRCION:DSCRPCION_VHCLO_CRRCRIA:CLNDRJE_DSDE:CLNDRJE_HSTA:CPCDAD_DSDE:CPCDAD_HSTA:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109555818257986201)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(96897823856650725)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(36335338945352203)
,p_button_name=>'BTN_NUEVO_GRUPO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nuevo grupo'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:98:&SESSION.::&DEBUG.:RP,98:P98_VGNCIA:&P97_VGNCIA.'
,p_button_condition=>'P97_VGNCIA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-window-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(40424182607601446)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(109555818257986201)
,p_button_name=>'CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_button_cattributes=>'style="margin: 4px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96897018062650717)
,p_name=>'P97_VGNCIA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(109555818257986201)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_VIGENCIAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VGNCIA as d,',
'       VGNCIA as r',
'  from DF_S_VIGENCIAS',
' order by 1 desc'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione una vigencia'
,p_cHeight=>1
,p_grid_column=>4
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(96898692100650733)
,p_name=>'Al cerrar dialogo'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(96898734154650734)
,p_event_id=>wwv_flow_api.id(96898692100650733)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(99831628248444646)
,p_stop_execution_on_error=>'Y'
);
end;
/
