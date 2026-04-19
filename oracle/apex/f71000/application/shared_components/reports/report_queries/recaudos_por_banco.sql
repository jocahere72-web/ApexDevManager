prompt --application/shared_components/reports/report_queries/recaudos_por_banco
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(36853801777580749)
,p_name=>'recaudos_por_banco'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select substr(b.DSCRPCION_BNCO , 6, 99) Banco ,    ',
'       sum(a.vlor) Total_Recaudos ,',
'       count(*) Numero_recaudos ,',
'       sum(a.vlor) Total_Bancos ',
'  from re_g_recaudos a',
'  join v_re_g_recaudos_control b on (a.id_rcdo_cntrol = b.id_rcdo_cntrol )',
' where  a.cdgo_rcdo_estdo = ''AP''',
'and (trunc(a.fcha_rcdo) between :P200_FECHA_DESDE and :P200_FECHA_HASTA) ',
' group by  b.DSCRPCION_BNCO;'))
,p_report_layout_id=>wwv_flow_api.id(36842107563277351)
,p_format=>'PDF'
,p_output_file_name=>'recaudos_por_banco'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(37618834452970378)
,p_shared_query_id=>wwv_flow_api.id(36853801777580749)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select substr(b.DSCRPCION_BNCO , 6, 99) Banco ,    ',
'       sum(a.vlor) Total_Recaudos ,',
'       count(*) Numero_recaudos ,',
'       sum(a.vlor) Total_Bancos ',
'  from re_g_recaudos a',
'  join v_re_g_recaudos_control b on (a.id_rcdo_cntrol = b.id_rcdo_cntrol )',
' where  a.cdgo_rcdo_estdo = ''AP''',
'and (trunc(a.fcha_rcdo) between :P200_FECHA_DESDE and :P200_FECHA_HASTA) ',
' group by  b.DSCRPCION_BNCO;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(37619022919970379)
,p_shared_query_id=>wwv_flow_api.id(36853801777580749)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)   nombre_cliente,',
'        upper(b.slgan)        slogan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) logo_slogan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') hoy,',
'         :F_IP              id  ,',
'         :F_ID_USRIO	    usuario,',
'         :P200_FECHA_DESDE  fecha_desde,',
'         :P200_FECHA_HASTA  fecha_hasta, ',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
end;
/
