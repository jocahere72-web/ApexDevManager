prompt --application/shared_components/reports/report_queries/gf_g_crtra_x_impsto_x_sjto_x_vgncia
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(137699838176143452)
,p_name=>'gf_g_crtra_x_impsto_x_sjto_x_vgncia'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'       (select upper(nmbre_rprte)  from gn_d_reportes m  where m.id_rprte  = :P_ID_RPRTE)nmbre_rpte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_crtra_x_impsto_x_sjto_x_vgncia'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(137708613254432584)
,p_shared_query_id=>wwv_flow_api.id(137699838176143452)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'       (select upper(nmbre_rprte)  from gn_d_reportes m  where m.id_rprte  = :P_ID_RPRTE)nmbre_rpte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(137708815756432586)
,p_shared_query_id=>wwv_flow_api.id(137699838176143452)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''DEUDOR PRINCIPAL'' cncpto,',
'    CASE',
'        WHEN b.cdgo_idntfccion_tpo = ''N'' THEN ''PERSONA JURIDICA'' ELSE ''PERSONA NATURAL''',
'    END AS tpo_ddor,',
'    ''R'' || b.idntfccion_sjto AS idntfccion_sjto,',
'    b.idntfccion_rspnsble,',
'    b.cdgo_idntfccion_tpo tpo,',
'    b.prmer_nmbre razon,',
'    ( a.vlor_sldo_cptal + a.vlor_intres ) vlor_ttal',
'FROM',
'    (',
'        SELECT',
'            a.id_sjto_impsto,',
'            SUM(a.vlor_sldo_cptal) vlor_sldo_cptal,',
'            SUM(a.vlor_intres) vlor_intres',
'        FROM',
'            v_gf_g_cartera_x_vigencia a',
'        WHERE',
'            cdgo_clnte    = :F_CDGO_CLNTE',
'            AND id_impsto = json_value( :P37_JSON , ''$.id_impsto'')',
'            AND id_impsto_sbmpsto = json_value( :P37_JSON , ''$.id_impsto_sbmpsto'')',
'            AND a.cdgo_mvnt_fncro_estdo IN ( ''NO'' )',
'            AND a.vgncia <= json_value(:P37_JSON , ''$.vgncia'')',
'        GROUP BY',
'            a.id_sjto_impsto',
'    ) a',
'    JOIN v_si_i_sujetos_responsable b ON a.id_sjto_impsto = b.id_sjto_impsto',
'    JOIN si_i_sujetos_impuesto      c ON c.id_sjto_impsto = a.id_sjto_impsto AND c.id_sjto_estdo = 1',
'WHERE',
'    a.vlor_sldo_cptal + a.vlor_intres >= 1',
'    AND b.idntfccion_rspnsble NOT IN ( ''8000967341'', ''0'', ''.'', ''79969238'' )',
'    AND b.prmer_nmbre NOT IN ( ''MUNICIPIO DE MONTERIA'' )',
'ORDER BY',
'    b.idntfccion_sjto'))
);
end;
/
