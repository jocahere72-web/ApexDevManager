prompt --application/shared_components/reports/report_queries/gf_g_rprte_prdios_x_idntfccion
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(39848589404452561)
,p_name=>'gf_g_rprte_prdios_x_idntfccion'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.idntfccion',
'       , trim(d.prmer_nmbre|| '' '' ||d.sgndo_nmbre|| '' '' ||d.prmer_aplldo|| '' '' ||d.sgndo_aplldo) as nmbre',
'       , b.idntfccion_antrior_frmtda as ref_intrna',
'       , b.idntfccion_sjto_frmtda as ref_ctstral ',
'       , b.drccion',
'       , c.mtrcla_inmblria',
'       , a.vgncia',
'       , a.vlor_intres',
'       , a.vlor_sldo_cptal',
'       , (a.vlor_intres + a.vlor_sldo_cptal) as vlor_ttal',
'    from v_gf_g_cartera_x_concepto a',
'    join v_si_i_sujetos_impuesto b',
'      on a.id_sjto_impsto    = b.id_sjto_impsto',
'    join si_i_predios c',
'      on a.id_sjto_impsto    = c.id_sjto_impsto',
'    join si_i_sujetos_responsable d',
'      on a.id_sjto_impsto    = d.id_sjto_impsto',
'     and d.prncpal_s_n       = ''S''',
'   where a.id_sjto_impsto    = :P9_ID_SJTO_IMPSTO',
'     and a.id_impsto_sbmpsto = :P9_ID_IMPSTO_SBMPSTO;',
'    '))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_rprte_prdios_x_idntfccion'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21751724628585211)
,p_shared_query_id=>wwv_flow_api.id(39848589404452561)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select d.idntfccion',
'       , c.id_prdio',
'       , trim(d.prmer_nmbre|| '' '' ||d.sgndo_nmbre|| '' '' ||d.prmer_aplldo|| '' '' ||d.sgndo_aplldo) as nmbre',
'       , b.idntfccion_antrior_frmtda as ref_intrna',
'       , b.idntfccion_sjto_frmtda as ref_ctstral ',
'       , b.drccion',
'       , c.mtrcla_inmblria',
'       , a.cdgo_cncpto',
'       , a.dscrpcion_cncpto',
'       , a.prdo',
'       , a.vgncia',
'       , sum(a.vlor_intres)vlor_intres',
'       , sum(a.vlor_sldo_cptal) vlor_sldo_cptal',
'       , (sum(a.vlor_intres) + sum(a.vlor_sldo_cptal)) as vlor_ttal',
'       , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte ',
'    from v_gf_g_cartera_x_concepto a',
'    join v_si_i_sujetos_impuesto b',
'      on a.id_sjto_impsto    = b.id_sjto_impsto',
'    join si_i_predios c',
'      on a.id_sjto_impsto    = c.id_sjto_impsto',
'    join si_i_sujetos_responsable d',
'      on a.id_sjto_impsto    = d.id_sjto_impsto',
'     and d.prncpal_s_n       = ''S''     ',
'   where a.cdgo_clnte        = :F_CDGO_CLNTE',
'     and a.id_impsto         = json_value(:P37_JSON ,''$.id_impsto'')',
'     and a.id_impsto_sbmpsto = json_value(:P37_JSON ,''$.id_impsto_sbmpsto'') ',
'     and a.id_sjto_impsto    = json_value(:P37_JSON ,''$.id_sjto_impsto'')     ',
'   group by d.idntfccion',
'       , c.id_prdio',
'       , trim(d.prmer_nmbre|| '' '' ||d.sgndo_nmbre|| '' '' ||d.prmer_aplldo|| '' '' ||d.sgndo_aplldo)',
'       , b.idntfccion_antrior_frmtda',
'       , b.idntfccion_sjto_frmtda',
'       , b.drccion',
'       , c.mtrcla_inmblria',
'       , a.cdgo_cncpto',
'       , a.dscrpcion_cncpto',
'       , a.prdo',
'       , a.vgncia',
'       , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ));'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21751966924585212)
,p_shared_query_id=>wwv_flow_api.id(39848589404452561)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        (select upper(nmbre_rprte)  from gn_d_reportes m  where m.id_rprte  = :P_ID_RPRTE)nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
end;
/
