prompt --application/shared_components/remote_servers/192_168_11_34_ords_api
begin
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(51900781955558937)
,p_name=>'192-168-11-34-ords-api'
,p_static_id=>'192_168_11_34_ords_api'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('192_168_11_34_ords_api'),'http://192.168.11.34:8034/ords/api/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('192_168_11_34_ords_api'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('192_168_11_34_ords_api'),'')
,p_prompt_on_install=>false
);
end;
/
