prompt --application/shared_components/reports/report_queries/cb_g_rprte_ofcio_prssvo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(58441440453985663)
,p_name=>'cb_g_rprte_ofcio_prssvo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1',
'/*CARTERA X CONCEPTOS*/',
'select ',
'M.ID_PRCSOS_JRDCO_MVMNTO,',
'M.ID_PRCSOS_JRDCO,',
'C.VGNCIA,',
'C.PRDO,',
'C.DSCRPCION_CNCPTO,',
'--C.VLOR_SLDO_CPTAL,',
'--C.VLOR_INTRES,',
'--(C.VLOR_SLDO_CPTAL+C.VLOR_INTRES) as VLOR_TTAL',
'to_char(C.VLOR_SLDO_CPTAL, ''999G999G999G999G999G999'') as VLOR_SLDO_CPTAL,',
'to_char(C.VLOR_INTRES, ''999G999G999G999G999G999'') as VLOR_INTRES,',
'to_char(C.VLOR_SLDO_CPTAL+C.VLOR_INTRES, ''999G999G999G999G999G999'') as VLOR_TTAL',
'from V_GF_G_CARTERA_X_CONCEPTO c, CB_G_PROCESOS_JRDCO_MVMNTO m',
'where C.ID_SJTO_IMPSTO = M.ID_SJTO_IMPSTO',
'and C.VGNCIA = M.VGNCIA',
'and C.ID_PRDO = M.ID_PRDO',
'and C.ID_CNCPTO = M.ID_CNCPTO',
'and M.ESTDO = ''A''',
'and m.ID_PRCSOS_JRDCO = json_value(:F_APP_XML, ''$.id_prcsos_jrdco'')'))
,p_xml_structure=>'STANDARD'
,p_format=>'PDF'
,p_output_file_name=>'cb_g_rprte_ofcio_prssvo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(58441632547985665)
,p_shared_query_id=>wwv_flow_api.id(58441440453985663)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1',
'/*CARTERA X CONCEPTOS*/',
'select ',
'M.ID_PRCSOS_JRDCO_MVMNTO,',
'M.ID_PRCSOS_JRDCO,',
'C.VGNCIA,',
'C.PRDO,',
'C.DSCRPCION_CNCPTO,',
'--C.VLOR_SLDO_CPTAL,',
'--C.VLOR_INTRES,',
'--(C.VLOR_SLDO_CPTAL+C.VLOR_INTRES) as VLOR_TTAL',
'to_char(C.VLOR_SLDO_CPTAL, ''999G999G999G999G999G999'') as VLOR_SLDO_CPTAL,',
'to_char(C.VLOR_INTRES, ''999G999G999G999G999G999'') as VLOR_INTRES,',
'to_char(C.VLOR_SLDO_CPTAL+C.VLOR_INTRES, ''999G999G999G999G999G999'') as VLOR_TTAL',
'from V_GF_G_CARTERA_X_CONCEPTO c, CB_G_PROCESOS_JRDCO_MVMNTO m',
'where C.ID_SJTO_IMPSTO = M.ID_SJTO_IMPSTO',
'and C.VGNCIA = M.VGNCIA',
'and C.ID_PRDO = M.ID_PRDO',
'and C.ID_CNCPTO = M.ID_CNCPTO',
'and M.ESTDO = ''A''',
'and m.ID_PRCSOS_JRDCO = json_value(:F_APP_XML, ''$.id_prcsos_jrdco'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(58441896838985666)
,p_shared_query_id=>wwv_flow_api.id(58441440453985663)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2',
'',
'/*Informacion Proceso juridico y Responsable*/',
'select',
'(select A.NMRO_PRCSO_JRDCO from CB_G_PROCESOS_JURIDICO A where A.ID_PRCSOS_JRDCO = R.ID_PRCSOS_JRDCO) as Numero_Proceso_Juridico,',
'R.ID_PRCSOS_JRDCO, ',
'LISTAGG( rtrim(ltrim(R.PRMER_NMBRE))||'' ''||rtrim(ltrim(R.SGNDO_NMBRE))||'' ''||rtrim(ltrim(R.PRMER_APLLDO))||'' ''||rtrim(ltrim(R.SGNDO_APLLDO)),'','') WITHIN GROUP (ORDER BY rtrim(ltrim(R.PRMER_NMBRE))||'' ''||rtrim(ltrim(R.SGNDO_NMBRE))||'' ''||rtrim(ltrim(R'
||'.PRMER_APLLDO))||'' ''||rtrim(ltrim(R.SGNDO_APLLDO))) AS CONTRIBUYENTES,',
'R.DRCCION_NTFCCION,',
'R.IDNTFCCION',
'from CB_G_PROCESOS_JRDCO_RSPNSBLE R',
'WHERE R.ID_PRCSOS_JRDCO = json_value(:F_APP_XML, ''$.id_prcsos_jrdco'')',
'GROUP BY  R.ID_PRCSOS_JRDCO,R.DRCCION_NTFCCION,R.IDNTFCCION'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(58442071336985666)
,p_shared_query_id=>wwv_flow_api.id(58441440453985663)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3',
'',
'/*Selec Para el impuesto y sub impuesto*/',
'select',
'distinct a.NMBRE_IMPSTO as Nombre_Impuesto,',
'b.NMBRE_IMPSTO_SBMPSTO as Sub_impuesto',
'from V_GF_G_CARTERA_X_CONCEPTO C',
'join DF_C_IMPUESTOS a  on a.ID_IMPSTO = c.ID_IMPSTO',
'join DF_I_IMPUESTOS_SUBIMPUESTO b on  b.ID_IMPSTO_SBMPSTO = c.ID_IMPSTO_SBMPSTO',
'join CB_G_PROCESOS_JRDCO_MVMNTO m on C.VGNCIA = M.VGNCIA',
'                  and C.ID_PRDO = M.ID_PRDO',
'                  and C.ID_CNCPTO = M.ID_CNCPTO',
'                  and C.ID_SJTO_IMPSTO = M.ID_SJTO_IMPSTO',
'where ',
'm.ID_PRCSOS_JRDCO = json_value(:P71_JSON, ''$.ID_PRCSOS_JRDCO'')',
'and M.ESTDO = ''A'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(58442213996985666)
,p_shared_query_id=>wwv_flow_api.id(58441440453985663)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--4',
'',
'select a.dcmnto, ',
'        c.indcdor_ntfccion,',
'        c.nmro_acto_dsplay,',
'        c.nmro_acto,',
'        c.id_acto,',
'        to_char(c.fcha, ''FMMonth DD "de" YYYY'') fcha_acto,',
'        to_char(c.fcha, ''MM/YYYY'') fcha_acto_c,',
'        b.id_lte_imprsion,',
'        CASE',
'        WHEN d.frma_tpo = ''MNL'' THEN',
'            NULL',
'        ELSE',
'            pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => f.firma_file_blob)',
'        END               AS frma',
'   from cb_g_prcsos_jrdc_dcmnt_plnt a',
'   join cb_g_procesos_jrdco_dcmnto  b on b.id_prcsos_jrdco_dcmnto = a.id_prcsos_jrdco_dcmnto',
'   join gn_g_actos                  c on c.id_acto = b.id_acto',
'   join gn_d_actos_funcionario_frma d ON d.id_acto_tpo = c.id_acto_tpo',
'   join df_c_funcionarios           f ON f.id_fncnrio = d.id_fncnrio',
' where b.id_prcsos_jrdco = json_value(:F_APP_XML, ''$.id_prcsos_jrdco'')  -- 65565',
' and b.ID_ACTO = json_value(:P2_XML, ''$.id_acto'') '))
);
end;
/
