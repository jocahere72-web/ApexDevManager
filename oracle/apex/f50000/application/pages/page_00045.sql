prompt --application/pages/page_00045
begin
wwv_flow_api.create_page(
 p_id=>45
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Calculo de Clasificacion'
,p_step_title=>unistr('C\00E1lculo de Clasificacion')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});',
'',
'',
'',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'.tooltip {',
'    position: relative;',
'    display: inline-block;',
'    border-bottom: 1px dotted black;',
'}',
'',
'',
'.tooltip .tooltiptext {',
'    visibility: hidden;',
'    width: 120px;',
'    background-color: Gray;',
'    color: white;',
'    text-align: center;',
'    border-radius: 6px;',
'    padding: 5px 0;',
'',
'    /* Position the tooltip */',
'   position: static;',
'    z-index: 1;',
'}',
'',
'',
'.tooltip:hover .tooltiptext {',
'    visibility: visible;',
'}'))
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20201222101359'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2738506062918401)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
unistr('Funcionalidad que permite ingresar, consultar, modificar y eliminar C\00E1lculos de Clasificaci\00F3n de Predios basados en caracter\00EDsticas.<br><br>'),
'',
unistr('<b>1. </b> Consulta de c\00E1lculo de clasificaci\00F3n: Seleccionar en la regi\00F3n de par\00E1metros de b\00FAsqueda los datos relacionados a la consulta a realizar, hacer clic en el bot\00F3n Consultar. Para limpiar los campos de b\00FAsqueda hacer clic en el bot\00F3n Restable')
||'cer.<br>',
'',
unistr('<b>2. </b> Ingresar un nuevo c\00E1lculo de clasificaci\00F3n: hacer clic en el bot\00F3n Nuevo C\00E1lculo Clasificaci\00F3n, se mostrar\00E1 una ventana para diligenciar los datos del c\00E1lculo clarificaci\00F3n, ingreso los datos requeridos y hacer clic en el bot\00F3n insertar.<b')
||'r>',
'',
unistr('<b>3. </b> Modificar un c\00E1lculo de clasificaci\00F3n: Hacer clic en el \00EDcono de l\00E1piz del c\00E1lculo de clasificaci\00F3n de su elecci\00F3n, se mostrar\00E1 una ventana con los datos del c\00E1lculo clarificaci\00F3n seleccionado, realice las modificaciones y hacer clic en el')
||unistr(' bot\00F3n Aplicar Cambios.<br>'),
'',
unistr('<b>4. </b> Eliminar un c\00E1lculo de clasificaci\00F3n: Hacer clic en el \00EDcono de l\00E1piz del c\00E1lculo de clasificaci\00F3n de su elecci\00F3n, se mostrar\00E1 una ventana con los datos del c\00E1lculo clarificaci\00F3n seleccionado, hacer clic en el bot\00F3n eliminar.  <br>'),
'',
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170666610455120115)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--textContent:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(674509363309623867)
,p_plug_name=>unistr('Par\00E1metros de B\00FAsqueda')
,p_region_name=>'search'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29541487623068504)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(676105284038471388)
,p_plug_name=>unistr('C\00E1lculo Clasificaci\00F3n Predios')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prdio_clclo_clsfccion,',
'       cdgo_clnte,',
'       id_impsto,',
'       cdgo_prdio_clsfccion,',
'       crcter_incial,',
'       crcter_fnal,',
'       trunc(fcha_incial) fcha_incial,',
'       trunc(fcha_fnal) fcha_fnal,',
'       nmro_crcter,',
'       nmbre_impsto',
'  from v_gi_d_predios_clclo_clsfccion',
' where cdgo_clnte = :F_CDGO_CLNTE',
'  and (id_impsto = :P45_IMPUESTO or :P45_IMPUESTO is null)',
'  and ((cdgo_prdio_clsfccion = :p45_clasificacion_predios) or (:p45_clasificacion_predios is null))',
'  and ((fcha_incial = :P45_FECHA_INICIAL and fcha_fnal = :P45_FECHA_FIN) ',
'       or (fcha_incial = :P45_FECHA_INICIAL and :P45_FECHA_FIN is null)',
'       or (:P45_FECHA_INICIAL is null and fcha_fnal = :P45_FECHA_FIN )',
'       or (:P45_FECHA_INICIAL is null and :P45_FECHA_FIN is null))',
' ',
'   '))
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
 p_id=>wwv_flow_api.id(2365085741084718)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('No existe C\00E1lculo de Clasificaci\00F3n para este Impuesto.')
