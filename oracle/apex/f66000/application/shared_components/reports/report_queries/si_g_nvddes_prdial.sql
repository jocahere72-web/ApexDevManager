prompt --application/shared_components/reports/report_queries/si_g_nvddes_prdial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(48617049417708755)
,p_name=>'si_g_nvddes_prdial'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_entdad_nvdad',
'     , a.dscrpcion_acto_tpo',
'     , a.nmro_dcmto_sprte',
'     , a.fcha_dcmnto_sprte',
'     , a.fcha_incio_aplccion',
'     , a.obsrvcion',
'     , b.id_nvdad_prdio',
'     , b.idntfccion_sjto_frmtda',
'     , b.dscrpcion_dstno_antrior',
'     , b.dscrpcion_dstno_nvo',
'     , b.dscrpcion_uso_slo_antrior',
'     , b.dscrpcion_uso_slo_nvo',
'     , b.dscrpcion_estrto_antrior',
'     , b.dscrpcion_estrto_nvo',
'     , b.dscrpcion_sjto_estdo',
'     , c.id_nvdad_prdio_vgncia',
'     , c.id_nvdad_prdio_dtlle',
'     , c.vgncia',
'     , c.prdo',
'     , b.id_acto ',
'     , ''pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => nmbre_rprte )'' as nmbre_rprte',
'  from v_si_g_novedades_predio         a ',
'  join v_si_g_novedades_predio_dtlle   b  ',
'    on a.id_nvdad_prdio              = b.id_nvdad_prdio',
'  join v_si_g_novedades_prdio_vgncia   c',
'    on b.id_nvdad_prdio_dtlle        = c.id_nvdad_prdio_dtlle',
' where a.cdgo_clnte                  = 6--:F_CDGO_CLNTE',
'   and a.id_impsto                   = 16--pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''id_impsto'' )',
'   and a.id_impsto_sbmpsto           = 13--pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''id_impsto_sbmpsto'' )',
'   and a.fcha_incio_aplccion         = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''fcha_incio_aplccion'' ), a.fcha_incio_aplccion)',
'   and a.id_acto_tpo                 = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''id_acto_tpo'' ), a.id_acto_tpo)',
'   and a.id_entdad_nvdad             = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''id_entdad_nvdad'' ), a.id_entdad_nvdad)   ',
'   and b.idntfccion_sjto             = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''idntfccion_sjto'' ), b.idntfccion_sjto )',
'   and b.cdgo_nvdad_estdo            =''AP'';'))
,p_format=>'PDF'
,p_output_file_name=>'si_g_nvddes_prdial'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(9236323409996998)
,p_shared_query_id=>wwv_flow_api.id(48617049417708755)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_entdad_nvdad',
'     , a.dscrpcion_acto_tpo',
'     , a.nmro_dcmto_sprte',
'     , a.fcha_dcmnto_sprte',
'     , a.fcha_incio_aplccion',
'     , a.obsrvcion',
'     , b.id_nvdad_prdio',
'     , b.idntfccion_sjto_frmtda',
'     , b.dscrpcion_dstno_antrior',
'     , b.dscrpcion_dstno_nvo',
'     , b.dscrpcion_uso_slo_antrior',
'     , b.dscrpcion_uso_slo_nvo',
'     , b.dscrpcion_estrto_antrior',
'     , b.dscrpcion_estrto_nvo',
'     , b.dscrpcion_sjto_estdo',
'     , c.id_nvdad_prdio_vgncia',
'     , c.id_nvdad_prdio_dtlle',
'     , c.vgncia',
'     , c.prdo',
'     , b.id_acto ',
'     , upper(pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''nmbre_rprte'' )) as nmbre_rprte',
'  from v_si_g_novedades_predio         a ',
'  join v_si_g_novedades_predio_dtlle   b  ',
'    on a.id_nvdad_prdio              = b.id_nvdad_prdio',
'  join v_si_g_novedades_prdio_vgncia   c',
'    on b.id_nvdad_prdio_dtlle        = c.id_nvdad_prdio_dtlle',
' where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'   and a.id_impsto                   = (select extractvalue(xmltype(:P2_XML),''//id_impsto'') from dual) --pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''id_impsto'' )',
'   and a.id_impsto_sbmpsto           = (select extractvalue(xmltype(:P2_XML),''//id_impsto_sbmpsto'') from dual)  --pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''id_impsto_sbmpsto'' )',
'   and a.fcha_incio_aplccion         = nvl((select extractvalue(xmltype(:P2_XML),''//fcha_incio_aplccion'') from dual) , a.fcha_incio_aplccion)--pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''fcha_incio_aplccion'' )',
'   and a.id_acto_tpo                 = nvl((select extractvalue(xmltype(:P2_XML),''//id_acto_tpo'')from dual), a.id_acto_tpo) --pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''id_acto_tpo'' )',
'   and a.id_entdad_nvdad             = nvl((select extractvalue(xmltype(:P2_XML),''//id_entdad_nvdad'')from dual), a.id_entdad_nvdad)   --pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''id_entdad_nvdad'' )',
'   and b.idntfccion_sjto             = nvl((select extractvalue(xmltype(:P2_XML),''//idntfccion_sjto'')from dual), b.idntfccion_sjto )--pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''idntfccion_sjto'' )',
'   and b.cdgo_nvdad_estdo            =''AP'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(9236528227996998)
,p_shared_query_id=>wwv_flow_api.id(48617049417708755)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(b.nmbre_clnte)nmbre_clnte,        ',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario   ',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = 6--:F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
end;
/
