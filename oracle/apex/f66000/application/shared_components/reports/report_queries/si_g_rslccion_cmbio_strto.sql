prompt --application/shared_components/reports/report_queries/si_g_rslccion_cmbio_strto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(40760414826462555)
,p_name=>'si_g_rslccion_cmbio_strto'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        select a.nmro_dcmto_sprte',
'              , a.fcha_dcmnto_sprte              ',
'              , b.idntfccion_sjto_frmtda',
'              , c.nmro_acto             ',
'              , b.dscrpcion_estrto_antrior',
'              , b.dscrpcion_estrto_nvo',
'              , a.fcha_incio_aplccion ',
'              , a.fcha_rgstro',
'              , a.nmbre_trcro',
'              , json_value( :P19_JSON , ''$.v_nmbre_rprte'') as nmbre_rpte',
'           from v_si_g_novedades_predio  a',
'           join v_si_g_novedades_predio_dtlle b',
'             on a.id_nvdad_prdio  = b.id_nvdad_prdio      ',
'           join gn_g_actos c',
'             on b.id_acto = c.id_acto',
'          where b.cdgo_clnte =:F_CDGO_CLNTE',
'            and a.id_impsto =json_value( :P19_JSON , ''$.id_impsto'')',
'            and b.cdgo_nvdad_estdo=''AP''            ',
'            and a.id_impsto_sbmpsto=json_value( :P19_JSON , ''$.id_impsto_sbmpsto'')',
'            and a.nmro_dcmto_sprte=nvl(json_value( :P19_JSON , ''$.nmro_dcmnto''),a.nmro_dcmto_sprte)',
'            and a.fcha_incio_aplccion between json_value( :P19_JSON , ''$.fcha_incio'') and json_value( :P19_JSON , ''$.fcha_fnal'')           ',
'            and a.id_acto_tpo =153',
'            and a.nmbre_trcro like ''%''||json_value( :P19_JSON , ''$.nmbre'')||''%''',
'             or a.nmbre_trcro is null;'))
,p_report_layout_id=>wwv_flow_api.id(40793953089653764)
,p_format=>'PDF'
,p_output_file_name=>'si_g_rslccion_cmbio_strto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21794062579867880)
,p_shared_query_id=>wwv_flow_api.id(40760414826462555)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'        select a.nmro_dcmto_sprte',
'              , a.fcha_dcmnto_sprte              ',
'              , b.idntfccion_sjto_frmtda',
'              , c.nmro_acto             ',
'              , b.dscrpcion_estrto_antrior',
'              , b.dscrpcion_estrto_nvo',
'              , a.fcha_incio_aplccion ',
'              , trunc(a.fcha_rgstro) as fcha_rgstro',
'              , a.nmbre_trcro',
'              , upper(json_value( :P37_JSON , ''$.v_nmbre_rprte'')) as nmbre_rpte',
'           from v_si_g_novedades_predio  a',
'           join v_si_g_novedades_predio_dtlle b',
'             on a.id_nvdad_prdio  = b.id_nvdad_prdio      ',
'           join gn_g_actos c',
'             on b.id_acto = c.id_acto',
'          where b.cdgo_clnte =:F_CDGO_CLNTE',
'            and a.id_impsto =json_value( :P37_JSON , ''$.id_impsto'')',
'            and b.cdgo_nvdad_estdo=''AP''            ',
'            and a.id_impsto_sbmpsto=json_value( :P37_JSON , ''$.id_impsto_sbmpsto'')',
'            and a.nmro_dcmto_sprte=nvl(json_value( :P37_JSON , ''$.nmro_dcmnto''),a.nmro_dcmto_sprte)',
'            and a.fcha_incio_aplccion between json_value( :P37_JSON , ''$.fcha_incio'') and json_value( :P37_JSON , ''$.fcha_fnal'')           ',
'            --and a.id_acto_tpo =153',
'            and a.nmbre_trcro like ''%''||json_value( :P37_JSON , ''$.nmbre'')||''%''',
'             or a.nmbre_trcro is null;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21794223788867880)
,p_shared_query_id=>wwv_flow_api.id(40760414826462555)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE)nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
end;
/
