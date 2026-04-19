prompt --application/shared_components/reports/report_queries/re_g_convenio_pago
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(52149766353367837)
,p_name=>'re_g_convenio_pago'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_cnvnio,',
'       a.id_sjto_impsto,',
'       a.idntfccion_sjto,',
'       a.id_cnvnio_tpo,',
'       a.nmro_cnvnio,',
'       a.fcha_slctud,',
'       a.nmro_cta numero_cuotas_convenio,',
'       a.cdgo_prdcdad_cta,',
'       a.fcha_prmra_cta,',
'       a.Nmbre_Slctnte,',
'       a.Nmro_Idntfccion_Slctnte,',
'       a.id_dcmnto_cta_incial,',
'       b.dscrpcion,',
'       c.id_grntia_tpo dscrpcion_tipo_garantia,',
'       d.vgncia,',
'       d.prdo,',
'       d.vlor_sldo_cptal,',
'       d.vlor_intres,',
'       d.vlor_sldo_cptal + d.vlor_intres vlor_ttal,',
'       e.nmro_cta,',
'       e.vlor_ttal vlor_cta,',
'       e.fcha_pgo_cta,',
'       g.dscrpcion dscrpcion_decreto,',
'       ',
'       upper(h.nmbre_clnte)nmbre_clnte,',
'       upper(h.slgan)slgan,',
'       h.id_ofcna, ',
'       h.nmbre_ofcna, ',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => i.file_blob ) as lgo_slgan,',
'       i.file_mimetype',
'       ',
'       ',
'from v_gf_g_convenios a',
'left  join gf_g_convenios_garantia b on a.id_cnvnio      = b.id_cnvnio',
'left  join gf_d_garantias_Tipo     c on b.id_grntia_tpo  = c.id_grntia_tpo',
'join  v_gf_g_cartera_x_vigencia    d on a.id_sjto_impsto = d.id_sjto_impsto',
'join  gf_g_convenios_extracto      e on a.id_cnvnio      = e.id_cnvnio',
'join  gf_d_convenios_tipo          f on a.id_cnvnio_tpo  = f.id_cnvnio_tpo',
'join  df_c_decretos                g on g.id_dcrto       = f.id_dcrto',
'',
'join v_df_s_clientes                                                    h on a.cdgo_clnte = h.cdgo_clnte',
'join df_c_imagenes_cliente                                              i on a.cdgo_clnte = i.cdgo_clnte and i.cdgo_imgen_clnte = ''L_E''',
'',
'where a.id_cnvnio=:PXX_ID_CNVNIO and  a.cdgo_cnvnio_estdo = ''SLC'' '))
,p_report_layout_id=>wwv_flow_api.id(76348456074461699)
,p_format=>'PDF'
,p_output_file_name=>'re_g_convenio_pago'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(92177018795018854)
,p_shared_query_id=>wwv_flow_api.id(52149766353367837)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_cnvnio,',
'       a.id_acto,',
'       a.id_sjto_impsto,',
'       a.idntfccion_sjto,',
'       a.id_cnvnio_tpo,',
'       a.nmro_acto_dsplay,',
'       a.nmro_cnvnio,',
'       a.fcha_slctud,',
'       a.nmbre_impsto,',
'       a.nmro_cta numero_cuotas,',
'       a.cdgo_prdcdad_cta,',
'       a.dscrpcion_prdcdad_cta,',
'       a.fcha_prmra_cta,',
'       a.Nmbre_Slctnte,',
'       a.Nmro_Idntfccion_Slctnte,',
'       a.id_dcmnto_cta_incial,',
'       a.drccion_ntfccion,',
'       b.dscrpcion dscrpcion_garantia,',
'       c.id_grntia_tpo dscrpcion_tipo_garantia,',
'       d.vgncia,',
'       d.prdo,',
'       e.nmro_cta,',
'        --    e.vlor_ttal vlor_cta,',
'       ''$'' ||trim(to_char(e.vlor_ttal,''999G999G999G999G999G999G990'')) vlor_cta,',
'       e.fcha_pgo_cta,',
'       e.fcha_vncmnto,',
'       g.dscrpcion dscrpcion_decreto,',
'       ',
'       upper(h.nmbre_clnte)nmbre_clnte,',
'       upper(h.slgan)slgan,',
'       h.id_ofcna, ',
'       h.nmbre_ofcna, ',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => i.file_blob ) as lgo_slgan,',
'       i.file_mimetype,',
'       sysdate fecha_hoy',
'       ',
'from v_gf_g_convenios a',
'left  join gf_g_convenios_garantia b on a.id_cnvnio      = b.id_cnvnio',
'left  join gf_d_garantias_Tipo     c on b.id_grntia_tpo  = c.id_grntia_tpo',
'join  v_gf_g_cartera_x_vigencia    d on a.id_sjto_impsto = d.id_sjto_impsto',
'join  gf_g_convenios_extracto      e on a.id_cnvnio      = e.id_cnvnio',
'join  gf_d_convenios_tipo          f on a.id_cnvnio_tpo  = f.id_cnvnio_tpo',
'join  df_c_decretos                g on g.id_dcrto       = f.id_dcrto',
'',
'join v_df_s_clientes                                                    h on a.cdgo_clnte = h.cdgo_clnte',
'join df_c_imagenes_cliente                                              i on a.cdgo_clnte = i.cdgo_clnte and i.cdgo_imgen_clnte = ''L_E''',
'',
'where /*a.id_cnvnio = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P74_ID_CNVNIO'' ), a.id_cnvnio)*/',
'     a.id_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_acto'')',
'and  a.cdgo_cnvnio_estdo = ''APL''',
'order by  e.nmro_cta; '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(92177245718018854)
,p_shared_query_id=>wwv_flow_api.id(52149766353367837)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.nmbre_impsto ,',
'       d.vgncia ||''-''||d.prdo prdo ,  ',
'       ''$'' ||trim(to_char(d.vlor_sldo_cptal,''999G999G999G999G999G999G990'')) vlor_sldo_cptal,',
'      -- d.vlor_sldo_cptal,',
'    --   d.vlor_intres,',
'     ''$'' ||trim(to_char(d.vlor_intres,''999G999G999G999G999G999G990'')) vlor_intres,',
'     --  d.vlor_sldo_cptal + d.vlor_intres vlor_ttal',
'      ''$'' ||trim(to_char(d.vlor_sldo_cptal + d.vlor_intres,''999G999G999G999G999G999G990'')) vlor_ttal',
'from v_gf_g_convenios a',
'join  v_gf_g_cartera_x_vigencia    d on a.id_sjto = d.id_sjto',
'where /*a.id_cnvnio = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P74_ID_CNVNIO'' ), a.id_cnvnio)*/',
'     a.id_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_acto'')',
'and  a.cdgo_cnvnio_estdo = ''APL''',
'',
'union ',
'',
' select ''Total'' nmbre_impsto ,',
'        '''' prdo , ',
'     --   sum( d.vlor_sldo_cptal) vlor_sldo_cptal,',
'         ''$'' ||trim(to_char( sum( d.vlor_sldo_cptal),''999G999G999G999G999G999G990'')) vlor_sldo_cptal,',
'     --   sum( d.vlor_intres) vlor_intres,',
'         ''$'' ||trim(to_char( sum( d.vlor_intres),''999G999G999G999G999G999G990'')) vlor_intres,',
'      --  sum(d.vlor_sldo_cptal + d.vlor_intres) vlor_ttal',
'     ''$'' ||trim(to_char( sum(d.vlor_sldo_cptal + d.vlor_intres),''999G999G999G999G999G999G990'')) vlor_ttal',
'from v_gf_g_convenios a',
'join  v_gf_g_cartera_x_vigencia    d on a.id_sjto = d.id_sjto',
'where a.id_cnvnio = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P74_ID_CNVNIO'' ), a.id_cnvnio) and  a.cdgo_cnvnio_estdo = ''APL''',
'group by  d.vlor_sldo_cptal,d.vlor_intres',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(92177411342018854)
,p_shared_query_id=>wwv_flow_api.id(52149766353367837)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pkg_gn_generalidades.fnc_number_to_text(vlor_cta_incial,''d'') vlor_cta_ini_ltras,',
'       ''$'' ||trim(to_char(vlor_cta_incial,''999G999G999G999G999G999G990'')) vlor_cta_ini ',
'from gf_g_convenios',
'where id_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_acto'')',
'        --id_cnvnio=pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P74_ID_CNVNIO'' );'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(92177692511018854)
,p_shared_query_id=>wwv_flow_api.id(52149766353367837)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_bnco_mdio_pgo ',
' from v_re_g_recaudos a',
'',
' join gf_g_convenios  b on  a.id_orgen = b.id_dcmnto_cta_incial',
' where b.id_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_acto'')',
' --b.id_cnvnio = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P74_ID_CNVNIO'' );'))
);
end;
/
