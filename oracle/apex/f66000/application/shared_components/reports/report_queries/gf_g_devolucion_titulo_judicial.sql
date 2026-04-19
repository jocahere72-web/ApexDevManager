prompt --application/shared_components/reports/report_queries/gf_g_devolucion_titulo_judicial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(13759921762492923)
,p_name=>'gf_g_devolucion_titulo_judicial'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_devolucion_titulo_judicial'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3973837845712041)
,p_shared_query_id=>wwv_flow_api.id(13759921762492923)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3974088722712042)
,p_shared_query_id=>wwv_flow_api.id(13759921762492923)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  --obtener html',
'  select a.dcmnto,',
'      -- pkg_gn_generalidades.fnc_date_to_text(sysdate) fcha_hoy,',
'       a.nmro_acto,',
'       pkg_gn_generalidades.fnc_date_to_text(a.fcha_acto) fcha_acto',
'  from v_gf_g_titulos_jdcial_dcmnto a',
'  join gf_g_ttls_jdcl_dcmnt_asccn b',
'    on b.id_ttlo_jdcial_dcmnto = a.id_ttlo_jdcial_dcmnto',
'  join gf_g_titulos_judicial c',
'    on c.id_ttlo_jdcial = b.id_ttlo_jdcial',
' where c.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML,''id_instncia_fljo'')    ',
' FETCH NEXT 1 ROWS ONLY;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3974251711712042)
,p_shared_query_id=>wwv_flow_api.id(13759921762492923)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       pkg_gn_generalidades.fnc_cl_fecha_texto(p_fecha => sysdate) fcha_hoy',
'  from dual;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3974493423712042)
,p_shared_query_id=>wwv_flow_api.id(13759921762492923)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(rtrim(replace(a.nmbre_dmnddo, ''.'', ''''))) as nmbre_dmnddo,',
'       initcap(e.dscrpcion_idntfccion_tpo) as dscrpcion_idntfccion_tpo,',
'       ltrim(a.idntfccion_dmnddo, ''0'') as idntfccion_dmnddo,',
'      ',
' --d.nmro_acto,',
'      --genesys.pkg_gn_generalidades.fnc_cl_fecha_texto(p_fecha => d.fcha) as fecha_acto,',
'       --listagg(g.nmro_dcmnto, '','') within group(order by g.nmro_dcmnto) as facturas,',
'       i.nmbre_trcro,',
'       i.nmbre_crgo,',
'       i.nmbre_ofcna',
'  from genesys.gf_g_titulos_judicial a',
'  join genesys.gf_g_ttls_jdcl_dcmnt_asccn b',
'    on b.id_ttlo_jdcial = a.id_ttlo_jdcial',
'  join genesys.gf_g_titulos_jdcial_dcmnto c',
'    on c.id_ttlo_jdcial_dcmnto = b.id_ttlo_jdcial_dcmnto',
'  join genesys.gn_g_actos d',
'    on d.id_acto = c.id_acto',
'  join genesys.df_s_identificaciones_tipo e',
'    on e.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'  join genesys.gn_d_actos_funcionario_frma h',
'    on h.id_acto_tpo = c.id_acto_tpo',
'  join genesys.v_sg_g_usuarios i',
'    on i.id_fncnrio = h.id_fncnrio',
'  /*join genesys.gf_g_titulos_jdcial_impsto j',
'    on j.id_ttlo_jdcial = a.id_ttlo_jdcial*/',
' where a.id_instncia_fljo =pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'')',
'   and c.id_acto_tpo = 105',
' group by initcap(rtrim(replace(a.nmbre_dmnddo, ''.'', ''''))),',
'          initcap(e.dscrpcion_idntfccion_tpo),',
'          ltrim(a.idntfccion_dmnddo, ''0''),',
'          --k.drccion_ntfccion,',
'          d.nmro_acto,',
'          genesys.pkg_gn_generalidades.fnc_cl_fecha_texto(p_fecha => d.fcha),',
'          i.nmbre_trcro,',
'          i.nmbre_crgo,',
'          i.nmbre_ofcna',
'          FETCH NEXT 1 ROWS ONLY;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3974676937712042)
,p_shared_query_id=>wwv_flow_api.id(13759921762492923)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select y.nmbre_trcro as abgdo,y.nmbre_crgo as cargo',
'  from genesys.gf_g_titulos_judicial x',
'  join genesys.v_sg_g_usuarios y on y.id_fncnrio = x.id_fncnrio',
' where x.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'')',
' FETCH NEXT 1 ROWS ONLY;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3974872978712042)
,p_shared_query_id=>wwv_flow_api.id(13759921762492923)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select listagg(k.idntfccion_sjto, '','') within group(order by k.idntfccion_sjto) as predios,',
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
' where b.id_instncia_fljo =  ',
' group by k.id_sjto_impsto,e.nmro_prcso_jrdco*/',
' select --listagg(b.idntfccion, '','') within group(order by b.idntfccion) as predios,',
' b.idntfccion as predios,',
'        d.nmro_prcso_jrdco',
'   from genesys.gf_g_titulos_judicial a',
'   left join genesys.v_mc_g_embargos_resolucion b',
'     on b.id_embrgos_rslcion = a.id_embrgo_rslcion',
'   left join genesys.mc_g_embrgos_crt_prc_jrd c',
'     on c.id_embrgos_crtra = b.id_embrgos_crtra',
'   left join genesys.cb_g_procesos_juridico d',
'     on d.id_prcsos_jrdco = c.id_prcsos_jrdco',
'   left join genesys.v_mc_g_embargos_cartera e',
'     on e.id_embrgos_crtra = b.id_embrgos_crtra',
'   join genesys.df_s_identificaciones_tipo f',
'     on f.cdgo_idntfccion_tpo = a.cdgo_idntfccion_tpo_dmnddo',
'  where a.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'')--json_value(:P2_XML, ''$.id_instncia_fljo'')',
'  and b.idntfccion is not null',
'  group by     d.nmro_prcso_jrdco,b.idntfccion'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3975092093712042)
,p_shared_query_id=>wwv_flow_api.id(13759921762492923)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   -- Firma del Contribuyente',
'select a.idntfccion_dmnddo',
'       ,a.nmbre_dmnddo',
'  from gf_g_titulos_judicial a',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and id_ttlo_jdcial = json_value(:P2_XML, ''$.id_ttlo_jdcial'')'))
);
end;
/
