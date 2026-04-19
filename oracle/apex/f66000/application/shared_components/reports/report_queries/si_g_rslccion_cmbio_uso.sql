prompt --application/shared_components/reports/report_queries/si_g_rslccion_cmbio_uso
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(40640499723189563)
,p_name=>'si_g_rslccion_cmbio_uso'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'         select d.idntfccion_sjto_frmtda',
'              , trim( e.prmer_nmbre||'' ''||e.sgndo_nmbre||'' ''||e.prmer_aplldo||'' ''||e.sgndo_aplldo) as nmbre         ',
'              , a.nmro_dcmto_sprte',
'              , a.fcha_dcmnto_sprte',
'              , b.dscrpcion_uso_slo_antrior',
'              , c.dscrpcion_prdo_dstno',
'              , b.dscrpcion_estrto_antrior',
'              , b.dscrpcion_uso_slo_nvo',
'              , a.obsrvcion',
'              , b.dscrpcion_estrto_nvo',
'              , a.nmbre_trcro',
'              , a.fcha_rgstro',
'              , a.fcha_incio_aplccion              ',
'           from v_si_g_novedades_predio  a',
'           join v_si_g_novedades_predio_dtlle b',
'             on a.id_nvdad_prdio  = b.id_nvdad_prdio',
'           join v_si_i_predios c',
'             on b.id_sjto_impsto = c.id_sjto_impsto',
'           join v_si_i_sujetos_impuesto d',
'             on b.id_sjto_impsto= d.id_sjto_impsto',
'           join si_i_sujetos_responsable e',
'             on b.id_sjto_impsto=e.id_sjto_impsto',
'          where d.cdgo_clnte =:F_ID_CLNTE',
'            and a.id_impsto =json_value( :P19_JSON , ''$.id_impsto'')',
'            and a.id_impsto_sbmpsto=json_value( :P19_JSON , ''$.id_impsto_sbmpsto'')',
'            and a.nmro_dcmto_sprte=json_value( :P19_JSON , ''$.nmro_dcmnto'')',
'            and a.fcha_incio_aplccion between json_value( :P19_JSON , ''$.fcha_incio'') and json_value( :P19_JSON , ''$.fcha_fnal'')           ',
'            and a.id_acto_tpo = json_value( :P19_JSON , ''$.id_acto_tpo'')',
'            and a.nmbre_trcro like ''%''||json_value( :P19_JSON , ''$.nmbre'')||''%''',
'             or a.nmbre_trcro is null;'))
,p_report_layout_id=>wwv_flow_api.id(40672205772623874)
,p_format=>'PDF'
,p_output_file_name=>'si_g_rslccion_cmbio_uso'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21793350066862672)
,p_shared_query_id=>wwv_flow_api.id(40640499723189563)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'         select d.idntfccion_sjto_frmtda',
'              , trim( e.prmer_nmbre||'' ''||e.sgndo_nmbre||'' ''||e.prmer_aplldo||'' ''||e.sgndo_aplldo) as nmbre         ',
'              , a.nmro_dcmto_sprte',
'              , a.fcha_dcmnto_sprte',
'              , b.dscrpcion_uso_slo_antrior',
'              , c.dscrpcion_prdo_dstno',
'              , b.dscrpcion_estrto_antrior',
'              , b.dscrpcion_uso_slo_nvo',
'              , a.obsrvcion',
'              , b.dscrpcion_estrto_nvo',
'              , a.nmbre_trcro',
'              , trunc(a.fcha_rgstro) as fcha_rgstro',
'              , a.fcha_incio_aplccion    ',
'              , upper(json_value( :P37_JSON , ''$.v_nmbre_rprte'')) as nmbre_rpte',
'           from v_si_g_novedades_predio  a',
'           join v_si_g_novedades_predio_dtlle b',
'             on a.id_nvdad_prdio  = b.id_nvdad_prdio',
'           join v_si_i_predios c',
'             on b.id_sjto_impsto = c.id_sjto_impsto',
'           join v_si_i_sujetos_impuesto d',
'             on b.id_sjto_impsto= d.id_sjto_impsto',
'           join si_i_sujetos_responsable e',
'             on b.id_sjto_impsto=e.id_sjto_impsto',
'          where d.cdgo_clnte =:F_CDGO_CLNTE',
'            and a.id_impsto =json_value( :P37_JSON , ''$.id_impsto'')            ',
'            and a.id_impsto_sbmpsto=json_value( :P37_JSON , ''$.id_impsto_sbmpsto'')',
'            and b.cdgo_nvdad_estdo=''AP''',
'            and e.prncpal_s_n=''S''',
'            and a.nmro_dcmto_sprte=nvl(json_value( :P37_JSON , ''$.nmro_dcmnto''),a.nmro_dcmto_sprte)',
'            and a.fcha_incio_aplccion between json_value( :P37_JSON , ''$.fcha_incio'') and json_value( :P37_JSON , ''$.fcha_fnal'')           ',
'            --and a.id_acto_tpo = json_value( :P37_JSON , ''$.id_acto_tpo'')',
'            and a.nmbre_trcro like ''%''||json_value( :P37_JSON , ''$.nmbre'')||''%''',
'             or a.nmbre_trcro is null;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21793556364862672)
,p_shared_query_id=>wwv_flow_api.id(40640499723189563)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'----------Encabezado y Pie de Pagina-----------------',
'select upper(b.nmbre_clnte) as nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,        ',
'       (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE) as nmbre_rpte',
'from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
end;
/
