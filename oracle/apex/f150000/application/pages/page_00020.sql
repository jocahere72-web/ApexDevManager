prompt --application/pages/page_00020
begin
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Declaraciones Licencias'
,p_step_title=>'Declaraciones Licencias'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200721190339'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(150500565899135092)
,p_plug_name=>unistr('Gesti\00F3n licencias')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(150501826048135105)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(150501989996135106)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<i>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('Funcionalidad que permite registrar las licencias concedidas para el impuesto de delineaci\00F3n urbana.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76766779437142303)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(150501826048135105)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P20_ID_DCLRCION_LCNCIA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76767583508142315)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(150501826048135105)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P20_ID_DCLRCION_LCNCIA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76767122562142314)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(150501826048135105)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P20_ID_DCLRCION_LCNCIA'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76767942588142315)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(150501826048135105)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76582832813946946)
,p_name=>'P20_ID_SJTO_IMPSTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76582929051946947)
,p_name=>'P20_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_prompt=>unistr('Tipo Identificaci\00F3n Solicitante')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion_idntfccion_tpo,',
'        a.cdgo_idntfccion_tpo',
'from    df_s_identificaciones_tipo  a',
'order by    a.dscrpcion_idntfccion_tpo;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76583088812946948)
,p_name=>'P20_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_prompt=>unistr('Identificaci\00F3n Solicitante')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76768317401142316)
,p_name=>'P20_APLCCION_ORGEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(150501826048135105)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76768794601142319)
,p_name=>'P20_PGNA_ORGEN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(150501826048135105)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76769477592142319)
,p_name=>'P20_ID_DCLRCION_LCNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_DCLRCION_LCNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76769814447142321)
,p_name=>'P20_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_use_cache_before_default=>'NO'
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_source=>'CDGO_CLNTE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76770206276142321)
,p_name=>'P20_RDCDO_LCNCIA'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Radicado Licencia'
,p_source=>'RDCDO_LCNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76770638099142321)
,p_name=>'P20_LCNCIA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Licencia'
,p_source=>'LCNCIA'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76771024301142322)
,p_name=>'P20_FCHA_EXPDCION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha Expedici\00F3n')
,p_source=>'FCHA_EXPDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76771454559142323)
,p_name=>'P20_FCHA_VCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Fecha Vencimiento Expedici\00F3n')
,p_source=>'FCHA_VCMNTO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78322688139004204)
,p_name=>'P20_ID_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(150500565899135092)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(76583149820946949)
,p_computation_sequence=>10
,p_computation_item=>'P20_CDGO_IDNTFCCION_TPO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_idntfccion_tpo',
'from    si_i_personas   a',
'where   a.id_sjto_impsto    =   :P20_ID_SJTO_IMPSTO;'))
,p_compute_when=>'P20_ID_SJTO_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(76583246983946950)
,p_computation_sequence=>20
,p_computation_item=>'P20_IDNTFCCION_SJTO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.idntfccion_sjto',
'from    v_si_i_sujetos_impuesto a',
'where   a.id_sjto_impsto    =   :P20_ID_SJTO_IMPSTO;'))
,p_compute_when=>'P20_ID_SJTO_IMPSTO'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(76582747362946945)
,p_validation_name=>'Validar registros duplicados'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_g_dclrcnes_lcncia    a',
'where   a.cdgo_clnte    =   :F_CDGO_CLNTE',
'and     (',
'            a.rdcdo_lcncia  =   :P20_RDCDO_LCNCIA or ',
'            a.lcncia        =   :P20_LCNCIA',
'        );'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'Los valores gestionados ya se encuentran registrador.'
,p_when_button_pressed=>wwv_flow_api.id(76766779437142303)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76771885062142341)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from gi_g_dclrcnes_lcncia'
,p_attribute_02=>'GI_G_DCLRCNES_LCNCIA'
,p_attribute_03=>'P20_ID_DCLRCION_LCNCIA'
,p_attribute_04=>'ID_DCLRCION_LCNCIA'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P20_ID_DCLRCION_LCNCIA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78323193328004209)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consultar P20_ID_SJTO_IMPSTO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  a.id_sjto_impsto',
'    into    :P20_ID_SJTO_IMPSTO',
'    from    v_si_i_sujetos_impuesto a',
'    join    si_i_personas           b   on  b.id_sjto_impsto    =   a.id_sjto_impsto',
'    where   a.cdgo_clnte        =   :P20_CDGO_CLNTE',
'    and     a.id_impsto         =   :P20_ID_IMPSTO',
'    and     a.idntfccion_sjto   =   :P20_IDNTFCCION_SJTO;',
'exception',
'    when no_data_found then',
'        raise_application_error(-20001,''El solicitante no se encuentra registrado para el tributo.'');',
'    when others then',
'        raise_application_error(-20001,''No pudo validarse el solicitante.'');',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76772205526142344)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of gi_g_dclrcnes_lcncia'
,p_attribute_02=>'GI_G_DCLRCNES_LCNCIA'
,p_attribute_03=>'P20_ID_DCLRCION_LCNCIA'
,p_attribute_04=>'ID_DCLRCION_LCNCIA'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76772659231142344)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(76767122562142314)
);
end;
/
