prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'Login Page'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'span.t-Login-logo {',
'border-radius : 10px; ',
'background-repeat: no-repeat;',
'background : url(#APP_IMAGES#Logo_Transparente_tax.png);',
'width : 346px;',
'height : 208px;',
'}',
'',
'.t-Login-region {',
'  position: relative;',
'  width: 90%;',
'  margin: 0 auto;',
'  background: rgba(226, 226, 226, 0.95);',
'  padding: 20px 22px;',
' -- border: 1px solid;',
'  border-top-color: rgba(255,255,255,.4);',
'  border-left-color: rgba(255,255,255,.4);',
'  border-bottom-color: rgba(60,60,60,.4);',
'  border-right-color: rgba(60,60,60,.4);',
'  border-radius : 10px; ',
'}',
'',
'div.t-Body{        ',
'   background: url(#WORKSPACE_IMAGES#Fondo_Login.ico) no-repeat center center fixed; ',
'  -webkit-background-size: cover;',
'  -moz-background-size: cover;',
'  -o-background-size: cover;',
'  background-size: cover;',
'}',
''))
,p_step_template=>wwv_flow_api.id(29511870460068489)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250712172808'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(205368709508730871)
,p_plug_name=>unistr('<h4><center><font face="Century Gothic">SISTEMA DE INFORMACI\00D3N TRIBUTARIO</font></center><h4>')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552078926068507)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(95351952122507356)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(205368709508730871)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(29604648415068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ENTRAR'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2222744071283401)
,p_name=>'P101_ID_APLCCION_GRPO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(205368709508730871)
,p_prompt=>'Suit'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select distinct nmbre_aplccion_grpo, ',
'        id_aplccion_grpo ',
'   from v_sg_g_aplicaciones_cliente ',
'  where cdgo_clnte = 23001',
'  and actvo_grpo = ''S''',
'order by id_aplccion_grpo'))
,p_lov_cascade_parent_items=>'P101_CDGO_CLNTE'
,p_ajax_items_to_submit=>'P101_CDGO_CLNTE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95352220546507367)
,p_name=>'P101_CDGO_CLNTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(205368709508730871)
,p_prompt=>'Cliente'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte, ',
'       cdgo_clnte ',
'  from v_df_s_clientes ',
'order by cdgo_clnte '))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95352661236507373)
,p_name=>'P101_USERNAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(205368709508730871)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95353042426507374)
,p_name=>'P101_PASSWORD'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(205368709508730871)
,p_prompt=>'Clave'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(29604290684068537)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_inline_help_text=>unistr('<center style="color:#485a9b">Inicie sesi\00F3n para ayudarle en su gesti\00F3n</center>')
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95353547099507387)
,p_validation_name=>unistr('Validaci\00F3n Usuario Valido')
,p_validation_sequence=>10
,p_validation=>'P101_USERNAME'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'Usuario no Valido'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(95352661236507373)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(95353916623507391)
,p_validation_name=>'Validar si Existe Usuario'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select user_name ',
'  from v_sg_g_usuarios ',
' where cdgo_clnte = :P101_CDGO_CLNTE',
'   and user_name = :P101_USERNAME'))
,p_validation_type=>'EXISTS'
,p_error_message=>'El usuario no Existe'
,p_always_execute=>'Y'
,p_validation_condition=>'P101_USERNAME'
,p_validation_condition_type=>'ITEM_IS_NUMERIC'
,p_associated_item=>wwv_flow_api.id(95352661236507373)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(33508442825844301)
,p_validation_name=>'Validar si cuenta del usuario expiro'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select user_name ',
'  from v_sg_g_usuarios ',
' where cdgo_clnte = :P101_CDGO_CLNTE',
'   and user_name = :P101_USERNAME',
'   and trunc(fcha_exprcion) > trunc(sysdate)',
'   and actvo = ''S'''))
,p_validation_type=>'EXISTS'
,p_error_message=>'La Cuenta del usuario ha expirado'
,p_always_execute=>'Y'
,p_validation_condition=>'P101_USERNAME'
,p_validation_condition_type=>'ITEM_IS_NUMERIC'
,p_associated_item=>wwv_flow_api.id(95352661236507373)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95354651645507394)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95354207966507391)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(p_username => :P101_USERNAME,',
'                          p_password => :P101_PASSWORD || ''|'' || :P101_CDGO_CLNTE || ''|'' || :P101_ID_APLCCION_GRPO);',
'',
':F_CDGO_CLNTE:= :P101_CDGO_CLNTE;',
':F_ID_APLCCION_GRPO := :P101_ID_APLCCION_GRPO;',
'',
'',
'if :F_CDGO_CLNTE is not null then ',
'    select a.id_pais,',
'           (select cdgo_pais from df_s_paises m where m.id_pais = a.id_pais) cdgo_pais,',
'           a.id_dprtmnto,',
'           (select cdgo_dprtmnto from df_s_departamentos m where m.id_dprtmnto = a.id_dprtmnto) cdgo_dprtmnto,',
'           a.id_mncpio,',
'           substr((select cdgo_mncpio from df_s_municipios m where m.id_mncpio = a.id_mncpio),3) cdgo_mncpio,',
'           a.nmbre_clnte,',
'           a.smblo_mnda,',
'           a.frmto_mnda,',
'           a.nmro_dcmles',
'      into :F_ID_PAIS_CLNTE, ',
'           :F_CDGO_PAIS_CLNTE, ',
'           :F_ID_DPRTMNTO_CLNTE, ',
'           :F_CDGO_DPRTMNTO_CLNTE, ',
'           :F_ID_MNCPIO_CLNTE, ',
'           :F_CDGO_MNCPIO_CLNTE, ',
'           :F_NMBRE_CLNTE, ',
'           :F_SMBLO_MNDA, ',
'           :F_FRMTO_MNDA, ',
'           :F_NMRO_DCMLES',
'      from df_s_clientes  a',
'     where cdgo_clnte = :P101_CDGO_CLNTE;',
'',
'    select nmbre_trcro, id_trcro, id_usrio, id_fncnrio',
'     into :F_NMBRE_USRIO, :F_ID_TRCRO ,:F_ID_USRIO, :F_ID_FNCNRIO',
'      from v_sg_g_usuarios ',
'     where user_name = :P101_USERNAME ',
'       and cdgo_clnte = :P101_CDGO_CLNTE;',
'   ',
'    select nmbre_aplccion_grpo',
'     into :F_NMBRE_APLCCION_GRPO',
'     from sg_g_aplicaciones_grupo',
'    where id_aplccion_grpo = :P101_ID_APLCCION_GRPO;',
'    ',
'    /*Generamos TOKEN*/',
'    declare',
'        v_cdgo_rspsta      number;',
'        v_mnsje_rspsta     varchar2(32000);',
'    begin',
'        pkg_sg_autenticacion.prc_cd_token(',
'            p_cdgo_clnte      => :F_CDGO_CLNTE,',
'            p_id_usrio        => :F_ID_USRIO,',
'            p_app_session     => :APP_SESSION,',
'            p_accion          => ''I'',',
'            o_id_usrio_tken   => :F_ID_USRIO_TKEN,',
'            o_cdgo_rspsta	  => v_cdgo_rspsta,',
'            o_mnsje_rspsta    => v_mnsje_rspsta',
'        );',
'        ',
'        --Validamos si hubo errores al generar token',
'        if(v_cdgo_rspsta != 0)then',
'            --raise_application_error(-20001, v_mnsje_rspsta);',
'            null;',
'        end if;',
'        ',
'    end;',
'end if; ',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95355451951507396)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(95355095473507395)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
