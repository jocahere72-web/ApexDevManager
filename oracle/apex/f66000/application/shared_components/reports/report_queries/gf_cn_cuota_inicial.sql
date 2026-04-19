prompt --application/shared_components/reports/report_queries/gf_cn_cuota_inicial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(122986662328301958)
,p_name=>'gf_cn_cuota_inicial'
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
,p_report_layout_id=>wwv_flow_api.id(123074617108760393)
,p_format=>'PDF'
,p_output_file_name=>'gf_cn_cuota_inicial'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123076337971794697)
,p_shared_query_id=>wwv_flow_api.id(122986662328301958)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(123076542729794697)
,p_shared_query_id=>wwv_flow_api.id(122986662328301958)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_cnvnio,',
'       trunc(a.fcha_aplccion) fecha_aplicacion,',
'       a.idntfccion_sjto,',
'       a.nmbre_slctnte,',
'       b.nmro_dcmnto, ',
'       a.vlor_cta_incial,',
'       a.ttal_cnvnio',
'from v_gf_g_convenios a join re_g_documentos b on a.id_dcmnto_cta_incial = B.Id_Dcmnto',
'where A.Fcha_Aplccion between sysdate - 300 and sysdate;'))
);
end;
/
