prompt --application/shared_components/user_interface/lovs/lv_convenio_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(72732144303195477)
,p_lov_name=>'LV_CONVENIO_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
