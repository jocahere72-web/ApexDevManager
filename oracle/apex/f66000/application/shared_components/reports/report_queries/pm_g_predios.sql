prompt --application/shared_components/reports/report_queries/pm_g_predios
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(55132284916141135)
,p_name=>'pm_g_predios'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'       ',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = 1',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'pm_g_predios'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(103245974083638060)
,p_shared_query_id=>wwv_flow_api.id(55132284916141135)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'       ',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = 1',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(103246169594638063)
,p_shared_query_id=>wwv_flow_api.id(55132284916141135)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select  a.id_prdio_dstno, ',
'        a.cdgo_clnte, ',
'        a.id_impsto, ',
'        a.dscrpcion, ',
'        upper(b.nmbre_impsto)nmbre_impsto',
'  from df_i_predios_destino a',
'  join df_c_impuestos               b on a.id_impsto         		= b.id_impsto',
'   where a.cdgo_clnte = 1 and  a.id_impsto = 1'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(103246304494638063)
,p_shared_query_id=>wwv_flow_api.id(55132284916141135)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select cdgo_estrto,',
'       dscrpcion_estrto',
'  from DF_S_ESTRATOS'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(103246555299638063)
,p_shared_query_id=>wwv_flow_api.id(55132284916141135)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion,',
'       cdgo_prdio_clsfccion     ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(103246768810638063)
,p_shared_query_id=>wwv_flow_api.id(55132284916141135)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_clnte, ',
'       a.id_impsto,',
'       b.nmbre_impsto,',
'       a.cdgo_cncpto,',
'       a.dscrpcion',
'    from df_i_conceptos a',
'    join df_c_impuestos b on a.id_impsto = b.id_impsto',
'   where a.cdgo_clnte = 1  and  a.id_impsto = 1'))
);
end;
/
