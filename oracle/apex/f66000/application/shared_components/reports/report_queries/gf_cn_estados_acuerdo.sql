prompt --application/shared_components/reports/report_queries/gf_cn_estados_acuerdo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(5887417174182187)
,p_name=>'gf_cn_estados_acuerdo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''p_id_impsto'' ) )nmbre_impsto,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte =:F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gf_cn_estados_acuerdo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22330439473138175)
,p_shared_query_id=>wwv_flow_api.id(5887417174182187)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto =  json_value( :P37_JSON , ''$.id_impsto'' )  )nmbre_impsto,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte =:F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22330688547138176)
,p_shared_query_id=>wwv_flow_api.id(5887417174182187)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select a.nmro_cnvnio,',
'         trunc(a.fcha_slctud) fcha_slctud,',
'         a.nmbre_slctnte,',
'         a.idntfccion_sjto_frmtda idntfccion_sjto,',
'         a.nmro_rdcdo,',
'         a.nmro_cta,',
'         b.dscrpcion,',
'         a.nmbre_impsto as nmbre_impsto_,',
'         a.nmbre_impsto_sbmpsto,',
'         json_value( :P37_JSON , ''$.idntfccion'' )as idntfccion_sjto_frmtda,        ',
'         upper(json_value( :P37_JSON , ''$.nmbre_rprte'' ))as nmbre_rprte,        ',
'         json_value( :P37_JSON , ''$.fcha_incial'' )as fcha_dsde,',
'         json_value( :P37_JSON , ''$.fcha_fnal'' )as fcha_hsta,',
'         upper(a.dscrpcion_cnvnio_estdo)dscrpcion_cnvnio_estdo',
'    from v_gf_g_convenios     a',
'    join gf_d_convenios_tipo  b ',
'      on a.id_cnvnio_tpo      = b.id_cnvnio_tpo',
'   where a.cdgo_clnte         = :F_CDGO_CLNTE',
'     and id_impsto            = json_value( :P37_JSON , ''$.id_impsto'' )',
'     and id_impsto_sbmpsto    = json_value( :P37_JSON , ''$.id_impsto_sbmpsto'' )',
'     and idntfccion_sjto      = nvl(json_value( :P37_JSON , ''$.idntfccion'' ),idntfccion_sjto)',
'     and cdgo_cnvnio_estdo    = nvl(json_value( :P37_JSON , ''$.stdo'' ),cdgo_cnvnio_estdo)',
'     and trunc(a.fcha_slctud) between json_value( :P37_JSON , ''$.fcha_incial'' ) ',
'                                  and json_value( :P37_JSON , ''$.fcha_fnal'' )',
'   ',
'     ',
'   ',
'   ',
'     '))
);
end;
/
