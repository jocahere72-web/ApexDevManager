prompt --application/shared_components/reports/report_queries/gf_g_ddres_mrsos
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(138846924672968067)
,p_name=>'gf_g_ddres_mrsos'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''DEUDOR PRINCIPAL'' cncpto,',
'       case',
'         when sitf_nit_cc(c.idntfccion_sjto) = ''N'' then',
'          ''PERSONA JURIDICA''',
'         else',
'          ''PERSONA NATURAL''',
'       end as tpo_ddor,',
'       c.idntfccion_sjto nit,',
'       sitf_nit_cc(c.idntfccion_sjto) tpo,',
'       b.nmbre_rzon_scial razon,',
'       (a.vlor_sldo_cptal + a.vlor_intres) vlor_ttal',
'  from (select a.id_sjto_impsto,',
'               SUM(a.vlor_sldo_cptal) vlor_sldo_cptal,',
'               SUM(a.vlor_intres) vlor_intres',
'          from v_gf_g_cartera_x_vigencia a',
'         where cdgo_clnte = 23001',
'           and id_impsto = 230012',
'           and a.cdgo_mvnt_fncro_estdo in (''NO'')',
'           and a.vgncia <= 2021',
'         GROUP BY a.id_sjto_impsto) a',
'  join si_i_personas b',
'    on a.id_sjto_impsto = b.id_sjto_impsto',
'  join v_si_i_sujetos_impuesto c',
'    on c.id_sjto_impsto = a.id_sjto_impsto',
'   and c.id_sjto_estdo = 1',
' WHERE a.vlor_sldo_cptal + a.vlor_intres >= 5000000',
' and c.idntfccion_sjto not like ''X%''',
' and c.idntfccion_sjto not in (''12345678900'')',
' order by c.idntfccion_sjto'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_ddres_mrsos'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(138856110361134857)
,p_shared_query_id=>wwv_flow_api.id(138846924672968067)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''DEUDOR PRINCIPAL'' cncpto,',
'       case',
'         when sitf_nit_cc(c.idntfccion_sjto) = ''N'' then',
'          ''PERSONA JURIDICA''',
'         else',
'          ''PERSONA NATURAL''',
'       end as tpo_ddor,',
'       c.idntfccion_sjto nit,',
'       sitf_nit_cc(c.idntfccion_sjto) AS tpo,',
'       b.nmbre_rzon_scial AS razon,',
'       (a.vlor_sldo_cptal + a.vlor_intres) AS vlor_ttal,',
'       json_value(:P37_JSON ,''$.nmbre_rprte'' ) AS nmbre_rprte',
'  from (select a.id_sjto_impsto,',
'               SUM(a.vlor_sldo_cptal) vlor_sldo_cptal,',
'               SUM(a.vlor_intres) vlor_intres',
'          from v_gf_g_cartera_x_vigencia a',
'         where cdgo_clnte = json_value(:P37_JSON ,''$.cdgo_clnte'' )',
'           and id_impsto = json_value(:P37_JSON ,''$.id_impsto'' )',
'           and id_impsto_sbmpsto = json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' )',
'           and a.cdgo_mvnt_fncro_estdo in (''NO'')',
'           and a.vgncia <= json_value(:P37_JSON ,''$.vgncia'' )',
'         GROUP BY a.id_sjto_impsto) a',
'  join si_i_personas b',
'    on a.id_sjto_impsto = b.id_sjto_impsto',
'  join v_si_i_sujetos_impuesto c',
'    on c.id_sjto_impsto = a.id_sjto_impsto',
'   and c.id_sjto_estdo = 1',
' WHERE a.vlor_sldo_cptal + a.vlor_intres >= json_value(:P37_JSON ,''$.sldottal'' )',
' and c.idntfccion_sjto not like ''X%''',
' and c.idntfccion_sjto not in (''12345678900'')',
' order by c.idntfccion_sjto'))
);
end;
/
