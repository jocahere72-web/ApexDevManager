prompt --application/shared_components/reports/report_queries/gi_g_acto_previo_determinaciones
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(123395868384174600)
,p_name=>'gi_g_acto_previo_determinaciones'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'      from (select t.id_sjto_impsto,',
'                   j.idntfccion_sjto referencia,',
'                   p.mtrcla_inmblria,',
'                   j.idntfccion_rspnsble id_propietario,',
'                   j.prmer_nmbre propietario,',
'                   trim(j.drccion) direccion,',
'                   listagg(t.vgncia, '', '') within group(order by t.vgncia) vigencias,',
'                   sum(t.vlor_sldo_cptal) capital,',
'                   sum(t.vlor_intres) interes,',
'                   sum(t.vlor_sldo_cptal + t.vlor_intres) total',
'              from v_gf_g_cartera_x_vigencia t',
'              join v_si_i_sujetos_responsable j',
'                on t.id_sjto_impsto = j.id_sjto_impsto',
'              join si_i_predios p',
'                on p.id_sjto_impsto = j.id_sjto_impsto',
'             where t.cdgo_clnte = 23001',
'               and t.id_impsto = 230011',
'               and t.id_impsto_sbmpsto = 2300111',
'               and t.cdgo_mvnt_fncro_estdo = ''NO''',
'               and t.indcdor_mvmnto_blqdo = ''N''',
'               and j.id_sjto_estdo = 1',
'               and j.prncpal_s_n = ''S''',
'               and (t.vlor_sldo_cptal) > 0',
'               and t.vgncia between 2021 and 2023',
'               and j.prmer_nmbre not in (''MUNICIPIO DE MONTERIA'')',
'               and t.id_sjto_impsto = 2740166',
'               and j.idntfccion_rspnsble not in',
'                   (''8000967341'',',
'                    ''8000967341-4'',',
'                    ''800096734-1'',',
'                    ''891080007-6'',',
'                    ''891080007'')',
'               and not exists',
'             (select ''X''',
'                      from gi_g_determinacion_detalle d,',
'                           gi_g_determinaciones       m',
'                     where m.id_sjto_impsto = t.id_sjto_impsto',
'                       and m.id_impsto = t.id_impsto',
'                       and m.id_impsto_sbmpsto = t.id_impsto_sbmpsto',
'                       and m.id_dtrmncion = d.id_dtrmncion',
'                       and d.vgncia = t.vgncia)',
'             group by t.id_sjto_impsto,',
'                      j.idntfccion_sjto,',
'                      j.prmer_nmbre,',
'                      j.drccion,',
'                      p.mtrcla_inmblria,',
'                      j.idntfccion_rspnsble)',
'     where vigencias like 2021 || ''%'''))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_acto_previo_determinaciones'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123412029260695253)
,p_shared_query_id=>wwv_flow_api.id(123395868384174600)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--datos predio',
'select nmro_acto,',
'       to_char(a.fcha,''dd/mm/yyyy'') fcha,',
'       idntfccion_sjto,',
'       b.drccion_ntfccion,',
'       c.mtrcla_inmblria,',
'       (select listagg(distinct c.vgncia, '','') within group(order by c.vgncia) ',
'          from gn_g_actos_vigencia c',
'         where c.id_acto = a.id_acto) vgncias',
'  from v_gn_g_actos_sujeto_impuesto a',
'  join si_i_sujetos_impuesto b',
'    on b.id_sjto_impsto = a.id_sjto_impsto',
'  join si_i_predios c',
'    on c.id_sjto_impsto = a.id_sjto_impsto',
' where a.id_acto = json_value(:p37_json, ''$.id_acto'')',
'   and a.id_acto_tpo = json_value(:p37_json, ''$.id_acto_tpo'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123412216184695253)
,p_shared_query_id=>wwv_flow_api.id(123395868384174600)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--datos propietarios tabla',
'select prmer_nmbre                nmbre_rspnsble,',
'       idntfccion                 idntfccion_rspnsble,',
'       c.dscrpcion_idntfccion_tpo',
'  from v_gn_g_actos_sujeto_impuesto a',
'  join gn_g_actos_responsable b',
'    on b.id_acto = a.id_acto',
'  join df_s_identificaciones_tipo c',
'    on c.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
' where a.id_acto = json_value(:P37_JSON, ''$.id_acto'')',
'   and a.id_acto_tpo = json_value(:P37_JSON, ''$.id_acto_tpo'')',
' order by b.prmer_nmbre'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123412402563695253)
,p_shared_query_id=>wwv_flow_api.id(123395868384174600)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Datos Propietarios lista',
'SELECT RTRIM(XMLAGG(XMLELEMENT(e, b.prmer_nmbre || '' identificado con '' || c.nmtcnco_idntfccion_tpo || '' '' || b.idntfccion, '', '') ORDER BY b.prmer_nmbre).EXTRACT(''//text()'').getclobval(),',
'             '','') rspnsbles_lsta',
'  FROM v_gn_g_actos_sujeto_impuesto a',
'  JOIN gn_g_actos_responsable b',
'    ON b.id_acto = a.id_acto',
'  JOIN df_s_identificaciones_tipo c',
'    ON c.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
' WHERE a.id_acto = json_value(:P37_JSON, ''$.id_acto'')',
'   AND a.id_acto_tpo = json_value(:P37_JSON, ''$.id_acto_tpo'')',
' GROUP BY a.id_acto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123412637449695253)
,p_shared_query_id=>wwv_flow_api.id(123395868384174600)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--detalle cartera',
'select a.id_sjto_impsto,',
'       a.vgncia,',
'       e.dscrpcion,',
'       f.dscrpcion_estrto,',
'       to_char(c.bse_grvble, ''FM$999,999,999,990'') avluo,',
'       x.txto_trfa,',
'       to_char(sum(decode(a.cdgo_cncpto, ''1020'', a.vlor_sldo_cptal, 0)), ''FM$999,999,999,990'') predial,',
'       to_char(sum(decode(a.cdgo_cncpto, ''1020'', 0, a.vlor_sldo_cptal)), ''FM$999,999,999,990'') st_bomberil,',
'       to_char(sum(a.vlor_sldo_cptal), ''FM$999,999,999,990'') total',
'  from v_gf_g_cartera_x_concepto a',
'  join v_si_i_predios b',
'    on b.id_sjto_impsto = a.id_sjto_impsto',
'  join gi_g_liquidaciones c',
'    on c.id_sjto_impsto = a.id_sjto_impsto',
'   and c.cdgo_lqdcion_estdo = ''L''',
'   and c.vgncia = a.vgncia',
'  join gi_g_liquidaciones_ad_predio d',
'    on d.id_lqdcion = c.id_lqdcion',
'  join df_s_estratos f',
'    on f.cdgo_estrto = d.cdgo_estrto',
'  join df_i_predios_destino e',
'    on e.id_prdio_dstno = d.id_prdio_dstno',
'  join (select b.id_lqdcion, txto_trfa',
'          from gi_g_liquidaciones_concepto b',
'          join df_i_impuestos_acto_concepto d',
'            on b.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'           and d.indcdor_trfa_crctrstcas = ''S'') x',
'    on x.id_lqdcion = c.id_lqdcion',
' where a.cdgo_mvnt_fncro_estdo = ''NO''',
'   and exists (select 1',
'          from v_gn_g_actos_sujeto_impuesto t',
'          join gn_g_actos_vigencia v',
'            on v.id_acto = t.id_acto',
'           and v.vgncia = a.vgncia',
'           and v.id_prdo = a.id_prdo',
'         where t.id_acto = json_value(:p37_json, ''$.id_acto'')',
'           and t.id_acto_tpo = json_value(:p37_json, ''$.id_acto_tpo'')',
'           and t.id_sjto_impsto = a.id_sjto_impsto)',
' group by a.id_sjto_impsto,',
'          a.vgncia,',
'          c.bse_grvble,',
'          e.dscrpcion,',
'          f.dscrpcion_estrto,',
'          x.txto_trfa',
' order by a.id_sjto_impsto, a.vgncia'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123412833937695253)
,p_shared_query_id=>wwv_flow_api.id(123395868384174600)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--totales cartera',
'select to_char(sum(decode(a.cdgo_cncpto, ''1020'', a.vlor_sldo_cptal, 0)), ''FM$999,999,999,990'') total_predial,',
'       to_char(sum(decode(a.cdgo_cncpto, ''1020'', 0, a.vlor_sldo_cptal)), ''FM$999,999,999,990'') total_st_bomberil,',
'       to_char(sum(a.vlor_sldo_cptal), ''FM$999,999,999,990'') total_total',
'  from v_gf_g_cartera_x_concepto a',
'  join v_si_i_predios b',
'    on b.id_sjto_impsto = a.id_sjto_impsto',
'  join gi_g_liquidaciones c',
'    on c.id_sjto_impsto = a.id_sjto_impsto',
'   and c.cdgo_lqdcion_estdo = ''L''',
'   and c.vgncia = a.vgncia',
'  join gi_g_liquidaciones_ad_predio d',
'    on d.id_lqdcion = c.id_lqdcion',
'  join df_s_estratos f',
'    on f.cdgo_estrto = d.cdgo_estrto',
'  join df_i_predios_destino e',
'    on e.id_prdio_dstno = d.id_prdio_dstno',
'  join (select b.id_lqdcion, txto_trfa',
'          from gi_g_liquidaciones_concepto b',
'          join df_i_impuestos_acto_concepto d',
'            on b.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'           and d.indcdor_trfa_crctrstcas = ''S'') x',
'    on x.id_lqdcion = c.id_lqdcion',
' where a.cdgo_mvnt_fncro_estdo = ''NO''',
'   and exists',
' (select 1',
'          from v_gn_g_actos_sujeto_impuesto t',
'          join gn_g_actos_vigencia v',
'            on v.id_acto = t.id_acto',
'           and v.vgncia = a.vgncia',
'           and v.id_prdo = a.id_prdo',
'         where t.id_acto = json_value(:p37_json, ''$.id_acto'')',
'           and t.id_acto_tpo = json_value(:p37_json, ''$.id_acto_tpo'')',
'           and t.id_sjto_impsto = a.id_sjto_impsto)'))
);
end;
/
