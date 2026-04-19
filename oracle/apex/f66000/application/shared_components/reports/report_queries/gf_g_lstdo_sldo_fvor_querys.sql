prompt --application/shared_components/reports/report_queries/gf_g_lstdo_sldo_fvor_querys
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(43072882913278400)
,p_name=>'gf_g_lstdo_sldo_fvor querys'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmro_dcmnto ',
'       , b.idntfccion_sjto_frmtda',
'       , trim(d.prmer_nmbre||'' ''||d.sgndo_nmbre||'' ''||d.prmer_aplldo||'' ''||d.sgndo_aplldo) as nmbre',
'       , trunc(b.fcha_rcdo) as fcha_rcdo',
unistr('       , decode(b.cdgo_rcdo_estdo,''AP'', ''S\00ED'', ''No'' ) as stdo'),
'       , a.vlor_sldo_fvor',
'       , c.id_bnco',
'       , c.dscrpcion_bnco',
'       , c.id_bnco_cnta',
'       , c.nmro_cnta      ',
'       , upper(json_value( :P37_JSON , ''$.nmbre_rprte'')) as nmbre_rprte',
'       , json_value( :P37_JSON , ''$.fcha_incial'') as fcha_incio',
'       , json_value( :P37_JSON , ''$.fcha_fnal'') as fcha_fnal',
'    from gf_g_saldos_favor a ',
'    join v_re_g_recaudos b ',
'      on a.id_orgen = b.id_rcdo',
'    join v_re_g_recaudos_control c',
'      on b.id_rcdo_cntrol= c.id_rcdo_cntrol',
'    join v_si_i_sujetos_responsable d',
'      on a.id_sjto_impsto = d.id_sjto_impsto      ',
'      where a.cdgo_clnte      = :F_CDGO_CLNTE',
'      and a.id_impsto         = json_value( :P37_JSON , ''$.id_impsto'') ',
'      and a.id_impsto_sbmpsto = json_value( :P37_JSON , ''$.id_impsto_sbmpsto'')',
'      and d.prncpal_s_n    = ''S''',
'      and trunc(b.fcha_rcdo) between to_date(json_value( :P37_JSON , ''$.fcha_incial'')) and to_date(json_value( :P37_JSON , ''$.fcha_fnal''))',
'      and c.id_bnco = nvl(json_value( :P37_JSON , ''$.id_bnco''),c.id_bnco) ',
' order by c.nmro_cnta;'))
,p_xml_structure=>'STANDARD'
,p_format=>'PDF'
,p_output_file_name=>'gf_g_lstdo_sldo_fvor querys'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(43073013802278412)
,p_shared_query_id=>wwv_flow_api.id(43072882913278400)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmro_dcmnto ',
'       , b.idntfccion_sjto_frmtda',
'       , trim(d.prmer_nmbre||'' ''||d.sgndo_nmbre||'' ''||d.prmer_aplldo||'' ''||d.sgndo_aplldo) as nmbre',
'       , trunc(b.fcha_rcdo) as fcha_rcdo',
unistr('       , decode(b.cdgo_rcdo_estdo,''AP'', ''S\00ED'', ''No'' ) as stdo'),
'       , a.vlor_sldo_fvor',
'       , c.id_bnco',
'       , c.dscrpcion_bnco',
'       , c.id_bnco_cnta',
'       , c.nmro_cnta      ',
'       , upper(json_value( :P37_JSON , ''$.nmbre_rprte'')) as nmbre_rprte',
'       , json_value( :P37_JSON , ''$.fcha_incial'') as fcha_incio',
'       , json_value( :P37_JSON , ''$.fcha_fnal'') as fcha_fnal',
'    from gf_g_saldos_favor a ',
'    join v_re_g_recaudos b ',
'      on a.id_orgen = b.id_rcdo',
'    join v_re_g_recaudos_control c',
'      on b.id_rcdo_cntrol= c.id_rcdo_cntrol',
'    join v_si_i_sujetos_responsable d',
'      on a.id_sjto_impsto = d.id_sjto_impsto      ',
'      where a.cdgo_clnte      = :F_CDGO_CLNTE',
'      and a.id_impsto         = json_value( :P37_JSON , ''$.id_impsto'') ',
'      and a.id_impsto_sbmpsto = json_value( :P37_JSON , ''$.id_impsto_sbmpsto'')',
'      and d.prncpal_s_n    = ''S''',
'      and trunc(b.fcha_rcdo) between to_date(json_value( :P37_JSON , ''$.fcha_incial'')) and to_date(json_value( :P37_JSON , ''$.fcha_fnal''))',
'      and c.id_bnco = nvl(json_value( :P37_JSON , ''$.id_bnco''),c.id_bnco) ',
' order by c.nmro_cnta;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(43073226114278416)
,p_shared_query_id=>wwv_flow_api.id(43072882913278400)
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
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
