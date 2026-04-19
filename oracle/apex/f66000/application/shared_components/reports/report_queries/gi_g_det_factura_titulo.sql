prompt --application/shared_components/reports/report_queries/gi_g_det_factura_titulo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(95806226691632472)
,p_name=>'gi_g_det_factura_titulo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte) nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        --pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'       --a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''PTC'';'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_det_factura_titulo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(99668628184335055)
,p_shared_query_id=>wwv_flow_api.id(95806226691632472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte) nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        --pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'       --a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''PTC'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(99668876251335055)
,p_shared_query_id=>wwv_flow_api.id(95806226691632472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.idntfccion_sjto,',
'       nvl(z.mtrcla_inmblria, ''NO REGISTRA'') as mtrcla_inmblria,',
'       trim(f.drccion) as drccion,',
'       f.nmbre_mncpio_ntfccion,',
'       f.nmbre_dprtmnto_ntfccion,',
'       trim(f.drccion_ntfccion) as drccion_ntfccion,',
'       to_char(a.fcha_dtrmncion, ''DD/MM/YYYY'') as fcha_dtrmncion,',
'       d.nmro_acto as cnsctvo,',
'       d.nmbre_trcro,',
'       d.nmbre_crgo,',
'       (select LISTAGG(distinct c.vgncia, '','') WITHIN GROUP(ORDER BY c.vgncia) from gi_g_determinacion_detalle c where c.id_dtrmncion = a.id_dtrmncion) vigencias',
'  from gi_g_determinaciones a',
'  join v_gn_g_actos d',
'    on a.id_acto = d.id_acto',
'  join df_c_funcionarios c',
'    on d.id_fncnrio_frma = c.id_fncnrio',
'  join gn_d_actos_funcionario_frma e',
'    on d.id_acto_tpo = e.id_acto_tpo',
'  join v_si_i_sujetos_impuesto f',
'    on f.id_sjto_impsto = a.id_sjto_impsto',
'  join si_i_predios z',
'    on z.id_sjto_impsto = f.id_sjto_impsto',
' where a.id_dtrmncion_lte = json_value(:p37_json, ''$.id_dtrmncion_lte'')',
'   and a.id_dtrmncion =',
'       nvl(json_value(:p37_json, ''$.id_dtrmncion''), a.id_dtrmncion)',
'   and ((json_value(:p37_json, ''$.gnrcion_tpo'') = ''ACT'' and',
'       d.nmro_acto between',
'       nvl(json_value(:p37_json, ''$.rango_inicio''), d.nmro_acto) and',
'       nvl(json_value(:p37_json, ''$.rango_fin''), d.nmro_acto)) or',
'       json_value(:p37_json, ''$.gnrcion_tpo'') is null)',
' order by d.nmro_acto;',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(99669088323335056)
,p_shared_query_id=>wwv_flow_api.id(95806226691632472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    a.id_dtrmncion,',
'    a.id_orgen,',
'    a.vgncia,',
'    x.estrto,    ',
'    x.txto_trfa,',
'    x.destino,',
'    TO_CHAR(x.bse_cncpto, ''FM$999G999G999G999G999G999G990'') AS bse_cncpto_1,',
'   TO_CHAR(',
'        SUM(DECODE(a.id_cncpto, x.id_cncpto, vlor_cptal, 0)),',
'        ''FM$999G999G999G999G999G999G990''',
'    ) AS vlor_cptal_prdial,',
'    TO_CHAR((',
'        SELECT SUM(e.vlor_cptal)',
'        FROM v_gi_g_determinacion_detalle e',
'        WHERE e.id_dtrmncion = a.id_dtrmncion',
'          AND e.cdgo_cncpto = ''1020''',
'    ), ''FM$999G999G999G999G999G999G990'') AS total_predial',
'',
'FROM',
'    v_gi_g_determinacion_detalle a',
'    JOIN (',
'        SELECT',
'            b.id_lqdcion,',
'            bse_cncpto,',
'            e.dscrpcion_estrto as estrto,',
'            txto_trfa,',
'            f.dscrpcion AS destino,',
'            d.id_cncpto',
'        FROM',
'            gi_g_liquidaciones_concepto b',
'            JOIN gi_g_liquidaciones_ad_predio c ON b.id_lqdcion = c.id_lqdcion',
'            JOIN df_i_impuestos_acto_concepto d ON b.id_impsto_acto_cncpto = d.id_impsto_acto_cncpto',
'                AND d.indcdor_trfa_crctrstcas = ''S''',
'            JOIN df_s_estratos e ON c.cdgo_estrto = e.cdgo_estrto',
'            JOIN df_i_predios_destino f ON c.id_prdio_dstno = f.id_prdio_dstno',
'    ) x ON a.id_orgen = x.id_lqdcion',
'',
'WHERE',
'    a.id_dtrmncion = json_value(:P37_JSON, ''$.id_dtrmncion'')',
'    AND a.vlor_cptal > 0',
'',
'GROUP BY',
'    a.id_dtrmncion,',
'    a.id_orgen,',
'    a.vgncia,',
'    x.estrto,',
'    x.txto_trfa,',
'    x.bse_cncpto,',
'    x.destino',
'',
'ORDER BY',
'    a.vgncia;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(99669299123335056)
,p_shared_query_id=>wwv_flow_api.id(95806226691632472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.prmer_nmbre nmbre, b.dscrpcion_idntfccion_tpo, c.idntfccion',
'  from gi_g_determinaciones a',
'  join gi_g_dtrmncn_rspnsble c',
'    on c.id_dtrmncion = a.id_dtrmncion',
'  join df_s_identificaciones_tipo b',
'    on c.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
' where a.id_dtrmncion = json_value(:P37_JSON, ''$.id_dtrmncion'')',
' order by c.prncpal_s_n desc, c.prmer_nmbre'))
);
end;
/
