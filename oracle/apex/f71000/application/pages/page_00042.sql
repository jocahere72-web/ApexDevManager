prompt --application/pages/page_00042
begin
wwv_flow_api.create_page(
 p_id=>42
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Generaci\00F3n de Convenio - Solicitante')
,p_step_title=>unistr('Generaci\00F3n de Convenio - Solicitante')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function mayuscula(id) {',
'  $("#" + id).val(',
'    $("#" + id)',
'      .val()',
'      .toUpperCase()',
'  );',
'}',
'',
'function buttonCollapse(id) {',
'  if ($("#" + id).attr("aria-expanded") == "true") {',
'    $("#" + id).click();',
'  }',
'}'))
,p_javascript_code_onload=>'buttonCollapse(''t_Button_rightControlButton'');'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101165025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43445648444066308)
,p_plug_name=>'Solicitante'
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall'
,p_plug_template=>wwv_flow_api.id(177337797773050609)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(43441465037066295)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(177351601973050625)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43445706373066308)
,p_plug_name=>'Datos de Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(43445648444066308)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177322596503050602)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43326327326292128)
,p_plug_name=>'Datos de Notificacion'
,p_parent_plug_id=>wwv_flow_api.id(43445706373066308)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43327188464292136)
,p_plug_name=>'Datos Solicitante'
,p_parent_plug_id=>wwv_flow_api.id(43445706373066308)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'    ',
''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(44672963729380802)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'<i>',
'    <p align="justify"> Funcionalidad de Convenio de pagos.<br> ',
'        <b> <center> Paso 2 Datos del Solicitante </center> </b>',
unistr('        Se debe ingresar los datos b\00E1sicos del solicitante, junto con las informaci\00F3n de notificaci\00F3n. <br>   <br>      '),
unistr('        La informaci\00F3n de notificaci\00F3n sera utilizada para comunicarle y/o notificar al solicitante cualquier desici\00F3n o novedad sobre la solicitud del convenio o del convenio. <br> <br> '),
'        Los items marcados con (<i style="color:#FF0000";>*</i>) son obligatorios. ',
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(72233952854000401)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(43327188464292136)
,p_button_name=>'Nuevo'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Nuevo'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43447408035066308)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(43445648444066308)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP,41,42,43,44,47,70::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43447753645066308)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(43445648444066308)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-chevron-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43447640411066308)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(43445648444066308)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355657869050631)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(43449217200066309)
,p_branch_name=>unistr('Ir a P\00E1gina 43')
,p_branch_action=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.::P43_PAIS,P43_MNCIPIO,P43_DPRTMNTO:&P42_ID_PAIS.,&P42_ID_MNCPIO.,&P42_ID_DPRTMNTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43447753645066308)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(43448594665066309)
,p_branch_action=>'f?p=&APP_ID.:41:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(43447640411066308)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43325726609292122)
,p_name=>'P42_NMRO_IDNTFCCION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(43327188464292136)
,p_prompt=>'Identificacion'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('N\00FAmero de identificaci\00F3n del Solicitante. '),
'Este Campo es Obligatorio. '))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43325851682292123)
,p_name=>'P42_PRMER_NMBRE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(43327188464292136)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Primer Nombre del solicitante. ',
'Este Campo es Obligatorio.'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43325947164292124)
,p_name=>'P42_SGNDO_NMBRE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(43327188464292136)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Segundo Nombre del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43326099430292125)
,p_name=>'P42_PRMER_APLLDO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(43327188464292136)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Primer Apellido del solicitante. ',
'Este Campo es Obligatorio.'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43326113172292126)
,p_name=>'P42_SGNDO_APLLDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(43327188464292136)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Segundo Nombre del solicitante.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43326404539292129)
,p_name=>'P42_ID_PAIS'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(43326327326292128)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_pais    number;',
'    ',
'begin ',
'    select id_pais ',
'      into v_id_pais ',
'      from df_s_clientes ',
'     where cdgo_clnte = :F_CDGO_CLNTE;',
'    return v_id_pais;',
'end;',
'',
''))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>unistr('Pa\00EDs')
,p_source=>'ID_PAIS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_PAIS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_pais as d,',
'       id_pais  as r',
'  from df_s_paises',
' order by 1'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Pa\00EDs de notificaci\00F3n del solicitante. '),
'Este Campo es Obligatorio.'))
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250px'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43326572211292130)
,p_name=>'P42_DIRECCION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43326327326292128)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Direcci\00F3n de notificaci\00F3n del solicitante. La direcci\00F3n ingresada sera la usada para informar y/o notificar al solicitante las desiciones o novedades sobre la solicitud de convenio o el convenio.'),
'Este Campo es Obligatorio.'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43326653637292131)
,p_name=>'P42_ID_MNCPIO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(43326327326292128)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Municipio'
,p_source=>'ID_MNCPIO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_mncpio), ',
'        id_mncpio ',
'   from df_s_municipios',
'  where id_dprtmnto = :P42_ID_DPRTMNTO'))
,p_lov_cascade_parent_items=>'P42_ID_DPRTMNTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Municipio de notificaci\00F3n del solicitante. '),
'Este Campo es Obligatorio.'))
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250px'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43326766698292132)
,p_name=>'P42_ID_DPRTMNTO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(43326327326292128)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_dprtmnto    number;',
'    ',
'begin ',
'    select id_dprtmnto ',
'      into v_id_dprtmnto ',
'      from df_s_clientes ',
'     where cdgo_clnte = :F_CDGO_CLNTE;',
'    return v_id_dprtmnto;',
'end;',
'',
''))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Departamento'
,p_source=>'ID_DPRTMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(nmbre_dprtmnto), ',
'        id_dprtmnto ',
'   from df_s_departamentos ',
'  where id_pais =:P42_ID_PAIS'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P42_ID_PAIS'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Departamento de notificaci\00F3n del solicitante. '),
'Este Campo es Obligatorio.'))
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250px'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43326825258292133)
,p_name=>'P42_TLFNO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(43326327326292128)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>40
,p_tag_attributes=>'onkeyup="mayuscula(this.id)"'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Tel\00E9fono de notificaci\00F3n del solicitante. '),
'Este Campo es Obligatorio.'))
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43326983434292134)
,p_name=>'P42_EMAIL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(43326327326292128)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Correo electr\00F3nico de notificaci\00F3n del solicitante. '),
'Este Campo es Obligatorio.'))
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43447187187066308)
,p_name=>'P42_TIPO_IDENTIFICACION'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43327188464292136)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Lista de Tipo de identificaci\00F3n del Solicitante. '),
'Este Campo es Obligatorio. '))
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'250px'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(43327060797292135)
,p_validation_name=>'Nuevo'
,p_validation_sequence=>10
,p_validation=>'P42_EMAIL'
,p_validation2=>'@'
,p_validation_type=>'ITEM_IN_VALIDATION_CONTAINS_AT_LEAST_ONE_CHAR_IN_STRING2'
,p_error_message=>unistr('Debe introducir correo electr\00F3nico valido')
,p_associated_item=>wwv_flow_api.id(43326983434292134)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
