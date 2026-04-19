prompt --application/shared_components/security/authentications/custom_portal
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(59437646949573947)
,p_name=>'CUSTOM_PORTAL'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'login_portal'
,p_attribute_05=>'N'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function login_portal(p_username in varchar2 , p_password in varchar2 )',
'return boolean ',
'as ',
'    v_prmtros     varchar2(2000) := :F_CDGO_CLNTE ||'':''|| p_username ||'':'' || p_password;',
'    v_json        clob; ',
'    v_json_o      json_object_t;',
'    v_tken        varchar2(4000);',
'    v_id_usrio    number;',
'    v_nmbre_trcro varchar2(4000);',
'    ',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json_o := json_object_t(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''portal/autenticar'',',
'                                                                 p_http_method  => ''POST'',',
'                                                                 p_parm_name    => apex_util.string_to_table(''cliente:username:password''),',
'                                                                 p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'    ',
'    if (v_json_o.get_string(''type'') = ''OK'') then',
'        :F_ID_USRIO_TKEN := v_json_o.get_string(''token'');',
'        :F_NMBRE_USRIO   := v_json_o.get_string(''nmbre_trcro'');',
'        :F_ID_USRIO      := v_json_o.get_string(''id_usrio'');',
'        :F_FRMTO_MNDA    := v_json_o.get_string(''frmto_mnda'');',
'        return true;',
'    end if;',
'    return false;                                                      ',
'exception',
'    when others then',
'        return false;    ',
'end login_portal;'))
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
