prompt --application/shared_components/user_interface/lovs/lv_funciones
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(15942870956699001)
,p_lov_name=>'LV_FUNCIONES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_up as d',
'       , a.id_rgla_ngcio_clnte_fncion as r',
'  from gn_d_rglas_ngcio_clnte_fnc a',
'  join gn_d_funciones b on a.id_fncion = b.id_fncion',
'  join gn_d_reglas_negocio_cliente c on a.id_rgla_ngcio_clnte = c.id_rgla_ngcio_clnte',
'  where c.cdgo_clnte = :F_CDGO_CLNTE',
'    and b.nmbre_up like ''%pkg_gf_titulos_judicial.fnc_co_%''',
'order by 1;'))
);
end;
/
