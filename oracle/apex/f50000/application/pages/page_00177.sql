prompt --application/pages/page_00177
begin
wwv_flow_api.create_page(
 p_id=>177
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Entidades'
,p_step_title=>'Entidades'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).on("scroll",function() {',
'  apex.navigation.dialog.close(true);',
'});',
''))
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_step_template=>wwv_flow_api.id(29519719109068494)
,p_page_css_classes=>'parametroBusqueda1'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(99268463186773832)
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20210105160118'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103844580131687353)
,p_plug_name=>'Entidades'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29551431083068507)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_entdad',
'	, dscrpcion_entdad_tpo',
'	, dscrpcion_idntfccion_tpo',
'	, idntfccion',
'	, nmbre_rzon_scial',
'	, drccion',
'	, nmbre_pais',
'	, nmbre_dprtmnto',
'	, nmbre_mncpio',
'    , dscrpcion_indcdor_mnja_cntro_ese',
'from v_df_s_entidades    ',
'where cdgo_entdad_tpo    = :P177_CDGO_ENTDAD_TPO',
'    and (idntfccion      = :P177_IDNTFCCION      or :P177_IDNTFCCION is null)',
'    and (id_dprtmnto     = :P177_ID_DPRTMNTO     or :P177_ID_DPRTMNTO is null)',
'    and (id_mncpio       = :P177_ID_MNCPIO       or :P177_ID_MNCPIO is null)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(103844964994687353)
,p_name=>'Informe de Actos'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>unistr('El recuento m\00E1ximo de filas de este informe es #MAX_ROW_COUNT# filas. Aplique un filtro para reducir el n\00FAmero de registros de la consulta.')
,p_no_data_found_message=>unistr('No se ha encontrado ning\00FAn dato.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:178:&SESSION.::&DEBUG.:RP,178:P178_ID_ENTDAD:#ID_ENTDAD#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Editar">'
,p_owner=>'AMOLINA'
,p_internal_uid=>103844964994687353
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85744220207479149)
,p_db_column_name=>'ID_ENTDAD'
,p_display_order=>10
,p_column_identifier=>'R'
,p_column_label=>'Id Entdad'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85841272521415411)
,p_db_column_name=>'DSCRPCION_ENTDAD_TPO'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Tipo Entidad'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85841304048415412)
,p_db_column_name=>'DSCRPCION_IDNTFCCION_TPO'
,p_display_order=>50
,p_column_identifier=>'AE'
,p_column_label=>unistr('Tipo Identificaci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85840399591415402)
,p_db_column_name=>'IDNTFCCION'
,p_display_order=>60
,p_column_identifier=>'U'
,p_column_label=>unistr('Identificaci\00F3n')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85840438439415403)
,p_db_column_name=>'NMBRE_RZON_SCIAL'
,p_display_order=>70
,p_column_identifier=>'V'
,p_column_label=>unistr('Raz\00F3n Social')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85840506944415404)
,p_db_column_name=>'DRCCION'
,p_display_order=>80
,p_column_identifier=>'W'
,p_column_label=>unistr('Direcci\00F3n')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85841488203415413)
,p_db_column_name=>'NMBRE_PAIS'
,p_display_order=>100
,p_column_identifier=>'AF'
,p_column_label=>unistr('Pa\00EDs')
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85841526278415414)
,p_db_column_name=>'NMBRE_DPRTMNTO'
,p_display_order=>120
,p_column_identifier=>'AG'
,p_column_label=>'Departamento'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(85841668124415415)
,p_db_column_name=>'NMBRE_MNCPIO'
,p_display_order=>140
,p_column_identifier=>'AH'
,p_column_label=>'Municipio'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(103393001137947801)
,p_db_column_name=>'DSCRPCION_INDCDOR_MNJA_CNTRO_ESE'
,p_display_order=>150
,p_column_identifier=>'AI'
,p_column_label=>unistr('\00BFManeja Contrato de ESE?')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(103865040938688442)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'858343'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DSCRPCION_ENTDAD_TPO:DSCRPCION_IDNTFCCION_TPO:IDNTFCCION:NMBRE_RZON_SCIAL:DRCCION:NMBRE_PAIS:NMBRE_DPRTMNTO:NMBRE_MNCPIO:DSCRPCION_INDCDOR_MNJA_CNTRO_ESE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103867210118724018)
,p_plug_name=>'Opciones'
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
'            <center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(103867454549724021)
,p_plug_name=>unistr('<b>Par\00E1metros de Busqueda</b>')
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
 p_id=>wwv_flow_api.id(288998397592752801)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda<i class="fa fa-question-circle" aria-hidden="true"></center></i>',
'    </b>',
'</h5>',
'<i>',
'    Funcionalidad que permite ingresar, consultar, modificar y eliminar:<br><br>',
'    <b>1. </b>Entidad por Tipo de Entidad<br><br>	',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(85835012577406565)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(103867210118724018)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&P177_BRANCH_APP.:&P177_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(85835467542406565)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(103867210118724018)
,p_button_name=>'BTN_NUEVO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Entidad'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:178:&SESSION.::&DEBUG.:RP,178::'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(85836457892406566)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(103867454549724021)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(29604728434068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85836868293406567)
,p_name=>'P177_CDGO_ENTDAD_TPO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(103867454549724021)
,p_prompt=>'Tipo de Entidad'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_ENTIDADES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_entdad_tpo as r',
'  from df_s_entidades_tipo',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(29604328976068538)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista el Tipo de Entidad a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85837783562406571)
,p_name=>'P177_ID_DPRTMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(103867454549724021)
,p_prompt=>'Departamento'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_DEPARTAMENTOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_DPRTMNTO as d,',
'       ID_DPRTMNTO as r',
'  from DF_S_DEPARTAMENTOS',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el Departamento a consultar.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85838516700406572)
,p_name=>'P177_BRANCH_APP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(103867454549724021)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85838989409406573)
,p_name=>'P177_BRANCH_PAGE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(103867454549724021)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85841704230415416)
,p_name=>'P177_ID_MNCPIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(103867454549724021)
,p_prompt=>'Municipio'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_mncpio,  id_mncpio',
'  from DF_S_MUNICIPIOS ',
' where id_dprtmnto  = :P177_ID_DPRTMNTO'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P177_ID_DPRTMNTO'
,p_ajax_items_to_submit=>'P177_ID_DPRTMNTO,P177_ID_MNCPIO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el Municipio a consultar'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(85841810520415417)
,p_name=>'P177_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(103867454549724021)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(29604040443068537)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la Identificaci\00F3n a consultar')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(85839384407406583)
,p_name=>'Al cerrar modal'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(85839841340406585)
,p_event_id=>wwv_flow_api.id(85839384407406583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(103844580131687353)
,p_stop_execution_on_error=>'Y'
);
end;
/
