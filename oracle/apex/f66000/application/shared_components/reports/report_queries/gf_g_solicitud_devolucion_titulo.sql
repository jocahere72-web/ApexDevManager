prompt --application/shared_components/reports/report_queries/gf_g_solicitud_devolucion_titulo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(12118771032616446)
,p_name=>'gf_g_solicitud_devolucion_titulo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''p_id_impsto'' ) )nmbre_impsto,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_solicitud_devolucion_titulo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(12029903463827311)
,p_shared_query_id=>wwv_flow_api.id(12118771032616446)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(12030183562827311)
,p_shared_query_id=>wwv_flow_api.id(12118771032616446)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --obtener html',
'/*   select dcmnto,',
'          nmro_acto_dsplay,',
'          initcap(to_char(sysdate, ''FMMONTH DD'')||'' de ''||to_char(sysdate, ''YYYY''))fcha_hoy',
'  from v_gf_g_titulos_jdcial_dcmnto ',
' where id_plntlla = json_value(:P2_XML, ''$.id_plntlla'')',
'   and id_ttlo_jdcial_dcmnto = json_value(:P2_XML, ''$.id_ttlo_jdcial_dcmnto'');*/',
'  select a.dcmnto,',
'       --pkg_gn_generalidades.fnc_date_to_text(sysdate) fcha_hoy,',
'       a.nmro_acto,',
'       a.nmro_acto_dsplay,',
'      initcap(to_char(sysdate, ''FMMONTH DD'')||'' de ''||to_char(sysdate, ''YYYY''))fcha_hoy,',
'       pkg_gn_generalidades.fnc_date_to_text(a.fcha_acto) fcha_acto',
'  from v_gf_g_titulos_jdcial_dcmnto a',
'  join gf_g_ttls_jdcl_dcmnt_asccn b',
'    on b.id_ttlo_jdcial_dcmnto = a.id_ttlo_jdcial_dcmnto',
'  join gf_g_titulos_judicial c',
'    on c.id_ttlo_jdcial = b.id_ttlo_jdcial',
' where c.id_instncia_fljo =  pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML,''id_instncia_fljo'')    ',
'    and a.id_plntlla =  pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_plntlla'')',
' FETCH NEXT 1 ROWS ONLY'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(12030388201827312)
,p_shared_query_id=>wwv_flow_api.id(12118771032616446)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Obtener Datos de Funcionario Firma de Acto de Reversion de Acuerdos de Pago',
'select c.nmbre_trcro, d.nmbre_ofcna, e.nmbre_crgo',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios c on a.id_fncnrio = c.id_fncnrio',
'  join df_c_oficinas d on c.id_ofcna = d.id_ofcna',
'  join df_c_cargos e on c.id_crgo = e.id_crgo',
' where b.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.cdgo_acto_tpo = ''SDT'';'))
);
end;
/
