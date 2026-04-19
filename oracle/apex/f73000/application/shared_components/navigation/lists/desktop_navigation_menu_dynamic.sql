prompt --application/shared_components/navigation/lists/desktop_navigation_menu_dynamic
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(76481173713736892)
,p_name=>'Desktop Navigation Menu Dynamic'
,p_list_type=>'FUNCTION_RETURNING_SQL_QUERY'
,p_list_query=>'return pkg_sg_autorizacion.fnc_get_select_menu (:app_session, :APP_USER, :F_CDGO_CLNTE, :F_ID_APLCCION_GRPO);'
,p_list_status=>'PUBLIC'
);
end;
/
