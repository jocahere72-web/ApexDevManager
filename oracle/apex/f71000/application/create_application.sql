prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'GENESYS')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'GestiÃ³n Financiera')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F_63000')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'C2C4F445A217DA90ED19E9796C3BA5D3634541CE01D512590A16FE691D019773'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'5.1'
,p_flow_language=>'es-co'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_date_format=>'DD/MM/YYYY'
,p_date_time_format=>'DD/MM/YYYY HH:MI PM'
,p_timestamp_format=>'DD/MM/YYYY HH:MI:SS PM'
,p_timestamp_tz_format=>'DD/MM/YYYY HH.MI.SSXFF PM TZR'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(177374767879050692)
,p_populate_roles=>'A'
,p_application_tab_set=>1
,p_logo_image=>'TEXT:&F_NMBRE_APLCCION_GRPO.'
,p_favicons=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<link rel="shortcut icon" href="/ords/api/util/imagen?cliente=&F_CDGO_CLNTE.&codigo=FVC">',
'<link rel="icon" sizes="16x16" href="/ords/api/util/imagen?cliente=&F_CDGO_CLNTE.&codigo=FVC">',
'<link rel="icon" sizes="32x32" href="/ords/api/util/imagen?cliente=&F_CDGO_CLNTE.&codigo=FVC">',
'<link rel="apple-touch-icon" sizes="180x180" href="#/ords/api/util/imagen?cliente=&F_CDGO_CLNTE.&codigo=FVC">'))
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>unistr('versi\00F3n 1.0')
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>unistr('Esta aplicaci\00F3n no est\00E1 disponible en este momento.')
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'pkg_error.fnc_maneja_error'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20260416165842'
,p_global_notification=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<link rel="shortcut icon" href="/ords/api/util/imagen?cliente=&F_CDGO_CLNTE.&codigo=FVC">',
'<link rel="icon" sizes="16x16" href="/ords/api/util/imagen?cliente=&F_CDGO_CLNTE.&codigo=FVC">',
'<link rel="icon" sizes="32x32" href="/ords/api/util/imagen?cliente=&F_CDGO_CLNTE.&codigo=FVC">',
'<link rel="apple-touch-icon" sizes="180x180" href="#/ords/api/util/imagen?cliente=&F_CDGO_CLNTE.&codigo=FVC">'))
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>8
,p_ui_type_name => null
);
end;
/