,p_max_rows_per_page=>'50'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:RP:P104_ID_PRDIO_CLCLO_CLSFCCION:#ID_PRDIO_CLCLO_CLSFCCION#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JALCOCER'
,p_internal_uid=>2365085741084718
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365126507084719)
,p_db_column_name=>'ID_PRDIO_CLCLO_CLSFCCION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id Prdio Clclo Clsfccion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365231053084720)
,p_db_column_name=>'CDGO_CLNTE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Cdgo Clnte'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365396580084721)
,p_db_column_name=>'ID_IMPSTO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Id Impsto'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365455768084722)
,p_db_column_name=>'CDGO_PRDIO_CLSFCCION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Clasificaci\00F3n Predio')
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(170000125035201240)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365521542084723)
,p_db_column_name=>'CRCTER_INCIAL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Car\00E1cter Inicial')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365622582084724)
,p_db_column_name=>'CRCTER_FNAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Car\00E1cter Final')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365783748084725)
,p_db_column_name=>'FCHA_INCIAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Fecha Inicial'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365864842084726)
,p_db_column_name=>'FCHA_FNAL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Fecha Final'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2365968456084727)
,p_db_column_name=>'NMRO_CRCTER'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Nmro Crcter'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(26636252865962705)
,p_db_column_name=>'NMBRE_IMPSTO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tributo'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2542570197016889)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'25426'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NMBRE_IMPSTO:CDGO_PRDIO_CLSFCCION:CRCTER_INCIAL:CRCTER_FNAL:FCHA_INCIAL:FCHA_FNAL:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(37262286698179901)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(170666610455120115)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P45_BRANCH_APP.:&P45_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2366622517084734)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(170666610455120115)
,p_button_name=>'Btn_Nuevo'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Nuevo<br> C\00E1lculo Clasificaci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:RP,104::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(34796511236791440)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(674509363309623867)
,p_button_name=>'BTN_LMPIAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Restablecer'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:RP,45::'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(169997409628201201)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(674509363309623867)
,p_button_name=>'Btn_Buscar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BOTTOM'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33990066248452802)
,p_name=>'P45_BRANCH_PAGE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(674509363309623867)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37279141687668403)
,p_name=>'P45_BRANCH_APP'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(674509363309623867)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(169227336521824647)
,p_name=>'P45_FECHA_FIN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(674509363309623867)
,p_prompt=>'Fecha Final'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'P'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(169998207108201209)
,p_name=>'P45_IMPUESTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(674509363309623867)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(nmbre_impsto) || '' ['' || cdgo_impsto || '']'' as d, ',
'       id_impsto as r',
'  from v_df_c_impuestos',
' where cdgo_clnte = :F_CDGO_CLNTE',
'       and actvo = ''S''',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(169998677841201210)
,p_name=>'P45_CLASIFICACION_PREDIOS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(674509363309623867)
,p_prompt=>unistr('Clasificaci\00F3n Predio')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CLASIFICACION_PREDIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(169999012079201212)
,p_name=>'P45_FECHA_INICIAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(674509363309623867)
,p_prompt=>'Fecha Inicial'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false"'
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'P'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(169227129136824645)
,p_name=>'Set_Fecha_Min'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P45_VIGENCIA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(169227270016824646)
,p_event_id=>wwv_flow_api.id(169227129136824645)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P45_FECHA_INICIAL'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$s("P45_FECHA_MIN" , $v("P45_VIGENCIA") + ''011'');',
'',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(169227648117824650)
,p_event_id=>wwv_flow_api.id(169227129136824645)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P45_FECHA_FIN'
,p_attribute_01=>'$s("P45_FECHA_MAX" , $v("P45_VIGENCIA") + ''1231'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2366435415084732)
,p_name=>'Refresh_IR'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(676105284038471388)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2366538339084733)
,p_event_id=>wwv_flow_api.id(2366435415084732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(676105284038471388)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2366748905084735)
,p_name=>'Refrescar_IR'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2366622517084734)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2366819826084736)
,p_event_id=>wwv_flow_api.id(2366748905084735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(676105284038471388)
,p_stop_execution_on_error=>'Y'
);
end;
/
