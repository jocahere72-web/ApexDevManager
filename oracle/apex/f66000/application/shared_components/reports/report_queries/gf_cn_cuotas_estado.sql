prompt --application/shared_components/reports/report_queries/gf_cn_cuotas_estado
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(122816527499896847)
,p_name=>'gf_cn_cuotas_estado'
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
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gf_cn_cuotas_estado'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22325636316844046)
,p_shared_query_id=>wwv_flow_api.id(122816527499896847)
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
 p_id=>wwv_flow_api.id(22325865943844047)
,p_shared_query_id=>wwv_flow_api.id(122816527499896847)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      select  a.idntfccion_sjto_frmtda idntfccion_sjto, ',
'            a.drccion_ntfccion,',
'            trim(b.prmer_nmbre||''''||b.sgndo_nmbre||''''||b.prmer_aplldo||''''||b.sgndo_aplldo) as prmer_nmbre,',
'            a.nmro_cnvnio,',
'            trunc(a.fcha_aplccion),',
'            a.nmro_cta nmro_ctas,',
'            a.nmbre_slctnte,',
'            c.nmro_cta,',
'            c.fcha_vncmnto,       ',
'            c.estdo_cta,        ',
'            upper(a.dscrpcion_cnvnio_estdo)dscrpcion_cnvnio_estdo,      ',
'            a.nmbre_impsto as nmbre_impsto_,',
'            a.nmbre_impsto_sbmpsto,',
'            json_value( :P37_JSON , ''$.idntfccion'' )as idntfccion_sjto_frmtda,        ',
'            c.vlor_cptal,',
'            c.vlor_intres,',
'            c.vlor_fncncion,',
'            c.vlor_ttal,',
'           json_value( :P37_JSON , ''$.fcha_incial'' ) as fcha_dsde,',
'            json_value( :P37_JSON , ''$.fcha_fnal'' ) as fcha_hsta,',
'            upper(json_value( :P37_JSON , ''$.nmbre_rprte'' ))as nmbre_rprte',
'       from v_gf_g_convenios          a',
'       join si_i_sujetos_responsable  b  on a.id_sjto_impsto = b.id_sjto_impsto ',
'                                        and b.prncpal_s_n    = ''S''',
'       join v_gf_g_convenios_extracto c  on a.id_cnvnio      = c.id_cnvnio',
'      where a.cdgo_clnte       = :F_CDGO_CLNTE',
'        and id_impsto          = json_value( :P37_JSON , ''$.id_impsto'' )',
'        and id_impsto_sbmpsto  = json_value( :P37_JSON , ''$.id_impsto_sbmpsto'' )',
'        and idntfccion_sjto    = nvl(json_value( :P37_JSON , ''$.idntfccion'' ),idntfccion_sjto)',
'        and cdgo_cnvnio_estdo  = nvl(json_value( :P37_JSON , ''$.stdo'' ),cdgo_cnvnio_estdo)',
'        and trunc(a.fcha_slctud) between  json_value( :P37_JSON , ''$.fcha_incial'' )',
'        and json_value( :P37_JSON , ''$.fcha_fnal'' )',
'        and c.actvo = ''S''',
'        ',
'   order by a.nmro_cnvnio,',
'            c.nmro_cta',
'            ',
' ',
'',
' ',
' ',
''))
);
end;
/
