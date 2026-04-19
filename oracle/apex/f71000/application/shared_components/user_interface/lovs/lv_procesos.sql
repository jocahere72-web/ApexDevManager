prompt --application/shared_components/user_interface/lovs/lv_procesos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(49433090258357917)
,p_lov_name=>'LV_PROCESOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select case when level = 1 then ',
'                nmbre',
'            when level = 2 then ',
'                ''    '' || nmbre',
'            when level = 3 then ',
'                ''      '' || nmbre',
'        end as nmbre, ',
'        id_prcso ',
'   from df_s_procesos',
'start with id_prcso_pdre is null',
'connect by prior id_prcso = id_prcso_pdre',
'order siblings by id_prcso;'))
);
end;
/
