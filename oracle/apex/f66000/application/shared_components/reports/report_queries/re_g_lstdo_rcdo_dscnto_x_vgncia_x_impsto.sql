prompt --application/shared_components/reports/report_queries/re_g_lstdo_rcdo_dscnto_x_vgncia_x_impsto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(51332296036130256)
,p_name=>'re_g_lstdo_rcdo_dscnto_x_vgncia_x_impsto'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial,',
'        json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte, ',
'        (',
'            select cdgo_frmto_tpo',
'              from gn_d_reportes where upper(nmbre_rprte) =  upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))',
'        ) as frmto',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte       = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'re_g_lstdo_rcdo_dscnto_x_vgncia_x_impsto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(51353559430576451)
,p_shared_query_id=>wwv_flow_api.id(51332296036130256)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial,',
'        json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte, ',
'        (',
'            select cdgo_frmto_tpo',
'              from gn_d_reportes where upper(nmbre_rprte) =  upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))',
'        ) as frmto',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte       = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(51353705075576452)
,p_shared_query_id=>wwv_flow_api.id(51332296036130256)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Informe de recaudos con descuentos por vigencia e impuesto',
'SELECT',
'    h.concepto,',
'    COUNT(DISTINCT(h.id_rcdo)) nmro_pgos,',
'    SUM(h.capital) capital,',
'    SUM(h.interes) interes,',
'    SUM(h.descuento) descuento',
'FROM',
'    (',
'        SELECT',
'            g.id_rcdo,',
'            g.vgncia,',
'            g.concepto,',
'            SUM(decode(g.cdgo_cncpto_tpo, ''C'', g.pgdo)) capital,',
'            SUM(decode(g.cdgo_cncpto_tpo, ''I'', g.pgdo)) interes,',
'            SUM(decode(g.cdgo_cncpto_tpo, ''D'', g.dscntos)) descuento',
'        FROM',
'            (',
'                SELECT',
'                    c.id_rcdo,',
'                    d.vgncia,',
'                    (',
'                        SELECT f.dscrpcion FROM df_i_conceptos f WHERE f.id_cncpto = e.id_cncpto',
'                    ) concepto,',
'                    b.cdgo_cncpto_tpo,',
'                    SUM(nvl(b.vlor_dbe, 0)) pgdo,',
'                    SUM(nvl(b.vlor_hber, 0)) dscntos',
'                FROM',
'                    re_g_documentos                     a',
'                    JOIN re_g_documentos_detalle        b ON a.id_dcmnto = b.id_dcmnto',
'                    JOIN re_g_recaudos                  c ON c.id_orgen = a.id_dcmnto',
'                                                             AND c.id_sjto_impsto = a.id_sjto_impsto',
'                    JOIN gf_g_movimientos_detalle       d ON b.id_mvmnto_dtlle = d.id_mvmnto_dtlle',
'                    JOIN df_i_impuestos_acto_concepto   e ON e.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'                WHERE',
'                    --to_char(c.fcha_rcdo, ''YYYYMMDD'') BETWEEN ''20220502'' AND ''20221231''',
'                    c.fcha_rcdo BETWEEN json_value(:P37_JSON ,''$.fcha_incial'') AND json_value(:P37_JSON ,''$.fcha_fnal'')',
'                    AND c.cdgo_rcdo_estdo = ''AP''',
'                    AND d.vgncia <= to_char(sysdate, ''YYYY'')-- nvl(json_value(:P37_JSON, ''$.vgncia''), d.vgncia)',
'                    AND a.id_impsto = nvl(json_value(:P37_JSON, ''$.id_impsto''), a.id_impsto)',
'              --     AND C.ID_RCDO = 6483',
'                GROUP BY',
'                    c.id_rcdo,',
'                    d.vgncia,',
'                    e.id_cncpto,',
'                    b.cdgo_cncpto_tpo',
'            ) g',
'        GROUP BY',
'            g.id_rcdo,',
'            g.vgncia,',
'            g.concepto',
'    ) h',
'WHERE',
'    h.descuento > 0',
'GROUP BY',
'    h.concepto',
'ORDER BY',
'    h.concepto;'))
);
end;
/
