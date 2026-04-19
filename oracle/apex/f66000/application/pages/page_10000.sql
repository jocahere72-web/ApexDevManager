prompt --application/pages/page_10000
begin
wwv_flow_api.create_page(
 p_id=>10000
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Administraci\00F3n')
,p_alias=>'ADMIN'
,p_step_title=>unistr('Administraci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_api.id(35819844779290480)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(35819250269290478)
,p_deep_linking=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>La p\00E1gina de administraci\00F3n permite a los propietarios de aplicaciones (administradores) configurar la aplicaci\00F3n y conservar los datos comunes que se utilizan en toda la aplicaci\00F3n.'),
unistr('Al seleccionar uno de los valores disponibles, los administradores pueden cambiar potencialmente la forma en que se muestra la aplicaci\00F3n y/o las funciones que pueden utilizar los usuarios finales.</p>'),
unistr('<p>El acceso a esta p\00E1gina debe estar restringido solo a los administradores.</p>')))
,p_last_updated_by=>'JCUAO'
,p_last_upd_yyyymmddhh24miss=>'20181019171535'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35884964322290638)
,p_plug_name=>unistr('Ruta de Navegaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(35751830531290415)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(35695862687290388)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(35795340972290432)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35887846873290640)
,p_plug_name=>'Columna 1'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(35721144697290402)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35888275356290640)
,p_plug_name=>'Informes de Actividades'
,p_parent_plug_id=>wwv_flow_api.id(35887846873290640)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:u-colors'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(35885599319290639)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(35784150582290427)
,p_plug_query_num_rows=>15
,p_required_patch=>wwv_flow_api.id(35818030447290460)
);
end;
/
