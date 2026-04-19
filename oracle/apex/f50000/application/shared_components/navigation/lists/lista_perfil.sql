prompt --application/shared_components/navigation/lists/lista_perfil
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(95437976042167972)
,p_name=>'Lista Perfil'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null as level_value ',
'       , nmbre_prfil as label_value ',
'       , apex_util.prepare_url( ''f?p='' || :app_id || '':''|| :app_page_id || '':'' || :app_session || ''::NO::P913_ID_PRFIL:''||ID_PRFIL) as target_value',
'       , null as is_current ',
'       , ''fa-plus'' as image_value ',
'       , null as image_attr_value ',
'       , null as image_alt_value ',
'from v_sg_g_perfiles',
'order by nmbre_prfil '))
,p_list_status=>'PUBLIC'
);
end;
/
