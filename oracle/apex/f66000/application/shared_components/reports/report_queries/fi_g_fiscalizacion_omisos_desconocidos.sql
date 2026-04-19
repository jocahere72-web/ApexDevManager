prompt --application/shared_components/reports/report_queries/fi_g_fiscalizacion_omisos_desconocidos
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(59525803965043077)
,p_name=>'fi_g_fiscalizacion_omisos_desconocidos'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select  (''SECRETARIA DE HACIENDA''),',
'        ',
'        (''GERENCIA DE GESTION DE INGRESOS''),',
'        ',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''p_id_impsto'' )) nmbre_impsto,',
'        ',
'        (select b.dscrpcion ',
'         from fi_g_fsclzcion_expdnte_acto   a',
'         join gn_d_actos_tipo               b   on  a.id_acto_tpo   =   b.id_acto_tpo',
'         where a.id_fsclzcion_expdnte_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_fsclzcion_expdnte_acto'')) acto_tpo,',
'        ',
'        (select to_char(sysdate, ''dd/mm/yyyy'') from dual) fcha_crcion,',
'        ',
'        (select a.cdgo_trd ||''-''|| c.cdgo_srie ||''-''||  (select b.nmro_acto',
'                                                         from fi_g_fsclzcion_expdnte_acto    a',
'                                                         join gn_g_actos                     b   on  a.id_acto = b.id_acto',
'                                                         where id_fsclzcion_expdnte_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_fsclzcion_expdnte_acto''))',
'         from gd_d_trd  a',
'         join gd_d_trd_serie     b   on  a.id_trd    =   b.id_trd',
'         join gd_d_series        c   on  b.id_srie   =   c.id_srie',
'         where c.cdgo_srie = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''cdgo_srie'')) acto,',
'        ',
'        (select b.nmro_acto',
'         from fi_g_fsclzcion_expdnte_acto    a',
'         join gn_g_actos                     b   on  a.id_acto = b.id_acto',
'         where id_fsclzcion_expdnte_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_fsclzcion_expdnte_acto'')) nmro_acto,',
'        ',
'        (select to_char(sysdate, ''DD MONTH YYYY'') from dual) fcha,',
'        ',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        ',
'        :F_NMBRE_USRIO as Usuario,',
'        ',
'        :F_IP as ipaddr,',
'        ',
'        a.file_mimetype',
'        ',
'from df_c_imagenes_cliente a',
'join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'fi_g_fiscalizacion_omisos_desconocidos'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(59526019947043078)
,p_shared_query_id=>wwv_flow_api.id(59525803965043077)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select  (''SECRETARIA DE HACIENDA''),',
'        ',
'        (''GERENCIA DE GESTION DE INGRESOS''),',
'        ',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''p_id_impsto'' )) nmbre_impsto,',
'        ',
'        (select b.dscrpcion ',
'         from fi_g_fsclzcion_expdnte_acto   a',
'         join gn_d_actos_tipo               b   on  a.id_acto_tpo   =   b.id_acto_tpo',
'         where a.id_fsclzcion_expdnte_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_fsclzcion_expdnte_acto'')) acto_tpo,',
'        ',
'        (select to_char(sysdate, ''dd/mm/yyyy'') from dual) fcha_crcion,',
'        ',
'        (select a.cdgo_trd ||''-''|| c.cdgo_srie ||''-''||  (select b.nmro_acto',
'                                                         from fi_g_fsclzcion_expdnte_acto    a',
'                                                         join gn_g_actos                     b   on  a.id_acto = b.id_acto',
'                                                         where id_fsclzcion_expdnte_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_fsclzcion_expdnte_acto''))',
'         from gd_d_trd  a',
'         join gd_d_trd_serie     b   on  a.id_trd    =   b.id_trd',
'         join gd_d_series        c   on  b.id_srie   =   c.id_srie',
'         where c.cdgo_srie = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''cdgo_srie'')) acto,',
'        ',
'        (select b.nmro_acto',
'         from fi_g_fsclzcion_expdnte_acto    a',
'         join gn_g_actos                     b   on  a.id_acto = b.id_acto',
'         where id_fsclzcion_expdnte_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_fsclzcion_expdnte_acto'')) nmro_acto,',
'        ',
'        (select to_char(sysdate, ''DD MONTH YYYY'') from dual) fcha,',
'        ',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        ',
'        :F_NMBRE_USRIO as Usuario,',
'        ',
'        :F_IP as ipaddr,',
'        ',
'        a.file_mimetype',
'        ',
'from df_c_imagenes_cliente a',
'join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(59526291738043078)
,p_shared_query_id=>wwv_flow_api.id(59525803965043077)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Contenido del documento',
'select a.dcmnto,',
'       b.nmro_acto,',
'       to_char(fcha_crcion, ''dd/mm/yyyy'') as fcha_crcion',
'from fi_g_fsclzcion_expdnte_acto    a',
'join gn_g_actos                     b   on  a.id_acto = b.id_acto',
'where id_fsclzcion_expdnte_acto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_fsclzcion_expdnte_acto'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(59526408517043078)
,p_shared_query_id=>wwv_flow_api.id(59525803965043077)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Funcionario quien firma',
'select c.prmer_nmbre || '' ''||c.sgndo_nmbre||'' ''|| c.prmer_aplldo||'' ''||c.sgndo_aplldo as funcionario,',
'       e.nmbre_crgo,',
'       decode(a.frma_tpo,''MCN'',''SI'',''NO'') frma_mcnca,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => b.firma_file_blob ) as frma',
'from gn_d_actos_funcionario_frma   a',
'join df_c_funcionarios             b    on  a.id_fncnrio    =   b.id_fncnrio',
'join si_c_terceros                 c    on  b.id_trcro      =   c.id_trcro',
'join df_c_cargos                   e    on  b.id_crgo       =   e.id_crgo',
'where id_acto_tpo = (select id_acto_tpo from fi_g_fsclzcion_expdnte_acto',
'where id_fsclzcion_expdnte_acto =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_fsclzcion_expdnte_acto''));  '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(59526686251043078)
,p_shared_query_id=>wwv_flow_api.id(59525803965043077)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_trd ||''-''|| c.cdgo_srie as trd',
'from gd_d_trd  a',
'join gd_d_trd_serie     b   on  a.id_trd    =   b.id_trd',
'join gd_d_series        c   on  b.id_srie   =   c.id_srie',
'where c.cdgo_srie = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''cdgo_srie'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(59526815553043079)
,p_shared_query_id=>wwv_flow_api.id(59525803965043077)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Sujeto',
'select a.idntfccion_sjto,',
'       b.nmbre_rzon_scial',
'from v_si_i_sujetos_impuesto a',
'join si_i_personas           b on a.id_sjto_impsto = b.id_sjto_impsto',
'where a.id_sjto_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sjto_impsto'');'))
);
end;
/
