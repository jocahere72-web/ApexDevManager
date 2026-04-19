prompt --application/shared_components/reports/report_queries/gf_g_rprte_actos_cbro_cctvo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(112362561620817279)
,p_name=>'gf_g_rprte_actos_cbro_cctvo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  pkg_gf_prescripcion.fnc_ca_prescrpcns_vgncias_sjto(p_cdgo_clnte => 6, p_id_prscrpcion => 112) as d_html',
'from    dual;'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_rprte_actos_cbro_cctvo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21805496475108840)
,p_shared_query_id=>wwv_flow_api.id(112362561620817279)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select b.cdgo_acto_tpo',
'         , b.dscrpcion',
'         , count (b.id_prcso) as cantidad          ',
'         , b.id_prcso ',
'         , b.dscrpcion_prcso',
'         , upper(json_value( :P37_JSON , ''$.nmbre_rprte'')) as nmbre_rprte',
'      from gn_g_actos        a ',
'      join v_gn_d_actos_tipo b ',
'        on a.id_acto_tpo   = b.id_acto_tpo ',
'     where a.cdgo_clnte    = :F_CDGO_CLNTE      ',
'       and a.fcha between to_date(json_value(:P37_JSON , ''$.fcha_dsde''),''DD/MM/YYYY'' ) and to_date(json_value(:P37_JSON , ''$.fcha_hsta''),''DD/MM/YYYY''  )',
'        and b.id_prcso in (',
'                                with prcsos (shuttle_item) as',
'                                        (select json_value(:P37_JSON , ''$.id_prcso'') from dual)',
'                            select regexp_substr(shuttle_item, ''[^:]+'', 1, level) one_item',
'                              from prcsos',
'                           connect by level <= regexp_count(shuttle_item, '':'') + 1',
'                           )         ',
'  group by b.cdgo_acto_tpo',
'         , b.dscrpcion',
'         , b.id_prcso',
'         , b.dscrpcion_prcso',
'     order by b.id_prcso;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21805695925108840)
,p_shared_query_id=>wwv_flow_api.id(112362561620817279)
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
'  where a.cdgo_clnte =:F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
end;
/
