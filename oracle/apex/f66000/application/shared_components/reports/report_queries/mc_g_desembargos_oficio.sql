prompt --application/shared_components/reports/report_queries/mc_g_desembargos_oficio
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(16500992329551704)
,p_name=>'mc_g_desembargos_oficio'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- encabezado --',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'mc_g_desembargos_oficio'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(49590639038696816)
,p_shared_query_id=>wwv_flow_api.id(16500992329551704)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- encabezado --',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(49590830130696816)
,p_shared_query_id=>wwv_flow_api.id(16500992329551704)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--oficio de desembargo -- ',
'SELECT A.DCMNTO_DSMBRGO as dcmnto,',
'       A.NMRO_ACTO,',
'       to_char(A.FCHA_ACTO, ''FMMonth DD "de" YYYY'') as fcha_acto,',
'       to_char(A.FCHA_ACTO, ''MM/YYYY'') as fcha_acto_d',
'FROM MC_G_DESEMBARGOS_OFICIO A',
'WHERE A.ID_DSMBRGO_OFCIO = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_dsmbrgo_ofcio'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(49591010728696816)
,p_shared_query_id=>wwv_flow_api.id(16500992329551704)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*-- oficio de desembargo --',
'select c.nmbre_trcro',
'     , d.nmbre_ofcna',
'     , e.nmbre_crgo',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.firma_file_blob) as frma   ',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo             b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios         c on a.id_fncnrio = c.id_fncnrio',
'  join df_c_oficinas               d on c.id_ofcna = d.id_ofcna',
'  join df_c_cargos                 e on c.id_crgo = e.id_crgo',
'  join gn_g_actos                  f on f.ID_ACTO_TPO = b.ID_ACTO_TPO',
'  join MC_G_DESEMBARGOS_OFICIO     g on g.ID_ACTO = f.ID_ACTO ',
' where b.cdgo_clnte       = :F_CDGO_CLNTE',
'   and g.ID_DSMBRGO_OFCIO = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_dsmbrgo_ofcio'');*/',
'   ',
'  ',
' ',
'select c.nmbre_trcro',
'     , d.nmbre_ofcna',
'     , e.nmbre_crgo',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.firma_file_blob) as frma   ',
'from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo             b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios         c on a.id_fncnrio = c.id_fncnrio',
'  join df_c_oficinas               d on c.id_ofcna = d.id_ofcna',
'  join df_c_cargos                 e on c.id_crgo = e.id_crgo',
'  join gn_g_actos                  f on f.ID_ACTO_TPO = b.ID_ACTO_TPO',
'  join MC_G_DESEMBARGOS_OFICIO     g on g.ID_ACTO = f.ID_ACTO ',
'  join mc_g_desembargos_cartera    h on g.id_dsmbrgos_rslcion = h.id_dsmbrgos_rslcion',
'  join mc_g_embargos_cartera       i on h.id_embrgos_crtra = i.id_embrgos_crtra',
'  join mc_d_estados_cartera        j on i.id_estdos_crtra = j.id_estdos_crtra and j.cdgo_estdos_crtra not in (''N'')',
'where b.cdgo_clnte       = :F_CDGO_CLNTE',
'   and g.ID_DSMBRGO_OFCIO = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_dsmbrgo_ofcio''); '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(49591276508696816)
,p_shared_query_id=>wwv_flow_api.id(16500992329551704)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when c.cdgo_tpos_mdda_ctlar = ''FNC''',
unistr('           then ''NOTIF\00CDQUESE Y C\00DAMPLASE'''),
'           when c.cdgo_tpos_mdda_ctlar = ''BIM''',
'           then ''Con Respeto.''',
unistr('           else ''NOTIF\00CDQUESE Y C\00DAMPLASE'''),
'     end as lbel',
' from mc_g_desembargos_oficio     a',
' join mc_g_desembargos_resolucion b on b.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
' join mc_d_tipos_mdda_ctlar       c on c.id_tpos_mdda_ctlar  = b.id_tpos_mdda_ctlar',
'where id_dsmbrgo_ofcio = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_dsmbrgo_ofcio'');'))
);
end;
/
