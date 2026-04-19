prompt --application/shared_components/reports/report_queries/re_g_aplicacion_titulo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(72719929032717566)
,p_name=>'re_g_aplicacion_titulo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select initcap(c.nmbre_clnte) nmbre_clnte,',
'       initcap(c.nmbre_mncpio) nmbre_mncpio,',
'       to_char(sysdate,''FMDD Month "de" YYYY'', ''nls_date_language=spanish'') fecha_hoy,',
'       initcap(f.nmbre_crgo) nmbre_crgo,',
'       f.nmbre_trcro',
'  from v_df_s_clientes c',
'  join v_df_c_funcionarios f',
'    on f.cdgo_clnte = c.cdgo_clnte',
' where c.cdgo_clnte = 1',
'   and f.idntfccion = 1143340846'))
,p_format=>'PDF'
,p_output_file_name=>'re_g_aplicacion_titulo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3951507052205200)
,p_shared_query_id=>wwv_flow_api.id(72719929032717566)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       pkg_gn_generalidades.fnc_cl_fecha_texto(p_fecha => sysdate) fcha_hoy',
'  from dual;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3951705274205200)
,p_shared_query_id=>wwv_flow_api.id(72719929032717566)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dcmnto,',
'       pkg_gn_generalidades.fnc_cl_fecha_texto(p_fecha => sysdate) fcha_hoy',
'  from gf_g_titulos_jdcial_dcmnto a',
'  join gf_g_ttls_jdcl_dcmnt_asccn b',
'    on b.id_ttlo_jdcial_dcmnto = a.id_ttlo_jdcial_dcmnto',
'  join gf_g_titulos_judicial c',
'    on c.id_ttlo_jdcial = b.id_ttlo_jdcial',
'   and c.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'')--json_value(:P2_XML, ''$.id_instncia_fljo'')',
'   and a.id_acto_tpo = a.id_acto_tpo;',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3951914131205200)
,p_shared_query_id=>wwv_flow_api.id(72719929032717566)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(rtrim(replace(a.nmbre_dmnddo, ''.'', ''''))) as nmbre_dmnddo,',
'       initcap(e.dscrpcion_idntfccion_tpo) as dscrpcion_idntfccion_tpo,',
'       ltrim(a.idntfccion_dmnddo, ''0'') as idntfccion_dmnddo,',
'       ltrim(rtrim(replace(k.drccion_ntfccion, ''   '', '' ''))) as drccion_ntfccion,',
'       d.nmro_acto,',
'       pkg_gn_generalidades.fnc_cl_fecha_texto(p_fecha => d.fcha) as fecha_acto,',
'       listagg(g.nmro_dcmnto, '','') within group(order by g.nmro_dcmnto) as facturas,',
'       i.nmbre_trcro,',
'       i.nmbre_crgo,',
'       i.nmbre_ofcna',
'  from gf_g_titulos_judicial a',
'  join gf_g_ttls_jdcl_dcmnt_asccn b',
'    on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'  join gf_g_titulos_jdcial_dcmnto c',
'    on c.id_ttlo_jdcial_dcmnto = b.id_ttlo_jdcial_dcmnto',
'  join gn_g_actos d',
'    on d.id_acto = c.id_acto',
'  join df_s_identificaciones_tipo e',
'    on e.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'  join gf_g_ttls_jdcl_impsto_dcmnt f',
'    on f.id_ttlo_jdcial = a.id_ttlo_jdcial',
'  join re_g_documentos g',
'    on g.id_dcmnto = f.id_dcmnto',
'  join gn_d_actos_funcionario_frma h',
'    on h.id_acto_tpo = c.id_acto_tpo',
'  join v_sg_g_usuarios i',
'    on i.id_fncnrio = h.id_fncnrio',
'  join gf_g_titulos_jdcial_impsto j',
'    on j.id_ttlo_jdcial = a.id_ttlo_jdcial',
'  join v_si_i_sujetos_impuesto k',
'    on k.id_sjto_impsto = j.id_sjto_impsto',
' where a.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'')--json_value(:P2_XML, ''$.id_instncia_fljo'')',
'   and c.id_acto_tpo = c.id_acto_tpo',
' group by initcap(rtrim(replace(a.nmbre_dmnddo, ''.'', ''''))),',
'          initcap(e.dscrpcion_idntfccion_tpo),',
'          ltrim(a.idntfccion_dmnddo, ''0''),',
'          k.drccion_ntfccion,',
'          d.nmro_acto,',
'          pkg_gn_generalidades.fnc_cl_fecha_texto(p_fecha => d.fcha),',
'          i.nmbre_trcro,',
'          i.nmbre_crgo,',
'          i.nmbre_ofcna;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3952101414205200)
,p_shared_query_id=>wwv_flow_api.id(72719929032717566)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Datos Funcionario',
'select a.nmbre_trcro, a.nmbre_prfsion, a.nmbre_crgo, A.nmbre_ofcna',
'  from v_sg_g_usuarios a',
' where a.id_usrio = :F_ID_USRIO'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3952398472205200)
,p_shared_query_id=>wwv_flow_api.id(72719929032717566)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select listagg(k.idntfccion_sjto, '','') within group(order by k.idntfccion_sjto) as predios,',
'       e.nmro_prcso_jrdco',
'  from v_si_i_sujetos_impuesto k',
'  join gf_g_titulos_jdcial_impsto a',
'    on a.id_sjto_impsto = k.id_sjto_impsto',
'  join gf_g_titulos_judicial b',
'    on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'  left join mc_g_embargos_resolucion c',
'    on c.cnsctvo_embrgo = b.cnsctvo_embrgo',
'  left join mc_g_embrgos_crt_prc_jrd d',
'    on d.id_embrgos_crtra = c.id_embrgos_crtra',
'  left join cb_g_procesos_juridico e',
'    on e.id_prcsos_jrdco = d.id_prcsos_jrdco',
' where b.id_instncia_fljo =  pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'')--json_value(:P2_XML, ''$.id_instncia_fljo'')',
' group by k.id_sjto_impsto,e.nmro_prcso_jrdco',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3952569997205200)
,p_shared_query_id=>wwv_flow_api.id(72719929032717566)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select y.nmbre_trcro as abgdo,y.nmbre_crgo as cargo',
'  from genesys.gf_g_titulos_judicial x',
'  join genesys.v_sg_g_usuarios y on y.id_fncnrio = x.id_fncnrio',
' where x.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'');'))
);
end;
/
