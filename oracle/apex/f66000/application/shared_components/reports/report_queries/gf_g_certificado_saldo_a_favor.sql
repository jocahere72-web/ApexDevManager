prompt --application/shared_components/reports/report_queries/gf_g_certificado_saldo_a_favor
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(21341520682863959)
,p_name=>'gf_g_certificado_saldo_a_favor'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Consulta que trae los datos de la proyecci\00F3n '),
'select b.nmbre_trcro as usuario_proyecto,',
'       c.nmbre_trcro as usuario_reviso,',
'       d.nmbre_trcro as usuario_firmo,',
'       a.id_acto,',
'       a.dcmnto',
'from gf_g_saldos_favor_documento a',
'left join v_sg_g_usuarios b on  a.id_usrio_prycto  = b.id_usrio',
'left join v_sg_g_usuarios c on  a.id_usrio_rvso    = c.id_usrio',
'left join v_sg_g_usuarios d on  a.id_usrio_frma    = d.id_usrio',
'where a.id_sldo_fvor_dcmnto = json_value(:P37_JSON, ''$.id_dcmnto'');'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_certificado_saldo_a_favor'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134776339361265885)
,p_shared_query_id=>wwv_flow_api.id(21341520682863959)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte) nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134776579414265885)
,p_shared_query_id=>wwv_flow_api.id(21341520682863959)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Documento',
'select pkg_gn_generalidades.fnc_ge_dcmnto( p_xml        => :P37_JSON',
'                                         , p_id_plntlla =>  json_value(:P37_JSON, ''$.id_rprte'')) as dcmnto',
'from dual;'))
);
end;
/
