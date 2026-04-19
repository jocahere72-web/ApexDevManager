prompt --application/shared_components/reports/report_queries/registro_ajuste
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(32518434906624203)
,p_name=>'Registro_Ajuste'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_clnte, upper(a.nmbre_clnte)nmbre_clnte, upper(a.slgan)slgan, a.id_ofcna, b.nmbre_ofcna ',
'from df_s_clientes a left join df_c_oficinas b on a.id_ofcna = b.id_ofcna',
'where a.cdgo_clnte = :F_CDGO_CLNTE;'))
,p_xml_structure=>'APEX'
,p_report_layout_id=>wwv_flow_api.id(33137387026029101)
,p_format=>'PDF'
,p_output_file_name=>'Registro_Ajuste'
,p_content_disposition=>'ATTACHMENT'
,p_xml_items=>'P14_ID_IMPSTO:P14_ID_AJSTE'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(98595515453675883)
,p_shared_query_id=>wwv_flow_api.id(32518434906624203)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--consulta para mostrar el encabezado del reporte(nombre del cliente, slogan , oficina)',
'select a.cdgo_clnte, upper(a.nmbre_clnte)nmbre_clnte, upper(a.slgan)slgan, a.id_ofcna, b.nmbre_ofcna ',
'from df_s_clientes a left join df_c_oficinas b on a.id_ofcna = b.id_ofcna',
'where  a.cdgo_clnte = :F_CDGO_CLNTE'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(98595722076675884)
,p_shared_query_id=>wwv_flow_api.id(32518434906624203)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Nombre del Impuesto y el nombre del usuario que elaboro el reporte.',
'select upper(NMBRE_IMPSTO)nmbre_impsto, (:F_NMBRE_USRIO)nmbre_usrio ',
'from df_c_impuestos ',
'where cdgo_clnte =:F_CDGO_CLNTE and id_impsto=:P14_ID_IMPSTO'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(98595910734675884)
,p_shared_query_id=>wwv_flow_api.id(32518434906624203)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--mustra la caracteristicas del Ajuste.',
'select upper(a.NMBRE_IMPSTO)nmbre_impsto,',
'a.id_ajste,',
'a.fcha,',
'b.tpo_ajste,',
'a.dscrpcion_motivo,',
'b.vlor_ajste,',
'upper(nmbre_rzon_scial) prptrio_prcpal,',
'pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'--a.idntfccion_sjto,',
'a.drccion,',
'a.obsrvcion,',
'b.vgncia,',
'b.dscrpcion_periodo,',
'b.dscrpcion_concepto,',
'b.sldo_cptal,',
'b.saldo_total ',
'from v_gf_g_ajustes a ',
'join v_gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'join v_si_i_sujetos_responsable c on a.id_sjto = c.id_sjto',
'where a.cdgo_clnte =:F_CDGO_CLNTE  and a.id_ajste =:P14_ID_AJSTE'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(98596177876675886)
,p_shared_query_id=>wwv_flow_api.id(32518434906624203)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- Consulta que retorna el logo del cliente',
' select pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan, ',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(98596316542675886)
,p_shared_query_id=>wwv_flow_api.id(32518434906624203)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--consulta para mostrar el total del ajuste',
'select sum(b.vlor_ajste) total_ajuste',
'from v_gf_g_ajustes a ',
'join v_gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'join v_si_i_sujetos_responsable c on a.id_sjto = c.id_sjto',
'where a.cdgo_clnte =:F_CDGO_CLNTE  and a.id_ajste =:P14_ID_AJSTE'))
);
end;
/
