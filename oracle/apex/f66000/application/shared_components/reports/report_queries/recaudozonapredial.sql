prompt --application/shared_components/reports/report_queries/recaudozonapredial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(75285673614694041)
,p_name=>'recaudozonapredial'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        --(select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE)nmbre_rpte,',
'        json_value(:P37_JSON ,''$.nmbre_rprte'') nmbre_rpte,',
'        TO_DATE(json_value(:P37_JSON ,''$.fcha_incial''), ''DD/MM/YYYY'') fcha_incial,',
'        TO_DATE(json_value(:P37_JSON ,''$.fcha_fnal''), ''DD/MM/YYYY'') fcha_fnal',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_report_layout_id=>wwv_flow_api.id(75285222284693830)
,p_format=>'PDF'
,p_output_file_name=>'recaudozonapredial'
,p_content_disposition=>'ATTACHMENT'
);
end;
/
