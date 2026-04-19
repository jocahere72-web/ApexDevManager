prompt --application/shared_components/reports/report_queries/ma_constancia_envio_correo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(23592715859854589)
,p_name=>'ma_constancia_envio_correo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--- Encabezado',
'select upper(b.nmbre_clnte) nmbre_clnte,',
'       upper(b.slgan) slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => a.file_blob) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b',
'    on (a.cdgo_clnte = b.cdgo_clnte)',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'';'))
,p_format=>'PDF'
,p_output_file_name=>'ma_constancia_envio_correo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(23849012678666620)
,p_shared_query_id=>wwv_flow_api.id(23592715859854589)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--- Encabezado',
'select upper(b.nmbre_clnte) nmbre_clnte,',
'       upper(b.slgan) slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => a.file_blob) as lgo_slgan,',
'       TO_CHAR(SYSTIMESTAMP, ''DD/MM/YYYY HH:MI AM'') AS HOY,',
'       a.file_mimetype',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b',
'    on (a.cdgo_clnte = b.cdgo_clnte)',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(23849289341666620)
,p_shared_query_id=>wwv_flow_api.id(23592715859854589)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_envio, a.fcha_rgstro, b.asnto, ',
'b.dstno email,',
'to_char(''<p>'' || REGEXP_REPLACE(REPLACE(REPLACE(TRIM(REGEXP_REPLACE(REGEXP_REPLACE(b.txto_mnsje,',
'                                                                                  ''<[^>]+>'',',
'                                                                                  '' '' -- Eliminar etiquetas HTML',
'                                                                                  ),',
unistr('                                                                   ''(?:\005Cs*<br\005Cs*\005C/?>\005Cs*|\005Cs*<\005C/p>\005Cs*|\005Cs*<\005C/div>\005Cs*)'', -- Reemplazar <br>, </p>, y </div> con saltos de l\00EDnea'),
unistr('                                                                   ''<br>'' -- Mantener los saltos de l\00EDnea como <br>'),
'                                                                   )),',
'                                               ''</t'',',
'                                               ''''),',
'                                       ''  '',',
unistr('                                       ''<br>'' -- Reemplazar m\00FAltiples espacios por un solo <br>'),
'                                       ),',
'                               ''(<br>\s*){3,}'',',
unistr('                               ''<br><br>'' -- Limitar a un m\00E1ximo de 2 <br>'),
'                               ) || ''</p>'') AS txto_mnsje',
'from ma_g_envios a',
'join ma_g_envios_medio b on b.id_envio = a.id_envio',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_envio = json_value(:P37_JSON, ''$.id_envio'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(23849445439666620)
,p_shared_query_id=>wwv_flow_api.id(23592715859854589)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--- Consultar adjunto',
'select listagg(c.file_name,chr(10))  within group (order by c.file_name) fle_name',
'from ma_g_envios a',
'join ma_g_envios_adjntos c on c.id_envio = a.id_envio',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_envio = json_value(:P37_JSON, ''$.id_envio'');'))
);
end;
/
