prompt --application/shared_components/reports/report_queries/si_g_nvddes_prsona
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(74413336778756748)
,p_name=>'si_g_nvddes_prsona'
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
,p_format=>'PDF'
,p_output_file_name=>'si_g_nvddes_prsona'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(62084236816953188)
,p_shared_query_id=>wwv_flow_api.id(74413336778756748)
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
 p_id=>wwv_flow_api.id(62084496429953188)
,p_shared_query_id=>wwv_flow_api.id(74413336778756748)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 2. Documento',
'select dcmnto_html as html',
'  from si_g_novedades_persona',
' where id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(62084605230953189)
,p_shared_query_id=>wwv_flow_api.id(74413336778756748)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*--3. Firma Funcionario  ',
'select b.nmbre_trcro',
'     , b.nmbre_crgo ',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.firma_file_blob) as frma',
'  from si_g_novedades_persona a',
'  join v_gn_g_actos           b on a.id_acto         = b.id_acto',
'  join df_c_funcionarios      c on b.id_fncnrio_frma = c.id_fncnrio',
' where id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'');*/',
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
'  from si_g_novedades_persona      a',
'  join v_gn_g_actos                b on a.id_acto         = b.id_acto',
'  join df_c_funcionarios           c on b.id_fncnrio_frma = c.id_fncnrio',
'  join gn_d_actos_funcionario_frma d on b.id_acto_tpo     = d.id_acto_tpo',
' where id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(62084851849953189)
,p_shared_query_id=>wwv_flow_api.id(74413336778756748)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Tareas del flujo',
'/*select NMBRE_TRCRO USRIO_TREA, trim(to_char(fcha_fin_real, ''DD/MM/YYYY'')) FCHA_TREA, NMBRE_TREA',
'  from (select a.id_instncia_fljo,',
'               a.id_usrio,',
'               c.nmbre_trcro,',
'               a.id_fljo_trea_orgen,',
'               a.fcha_fin_real,',
'               b.nmbre_trea',
'          from wf_g_instancias_transicion a',
'          join v_wf_d_flujos_tarea b',
'            on a.id_fljo_trea_orgen = b.id_fljo_trea',
'          join v_sg_g_usuarios c',
'            on a.id_usrio = c.id_usrio',
'          join si_g_novedades_persona d on d.id_instncia_fljo = a.id_instncia_fljo',
'         where d.id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'')',
'         order by fcha_incio desc)',
' where ROWNUM <= 2*/',
' ',
' select nmbre_trcro as usrio_trea, ',
'       trim(to_char(',
'               case ',
'                 when rownum = 1 then sysdate',
'                 else fcha_fin_real',
'               end, ''DD/MM/YYYY'')) as fcha_trea, ',
'       nmbre_trea',
'  from (select a.id_instncia_fljo,',
'               a.id_usrio,',
'               c.nmbre_trcro,',
'               a.id_fljo_trea_orgen,',
'               a.fcha_fin_real,',
'               b.nmbre_trea',
'          from wf_g_instancias_transicion a',
'          join v_wf_d_flujos_tarea b',
'            on a.id_fljo_trea_orgen = b.id_fljo_trea',
'          join v_sg_g_usuarios c',
'            on a.id_usrio = c.id_usrio',
'          join si_g_novedades_persona d ',
'            on d.id_instncia_fljo = a.id_instncia_fljo',
'         where d.id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'')',
'         order by fcha_incio desc) ',
'where rownum <= 2',
''))
);
end;
/
