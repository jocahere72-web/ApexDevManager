prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(35818030447290460)
,p_build_option_name=>unistr('Funci\00F3n: Generaci\00F3n de informes de actividades')
,p_build_option_status=>'INCLUDE'
,p_feature_identifier=>'APPLICATION_ACTIVITY_REPORTING'
,p_build_option_comment=>unistr('Incluya varios informes y gr\00E1ficos en la actividad del usuario final.')
);
end;
/
