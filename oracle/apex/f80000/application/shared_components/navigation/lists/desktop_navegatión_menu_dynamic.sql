prompt --application/shared_components/navigation/lists/desktop_navegatión_menu_dynamic
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(17447091972954225)
,p_name=>unistr('Desktop Navegati\00F3n Menu Dynamic')
,p_list_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_list_query=>'return pkg_sg_autorizacion.fnc_get_select_menu (:app_session, :APP_USER, :F_CDGO_CLNTE, :F_ID_APLCCION_GRPO);'
,p_list_status=>'PUBLIC'
);
end;
/
