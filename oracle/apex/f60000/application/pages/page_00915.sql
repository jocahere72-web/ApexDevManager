prompt --application/pages/page_00915
begin
wwv_flow_api.create_page(
 p_id=>915
,p_user_interface_id=>wwv_flow_api.id(103265655096132800)
,p_name=>unistr('Cambiar Contrase\00F1a')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Cambiar Contrase\00F1a')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'50%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191029103735'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(321054498200902471)
,p_plug_name=>unistr('Cambiar Contrase\00F1a')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29944783962317094)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27071771334229902)
,p_plug_name=>unistr('<i><b>Condiciones de la Contrase\00F1a</b></i>')
,p_parent_plug_id=>wwv_flow_api.id(321054498200902471)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29933691268317090)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h5>',
'    <i>',
unistr('        <b>1.</b> La contrase\00F1a debe tener al menos 8 caracteres<br>'),
unistr('        <b>2.</b> La contrase\00F1a debe contener letras may\00FAsculas y min\00FAsculas, numeros y caracteres especiales. <br>'),
unistr('        Los car\00E1cteres permitido son:  / * _ . , : ; @ # ! \00A1 $ % \00BF ? & { } + <br>'),
'        Por ejemplo: oNQZnz$Hx2.<br>',
'    </i>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103368457715284161)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(321054498200902471)
,p_button_name=>'BTN_CAMBIAR_CLAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(29996928466317117)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cambiar Clave'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-exchange'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103368812677284164)
,p_name=>'P915_ID_USRIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(321054498200902471)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103369125319284166)
,p_name=>'P915_USER_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(321054498200902471)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103369503605284166)
,p_name=>'P915_CLAVE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(321054498200902471)
,p_prompt=>unistr('Nueva Contrase\00F1a')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103369994660284166)
,p_name=>'P915_CONFIRMAR_CLAVE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(321054498200902471)
,p_prompt=>unistr('Confirmar Contrase\00F1a')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(29996430207317116)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(27073832444229923)
,p_validation_name=>'Clave valida'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_return number;',
'BEGIN',
'    if length (:P915_CONFIRMAR_CLAVE) >= 8 then         ',
'        if REGEXP_LIKE(:P915_CONFIRMAR_CLAVE,''[0-9]'') then',
'            if REGEXP_LIKE(:P915_CONFIRMAR_CLAVE,''[a-z]'') then',
'                if REGEXP_LIKE(:P915_CONFIRMAR_CLAVE,''[A-Z]'') then   ',
unistr('                    if REGEXP_LIKE(:P915_CONFIRMAR_CLAVE,''[/|*|_|.|,|:|;|@|#|!|\00A1|$|%|\00BF|?|&|{|}|+]'') then            '),
'                        v_return := 1;',
'                        return true;',
'                    else',
'                         v_return := 0;',
'                         return false;',
'                    end if;',
'                else',
'                     v_return := 0;',
'                     return false;',
'                end if;',
'            else',
'                 v_return := 0;',
'                 return false;',
'            end if;',
'        else',
'            v_return := 0;',
'            return false;',
'        end if;',
'    else ',
'         v_return := 0;',
'         return false;',
'    end if;',
'END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('La Contrase\00F1a ingresda no cumple con las condiciones de seguridad establecidas')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(103369994660284166)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103370459417284177)
,p_validation_name=>'Validar Clave'
,p_validation_sequence=>30
,p_validation=>'P915_CLAVE'
,p_validation2=>'&P915_CONFIRMAR_CLAVE.'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>'Las Claves no son iguales'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103370736249284177)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cambiar Clave'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_clave varchar2(200);',
'',
'begin',
'',
'v_clave := pkg_sg_autenticacion.fnc_sg_hash (:P915_USER_NAME, :P915_CLAVE);',
'update sg_g_usuarios set password = v_clave where --cdgo_clnte = :F_CDGO_CLNTE and ',
'user_name = :P915_USER_NAME;',
'',
'if SQL%ROWCOUNT > 0 then',
'    commit;',
'    apex_application.g_print_success_message:=''Cambio de Clave Exitoso para el usuario '' ||  :P915_USER_NAME;',
'else ',
'    apex_application.g_print_success_message:=''Ocurrio un errror'';',
'end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(103368457715284161)
);
end;
/
