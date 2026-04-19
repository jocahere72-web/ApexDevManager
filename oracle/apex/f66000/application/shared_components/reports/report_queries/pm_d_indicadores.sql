prompt --application/shared_components/reports/report_queries/pm_d_indicadores
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(55187545575418205)
,p_name=>'pm_d_indicadores'
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
,p_output_file_name=>'pm_d_indicadores'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72355794033461502)
,p_shared_query_id=>wwv_flow_api.id(55187545575418205)
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
 p_id=>wwv_flow_api.id(72355933270461503)
,p_shared_query_id=>wwv_flow_api.id(55187545575418205)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.vgncia,',
'       a.prdo,',
'       b.cdgo_indcdor_tpo,',
'       b.nmbre_indcdor_tpo, ',
'       b.vlor ',
'   from v_df_i_periodos a',
' join v_df_s_indicadores_economico b',
'   on to_char(b.fcha_dsde, ''YYYY'') >= a.vgncia',
'  and to_char(b.fcha_hsta, ''YYYY'') <= a.vgncia',
'where a.vgncia = 2018'))
);
end;
/
