prompt --application/shared_components/navigation/lists/estados
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(95148233113795472)
,p_name=>'Estados'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null,',
'       a.dscrpcion_vsble label,',
'       null target,',
'       nvl2(d.id_fljo_trea_estdo,''YES'',''NOT'')is_current,',
'       null image,',
'       null image_attrib,',
'       null image_alt',
'from wf_d_flujos_tarea_estado a',
'left join (',
'    select a.id_instncias_trnscn_estdo,c.id_fljo_trea_estdo,c.orden, c.dscrpcion_vsble',
'    from wf_g_instncias_trnscn_estdo a',
'    inner join wf_g_instancias_transicion b on b.id_instncia_trnscion = a.id_instncia_trnscion',
'    inner join wf_d_flujos_tarea_estado c on a.id_fljo_trea_estdo = c.id_fljo_trea_estdo',
'    where b.id_instncia_trnscion in (',
'        select a.id_instncia_trnscion',
'        from wf_g_instancias_transicion a',
'        where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'              a.id_estdo_trnscion in (1,2))',
') c on a.id_fljo_trea_estdo = c.id_fljo_trea_estdo',
'left join(select distinct first_value( a.id_fljo_trea_estdo ) over( order by a.orden asc ) id_fljo_trea_estdo',
'          from wf_d_flujos_tarea_estado a',
'          left join (',
'            select a.id_instncias_trnscn_estdo,c.id_fljo_trea_estdo,c.orden, c.dscrpcion_vsble',
'            from wf_g_instncias_trnscn_estdo a',
'            inner join wf_g_instancias_transicion b on b.id_instncia_trnscion = a.id_instncia_trnscion',
'            inner join wf_d_flujos_tarea_estado c on a.id_fljo_trea_estdo = c.id_fljo_trea_estdo',
'            where b.id_instncia_trnscion in (',
'                select a.id_instncia_trnscion',
'                from wf_g_instancias_transicion a',
'                where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO and',
'                      a.id_estdo_trnscion in (1,2))',
'         ) c on a.id_fljo_trea_estdo = c.id_fljo_trea_estdo',
'         where a.id_fljo_trea = :F_ID_FLJO_TREA and',
'              c.id_instncias_trnscn_estdo is null) d on a.id_fljo_trea_estdo = d.id_fljo_trea_estdo',
'where a.id_fljo_trea = :F_ID_FLJO_TREA',
'order by a.orden asc;',
'',
''))
,p_list_status=>'PUBLIC'
);
end;
/
