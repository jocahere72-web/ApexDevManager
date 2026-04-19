prompt --application/shared_components/reports/report_queries/prueba_cartera_pivote
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(31603569400236080)
,p_name=>'prueba_cartera_pivote'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.vgncia,',
'        b.cdgo_mvnt_fncro_estdo,',
'        nvl(b.bse_grvble,0)bse_grvble,',
'        nvl(b.txto_trfa,''-/-'')txto_trfa,',
'        a.id_cncpto,',
'        d.dscrpcion,',
'        c.id_cncpto_intres_mra,',
'        a.vlor_dbe,',
'        a.vlor_hber',
'  from re_g_documentos_detalle a',
'  join v_gf_g_movimientos_detalle b on a.id_mvmnto_dtlle = b.id_mvmnto_dtlle',
'  join v_df_i_conceptos d on a.id_cncpto = d.id_cncpto',
' left join v_df_i_impuestos_acto_concepto c ',
'    on b.id_impsto 			= c.id_impsto ',
'   and b.id_impsto_sbmpsto 	= c.id_impsto_sbmpsto ',
'   and b.vgncia    			= c.vgncia ',
'   and b.id_prdo   			= c.id_prdo',
'   and a.id_cncpto 			= c.id_cncpto',
'   and c.gnra_intres_mra    =  ''S'' ',
'where a.id_dcmnto = 1935',
'order by b.vgncia, c.id_cncpto_intres_mra;'))
,p_format=>'PDF'
,p_output_file_name=>'prueba_cartera_pivote'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72496617974062015)
,p_shared_query_id=>wwv_flow_api.id(31603569400236080)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.vgncia,',
'        b.cdgo_mvnt_fncro_estdo,',
'        nvl(b.bse_grvble,0)bse_grvble,',
'        nvl(b.txto_trfa,''-/-'')txto_trfa,',
'        a.id_cncpto,',
'        d.dscrpcion,',
'        c.id_cncpto_intres_mra,',
'        a.vlor_dbe,',
'        a.vlor_hber',
'  from re_g_documentos_detalle a',
'  join v_gf_g_movimientos_detalle b on a.id_mvmnto_dtlle = b.id_mvmnto_dtlle',
'  join v_df_i_conceptos d on a.id_cncpto = d.id_cncpto',
' left join v_df_i_impuestos_acto_concepto c ',
'    on b.id_impsto 			= c.id_impsto ',
'   and b.id_impsto_sbmpsto 	= c.id_impsto_sbmpsto ',
'   and b.vgncia    			= c.vgncia ',
'   and b.id_prdo   			= c.id_prdo',
'   and a.id_cncpto 			= c.id_cncpto',
'   and c.gnra_intres_mra    =  ''S'' ',
'where a.id_dcmnto = 1935',
'order by b.vgncia, c.id_cncpto_intres_mra;'))
);
end;
/
