prompt --application/shared_components/reports/report_queries/gf_cn_proyeccion_plan_pago
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(73327491770913493)
,p_name=>'gf_cn_proyeccion_plan_pago'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = 1',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_report_layout_id=>wwv_flow_api.id(99815769974907632)
,p_format=>'PDF'
,p_output_file_name=>'gf_cn_proyeccion_plan_pago'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111267705581797415)
,p_shared_query_id=>wwv_flow_api.id(73327491770913493)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY HH12:MI:SS AM'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_IMPSTO'' ) )nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_RPRTE'' ) )nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
'   ',
'    '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111267961155797416)
,p_shared_query_id=>wwv_flow_api.id(73327491770913493)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Datos de la Proyecci\00F3n'),
'select trim(to_char(a.fcha_pryccion, ''DD/MM/YYY HH:MI:SS AM''))fcha_pryccion,',
'        (select trim(to_char(sum(vlor_cptal+vlor_intres),''$999,999,999,999,999'')) from gf_g_proyecciones_cartera where id_pryccion = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_PRYCCION'' ) ) ttal_crtra,',
'        trim(to_char(a.ttal_pryccion,''$999,999,999,999,999'')) ttal_pryccion,',
'        trim(to_char(a.vlor_cta_incial,''$999,999,999,999,999'')) vlor_cta_incial,',
'        a.nmro_cta,',
'        a.dscrpcion_prdcdad_cta,',
'        a.nmro_pryccion,',
'        b.idntfccion_sjto_frmtda, ',
'        b.drccion,',
'        upper(b.nmbre_pais || ''-'' || b.nmbre_dprtmnto || ''-'' || b.nmbre_mncpio) ubccion,',
'        b.drccion_ntfccion,',
'        upper(b.nmbre_pais_ntfccion || ''-'' || b.nmbre_dprtmnto_ntfccion || ''-'' || b.nmbre_mncpio_ntfccion) ubccion_ntfccion,',
'        c.nmbre_rzon_scial,',
'        a.dscrpcion_cnvnio_tpo',
'   from v_gf_g_proyecciones a',
'   join v_si_i_sujetos_impuesto b on a.id_sjto_impsto = b.id_sjto_impsto',
'   join v_si_i_sujetos_responsable c on b.id_sjto = c.id_sjto',
'    and c.prncpal_s_n = ''S''',
'  where a.id_pryccion = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_PRYCCION'' ) '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111268172090797416)
,p_shared_query_id=>wwv_flow_api.id(73327491770913493)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Cartera a convenir',
'select a.vgncia, ',
'        a.prdo,',
'        a.cdgo_cncpto || '' - '' || dscrpcion cncpto,',
'        trim(to_char(a.vlor_cptal,''$999,999,999,999,999'')) vlor_cptal,',
'        trim(to_char(a.vlor_intres,''$999,999,999,999,999'')) vlor_intres, ',
'        trim(to_char(a.vlor_ttal,''$999,999,999,999,999'')) vlor_ttal ',
'   from v_gf_g_proyecciones_cartera a ',
'  where a.id_pryccion = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_PRYCCION'' ) ',
'   '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111268367968797416)
,p_shared_query_id=>wwv_flow_api.id(73327491770913493)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Plan de pago de la proyecci\00F3n    '),
' select a.nmro_cta,',
'        to_char(a.fcha_vncmnto, ''DD/MM/YYYY'')fcha_vncmnto,',
'        trim(to_char(a.vlor_cptal,''999,999,999,999,999'')) vlor_cptal,',
'        trim(to_char(a.vlor_intres,''999,999,999,999,999'')) vlor_intres,',
'        trim(to_char(a.vlor_fncncion,''999,999,999,999,999'')) vlor_fncncion,',
'        trim(to_char(a.vlor_ttal,''999,999,999,999,999''))vlor_ttal',
'   from gf_g_proyecciones_extracto a',
'  where a.id_pryccion = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_PRYCCION'' ) ',
'  --order by a.nmro_cta',
'  union ',
'select  null, ',
'        ''Total'', ',
'        trim(to_char(sum(a.vlor_cptal),''$999,999,999,999,999''))vlor_cptal, ',
'        trim(to_char(sum(a.vlor_intres),''$999,999,999,999,999''))vlor_intres, ',
'        trim(to_char(sum(a.vlor_fncncion),''$999,999,999,999,999''))vlor_fncncion, ',
'        trim(to_char(sum(a.vlor_ttal),''$999,999,999,999,999'')) vlor_ttal',
'  from gf_g_proyecciones_extracto a',
'  where a.id_pryccion = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_PRYCCION'' ) ',
'  order by nmro_cta nulls last'))
);
end;
/
