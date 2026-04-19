prompt --application/shared_components/reports/report_queries/fi_g_expediente_analisis
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(3429000308249920)
,p_name=>'fi_g_expediente_analisis'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de pagina',
'select  upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
,p_xml_structure=>'STANDARD'
,p_report_layout_id=>wwv_flow_api.id(3428827847249764)
,p_format=>'PDF'
,p_output_file_name=>'fi_g_expediente_analisis'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3429234820249922)
,p_shared_query_id=>wwv_flow_api.id(3429000308249920)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de pagina',
'select  upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3429443434249923)
,p_shared_query_id=>wwv_flow_api.id(3429000308249920)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 2. Documento',
'select dcmnto as html',
'from fi_g_expedientes_analisis a',
'where id_expdnte_anlsis = json_value(:P37_JSON,''$.id_expdnte_anlsis'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(3429636553249923)
,p_shared_query_id=>wwv_flow_api.id(3429000308249920)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3. Firma Funcionario  ',
' select b.nmbre_trcro',
'     , b.nmbre_crgo      ',
'     , case when d.frma_tpo = ''MNL'' then ',
'                    null',
'            else',
'                    pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.firma_file_blob) ',
'       end as frma',
'     , case when d.frma_tpo = ''MNL'' then ',
'                    null',
'            else',
'                    b.dscrpcion_dcrto_jstfccion_frma  ',
'       end as dcrto_frma',
'  from fi_g_expedientes_analisis   a',
'  join v_gn_g_actos                b on a.id_acto         = b.id_acto',
'  join df_c_funcionarios           c on b.id_fncnrio_frma = c.id_fncnrio',
'  join gn_d_actos_funcionario_frma d on b.id_acto_tpo     = d.id_acto_tpo',
' where id_expdnte_anlsis           = json_value(:P37_JSON,''$.id_expdnte_anlsis'');'))
);
end;
/
