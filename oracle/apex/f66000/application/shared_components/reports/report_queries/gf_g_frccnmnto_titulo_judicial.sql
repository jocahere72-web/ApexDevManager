prompt --application/shared_components/reports/report_queries/gf_g_frccnmnto_titulo_judicial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(3730644947201210)
,p_name=>'gf_g_frccnmnto_titulo_judicial'
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
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_frccnmnto_titulo_judicial'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(11939561783542717)
,p_shared_query_id=>wwv_flow_api.id(3730644947201210)
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
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(11939735104542717)
,p_shared_query_id=>wwv_flow_api.id(3730644947201210)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--obtener html',
' select a.dcmnto,',
'       pkg_gn_generalidades.fnc_date_to_text(sysdate) fcha_hoy,',
'       a.nmro_acto,',
'       pkg_gn_generalidades.fnc_date_to_text(a.fcha_acto) fcha_acto',
'  from v_gf_g_titulos_jdcial_dcmnto a',
'  join gf_g_ttls_jdcl_dcmnt_asccn b on b.id_ttlo_jdcial_dcmnto = a.id_ttlo_jdcial_dcmnto',
'  join gf_g_titulos_judicial c on c.id_ttlo_jdcial = b.id_ttlo_jdcial',
' where c.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_instncia_fljo'')    '))
);
end;
/
