prompt --application/shared_components/reports/report_queries/mc_g_desembargos_resolucion
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(16499952864545768)
,p_name=>'mc_g_desembargos_resolucion'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- encabezado --',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'mc_g_desembargos_resolucion'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(88894381874508100)
,p_shared_query_id=>wwv_flow_api.id(16499952864545768)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- encabezado --',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(88894526182508100)
,p_shared_query_id=>wwv_flow_api.id(16499952864545768)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- documento resolucion de desembargo',
'select a.DCMNTO_DSMBRGO as dcmnto,',
'       to_char(a.FCHA_ACTO, ''FMMonth DD "de" YYYY'',''nls_date_language=spanish'') as fcha_acto,',
'       a.NMRO_ACTO,',
'       to_char(a.FCHA_ACTO, ''MM/YYYY'') as fcha_acto_d,',
'       c.NMBRE_TRCRO PRYCTO',
'from MC_G_DESEMBARGOS_RESOLUCION a',
'join gn_g_actos b on b.id_acto = a.id_acto',
'join v_sg_g_usuarios c on c.id_usrio = b.id_usrio',
'where a.ID_DSMBRGOS_RSLCION = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_dsmbrgos_rslcion'')'))
);
end;
/
