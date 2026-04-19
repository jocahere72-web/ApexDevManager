prompt --application/shared_components/reports/report_queries/mc_g_solicitudes_embargos
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(16493854863520059)
,p_name=>'mc_g_solicitudes_embargos'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte, upper(b.slgan)slgan, pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan, to_char(systimestamp, ''DD/MON/YYYY'') HOY, :F_IP as ipaddr, :F_NMBRE_USRIO as Usuario, a.file_mimet'
||'ype ',
'from df_c_imagenes_cliente a join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'where a.cdgo_clnte = :F_CDGO_CLNTE and a.cdgo_imgen_clnte = ''L_E''',
'',
'--:F_CDGO_CLNTE'))
,p_report_layout_id=>wwv_flow_api.id(22987169134995870)
,p_format=>'PDF'
,p_output_file_name=>'mc_g_solicitudes_embargos'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22989459247087173)
,p_shared_query_id=>wwv_flow_api.id(16493854863520059)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype,',
'        (select pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => file_blob ) from df_c_imagenes_cliente where cdgo_clnte = :F_CDGO_CLNTE and cdgo_imgen_clnte = ''ES2'')lgo_slgan2,',
'         (select pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => file_blob ) from df_c_imagenes_cliente where cdgo_clnte = :F_CDGO_CLNTE and cdgo_imgen_clnte = ''PDP'')lgo_slgan_pdp',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22989670121087177)
,p_shared_query_id=>wwv_flow_api.id(16493854863520059)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DCMNTO_SLCTUD as dcmnto',
'     , to_char(FCHA_SLCTUD, ''FMMonth DD "de" YYYY'')fcha_acto',
'     , NMRO_ACTO_SLCTUD as nmro_acto',
'     , to_char(FCHA_SLCTUD, ''MM/YYYY'') fcha_acto_c',
'  from MC_G_SOLICITUDES_Y_OFICIOS ',
' where ID_SLCTD_OFCIO = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_slctd_ofcio'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22989844357087178)
,p_shared_query_id=>wwv_flow_api.id(16493854863520059)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmbre_trcro',
'     , d.nmbre_ofcna',
'     , e.nmbre_crgo',
'     , b.dscrpcion as tpo_acto',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo             b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios         c on a.id_fncnrio  = c.id_fncnrio',
'  join df_c_oficinas               d on c.id_ofcna    = d.id_ofcna',
'  join df_c_cargos                 e on c.id_crgo     = e.id_crgo',
'  join CB_G_PROCESOS_JRDCO_DCMNTO  f on f.ID_ACTO_TPO = b.ID_ACTO_TPO',
' where b.cdgo_clnte             = :F_CDGO_CLNTE',
'   and f.ID_PRCSOS_JRDCO_DCMNTO = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_prcsos_jrdco_dcmnto'')'))
);
end;
/
