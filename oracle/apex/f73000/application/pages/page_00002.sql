prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Series'
,p_step_title=>'Series'
,p_footer_text=>'jsajaslkasxaa'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=12'
,p_javascript_code=>unistr('var htmldb_delete_message=''\00BFEst\00E1 seguro que desea eliminar el registro?'';')
,p_javascript_code_onload=>'mostrarAyudaD();'
,p_step_template=>wwv_flow_api.id(76345756650582452)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191108094303'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4790588513844211)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
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
unistr('Funcionalidad que permite ingresar, consultar, modificar, eliminar Series y Subseries de la gesti\00F3n documental.'),
'<br> <br>',
unistr('<b>1.</b> Ingresar una nueva serie/subserie hacer clic en el bot\00F3n Nueva Serie/Subserie, diligenciar el formulario y hacer clic en el bot\00F3n insertar, la nueva nueva Serie/Subserie se mostrar\00E1 en el arbol de la regi\00F3n izquierda.<br> <br>'),
unistr('  <b>2. </b> Consultar los datos de una Serie/Subserie, hacer doble clic en la Serie/Subserie de su elecci\00F3n ubicada en el \00E1rbol de la regi\00F3n izquierda, se mostrar\00E1 en la regi\00F3n central los datos de la serie/subserie seleccionada.<br> <br>'),
unistr(' <b>3.</b> Para modificar los datos de una Serie/Subserie, deber\00E1 consultar datos de la Serie/Subserie, realizar las modificaciones y hacer clic en el bot\00F3n Aplicar Cambios. <br> <br>'),
unistr(' <b>4.</b> Para eliminar una serie/subserie, deber\00E1 consultar datos de la Serie/Subserie y hacer clic en el bot\00F3n eliminar.'),
' <br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5274840349384839)
,p_plug_name=>'Series'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-right-lg'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0 when level = 1 then 1 else -1 end as status,',
'        level,',
'        nmbre_srie,',
'        obsrvcion,',
'        id_srie,',
'        case when connect_by_isleaf = 1 then  ''fa-folder-o''',
'        else ''fa-folders'' end icon,',
'        apex_util.prepare_url(''f?p=73000:2:''||v(''APP_SESSION'')||''::NO::P2_ID_SRIE:'' || id_srie ) url',
'  from gd_d_series',
' where cdgo_clnte = :F_CDGO_CLNTE',
' start with id_srie_pdre is null',
'connect by prior id_srie = id_srie_pdre',
'  order siblings by nmbre_srie'))
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'D'
,p_attribute_03=>'P2_ID_SRIE'
,p_attribute_04=>'DB'
,p_attribute_08=>'fa'
,p_attribute_10=>'NMBRE_SRIE'
,p_attribute_11=>'LEVEL'
,p_attribute_12=>'ICON'
,p_attribute_15=>'STATUS'
,p_attribute_20=>'ID_SRIE'
,p_attribute_22=>'OBSRVCION'
,p_attribute_23=>'LEVEL'
,p_attribute_24=>'URL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5275087110384841)
,p_plug_name=>'Series'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27369946075119907)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'  <br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2_CDGO_SRIE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5577214924195910)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(27369946075119907)
,p_button_name=>'NEW'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Nueva Serie/Subserie'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2::'
,p_button_condition=>'P2_ID_SRIE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-folder-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5577122128195909)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(5275087110384841)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P2_ID_SRIE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5577043173195908)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5275087110384841)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar cambios'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P2_ID_SRIE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5576984073195907)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5275087110384841)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P2_ID_SRIE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5577328075195911)
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5577122128195909)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5275288523384843)
,p_name=>'P2_ID_SRIE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_SRIE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5275325994384844)
,p_name=>'P2_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5275431738384845)
,p_name=>'P2_CDGO_SRIE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('C\00F3digo')
,p_source=>'CDGO_SRIE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>7
,p_tag_attributes=>'onkeypress="return validarExpresion(event,''letraNumeroGuion'')"'
,p_colspan=>5
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese el c\00F3digo de la Serie/Subserie, debe cumplir con el formato XXX-###')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5275576160384846)
,p_name=>'P2_NMBRE_SRIE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Nombre'
,p_source=>'NMBRE_SRIE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''letraGuion'')"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Ingrese el nombre de la Serie/Subserie.<br>Debe tener solo un espacio o guion (-) entre palabras.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5275696567384847)
,p_name=>'P2_ID_SRIE_PDRE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Serie Padre'
,p_source=>'ID_SRIE_PDRE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_srie',
'     , id_srie',
'  from gd_d_series',
' where id_srie != nvl(:P2_ID_SRIE, 0)',
'   and id_srie_pdre is null',
'   order by nmbre_srie'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione de la lista la serie padre que corresponda.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5275708314384848)
,p_name=>'P2_FCHA_INCIO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_item_default=>'sysdate'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Fecha Inicio'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_INCIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>9
,p_cMaxlength=>10
,p_tag_attributes=>'onkeydown="return false"'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha de incio del documento. Formato dd/mm/yyyy'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_06=>'2'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5275848082384849)
,p_name=>'P2_FCHA_FIN'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fecha Fin'
,p_format_mask=>'dd/mm/yyyy'
,p_source=>'FCHA_FIN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>9
,p_cMaxlength=>10
,p_tag_attributes=>'onkeypress="return false"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_column=>6
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese la fecha fin de la Serie/Subserie. Formato dd/mm/yyyy'
,p_attribute_02=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'Y'
,p_attribute_06=>'2'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5275949901384850)
,p_name=>'P2_OBSRVCION'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Observaci\00F3n')
,p_source=>'OBSRVCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_colspan=>10
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>unistr('Ingrese la observaci\00F3n correspondiente a la Serie/Subserie. M\00E1ximo 1000 caracteres')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5576328890195901)
,p_name=>'P2_ACTVO'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(5275087110384841)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00BFActivo?')
,p_source=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione "S\00ED" para activar la Serie/Subserie y "No" para desactivarla.')
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>unistr('S\00ED')
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33574658893166501)
,p_validation_name=>unistr('validar que el c\00F3digo ')
,p_validation_sequence=>10
,p_validation=>'return pkg_gn_generalidades.fnc_vl_expresion(p_cdgo_exp => ''GSC'', p_vlor => :P2_CDGO_SRIE );'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(5275431738384845)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33390702921802705)
,p_validation_name=>unistr('Valida nombre con un solo espacio despu\00E9s de cada palabra')
,p_validation_sequence=>20
,p_validation=>'return pkg_gn_generalidades.fnc_vl_expresion(p_cdgo_exp => ''GSN'', p_vlor => :P2_NMBRE_SRIE );'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(5275576160384846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5576669502195904)
,p_name=>'al soltar la tecla'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_CDGO_SRIE'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5576731351195905)
,p_event_id=>wwv_flow_api.id(5576669502195904)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'campoMayuscula(this.triggeringElement);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33390531743802703)
,p_name=>'Al cambiar fecha inicio'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_FCHA_INCIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33390650155802704)
,p_event_id=>wwv_flow_api.id(33390531743802703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P2_FCHA_FIN").datepicker( ''option'' , ''minDate'' , $("#P2_FCHA_INCIO").val());',
'$(".ui-datepicker-trigger").attr( "class" , "ui-datepicker-trigger a-Button a-Button--calendar" );'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5576884712195906)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Automatic Row Processing '
,p_attribute_02=>'GD_D_SERIES'
,p_attribute_03=>'P2_ID_SRIE'
,p_attribute_04=>'ID_SRIE'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Proceso realizado con \00E9xito!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5576419326195902)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Automatic Row Fetch'
,p_attribute_02=>'GD_D_SERIES'
,p_attribute_03=>'P2_ID_SRIE'
,p_attribute_04=>'ID_SRIE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
