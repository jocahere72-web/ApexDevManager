prompt --application/shared_components/reports/report_queries/gf_g_certificado_responsabilidades
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(95785365487557441)
,p_name=>'gf_g_certificado_responsabilidades'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Responsabilidades ICA',
'select cv.vgncia as vncias_ica,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_ica',
'  from v_si_i_personas p',
'  join v_si_i_sujetos_impuesto si',
'    on si.id_sjto_impsto = p.id_sjto_impsto',
'  join si_c_sujetos s',
'    on s.id_sjto = si.id_sjto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''ICA''',
'   and si.id_sjto_estdo = 1',
'   and si.idntfccion_sjto = :P37_JSON',
'   and cv.vlor_sldo_cptal > 0',
' group by cv.vgncia',
' order by cv.vgncia;'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_certificado_responsabilidades'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111023412475076909)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Responsabilidades ICA',
'select cv.vgncia as vncias_ica,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_ica',
'  from v_si_i_personas p',
'  join v_si_i_sujetos_impuesto si',
'    on si.id_sjto_impsto = p.id_sjto_impsto',
'  join si_c_sujetos s',
'    on s.id_sjto = si.id_sjto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''ICA''',
'   and si.id_sjto_estdo = 1',
'   and si.idntfccion_sjto = :P37_JSON',
'   and cv.vlor_sldo_cptal > 0',
' group by cv.vgncia',
' order by cv.vgncia;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111023671071076910)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Responsabilidades ICA - Omisos',
'select o.vgncia as vgncia_o_ica,',
'       o.cdgo_prdcdad,',
'       case',
'         when o.cdgo_prdcdad = ''ANU'' then',
'          ''ANUAL DE INDUSTRIA Y COMERCIO''',
'         when o.cdgo_prdcdad = ''BIM'' then',
'          ''BIMESTRAL DE INDUSTRIA Y COMERCIO''',
'         when o.cdgo_prdcdad = ''MNS'' then',
'          ''MENSUAL DE INDUSTRIA Y COMERCIO''',
'         else',
'          ''INDUSTRIA Y COMERCIO''',
'       end as descripcion_o_ica',
'  from v_si_i_personas p',
'  join v_si_i_sujetos_impuesto si',
'    on si.id_sjto_impsto = p.id_sjto_impsto',
'  join v_fi_g_prdos_omso o',
'    on o.id_sjto_impsto = si.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto_sbmpsto = ''ICA''',
'   and si.id_sjto_estdo = 1',
'   and si.idntfccion_sjto = :P37_JSON',
'   and o.cdgo_prdcdad = ''ANU''',
'   and o.ANIO_LMTE_DCLRCION <= 5',
' group by o.vgncia, o.cdgo_prdcdad',
' order by o.vgncia;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111023822610076910)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Responsabilidades Predial',
'select si.id_sjto_impsto,',
'       si.idntfccion_sjto as referencia_p,',
'       nvl(si.mtrcla_inmblria, ''NO REGISTRA'') as mtrcla_inmblria_p,',
'       si.drccion as drccion_p,',
'       listagg(cv.vgncia, '', '') within group(order by cv.vgncia) as vgncias_p,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_p',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''IPU''',
'   and si.id_sjto_estdo = 1',
'   and sr.idntfccion_rspnsble = :P37_JSON',
'   and cv.vlor_sldo_cptal > 0',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
' group by si.id_sjto_impsto,',
'          si.idntfccion_sjto,',
'          si.mtrcla_inmblria,',
'          si.drccion;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111024055316076910)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Responsabilidades Valorizaci\00F3n'),
'select si.id_sjto_impsto,',
'       si.idntfccion_sjto as referencia_v,',
'       si.mtrcla_inmblria as mtrcla_inmblria_v,',
'       si.drccion as drccion_v,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_v',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto_sbmpsto = ''VAL''',
'   and sr.idntfccion_rspnsble = :P37_JSON',
'   and cv.vlor_sldo_cptal > 0',
'   and si.id_sjto_estdo = 1',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
' group by si.id_sjto_impsto,',
'          si.idntfccion_sjto,',
'          si.mtrcla_inmblria,',
'          si.drccion;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111024234037076910)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Responsabilidades Plusval\00EDa'),
'select si.id_sjto_impsto,',
'       si.idntfccion_sjto as referencia_pv,',
'       si.mtrcla_inmblria as mtrcla_inmblria_pv,',
'       si.drccion as drccion_p,',
'       (select p.hcho_gnrdor',
'          from v_gi_g_plusvalia_procso_dtlle p',
'         where p.id_sjto_impsto = si.id_sjto_impsto) as hcho_gnrdor_p,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_pv',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''PLU''',
'      --and sr.idntfccion_rspnsble = :P37_JSON',
'   and cv.vlor_sldo_cptal > 0',
' group by si.id_sjto_impsto,',
'          si.idntfccion_sjto,',
'          si.mtrcla_inmblria,',
'          si.drccion;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111024441344076910)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Responsabilidades Sobre Tasa Gasolina',
'select si.id_sjto_impsto,',
'       listagg(cv.vgncia || ''('' || cv.prdo || '')'', '', '') within group(order by cv.vgncia) as vgncias_s,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_s',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''SBT''',
'   and si.idntfccion_sjto = :P2025034_IDNTFCCION_SJTO',
'   and cv.vlor_sldo_cptal > 0',
'   and si.id_sjto_estdo = 1',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
' group by si.id_sjto_impsto;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111024660473076910)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Responsabilidades Sobre Tasa Gasolina - Omisos',
'select o.vgncia,',
'       o.cdgo_prdcdad,',
'       listagg(pe.prdo, '', '') within group(order by pe.prdo) as periodos,',
'       case',
'         when o.cdgo_prdcdad = ''ANU'' then',
'          ''ANUAL DE SOBRETASA GASOLINA''',
'         when o.cdgo_prdcdad = ''BIM'' then',
'          ''BIMESTRAL DE SOBRETASA GASOLINA''',
'         when o.cdgo_prdcdad = ''MNS'' then',
'          ''MENSUAL DE SOBRETASA GASOLINA''',
'         else',
'          ''SOBRETASA GASOLINA''',
'       end as descripcion',
'  from v_si_i_personas p',
'  join v_si_i_sujetos_impuesto si',
'    on si.id_sjto_impsto = p.id_sjto_impsto',
'  join v_fi_g_prdos_omso o',
'    on o.id_sjto_impsto = si.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto i',
'    on i.id_impsto = si.id_impsto',
'  join df_i_periodos pe',
'    on pe.id_prdo = o.id_prdo',
' where i.cdgo_impsto_sbmpsto = ''SBT''',
'   and si.idntfccion_sjto = :P37_JSON',
'   and o.ANIO_LMTE_DCLRCION <= 5',
' group by o.vgncia, o.cdgo_prdcdad',
' order by o.vgncia;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111024837548076910)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Responsabilidades Circulaci\00F3n y Transito'),
'select si.id_sjto_impsto,',
'       si.idntfccion_sjto as placa_vh,',
'       listagg(cv.vgncia, '', '') within group(order by cv.vgncia) as vgncias_vh,',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_vh',
'  from v_si_i_sujetos_impuesto si',
'  join v_si_i_sujetos_responsable sr',
'    on sr.id_sjto_impsto = si.id_sjto_impsto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
' where i.cdgo_impsto = ''VHL''',
'   and sr.idntfccion_rspnsble = :P37_JSON',
'   and cv.vlor_sldo_cptal > 0',
'   and si.id_sjto_estdo = 1',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
' group by si.id_sjto_impsto, si.idntfccion_sjto, si.drccion;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111025018637076910)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Responsabilidades Rentas',
'select si.id_sjto_impsto,',
'       cv.id_impsto_sbmpsto,',
'       su.nmbre_impsto_sbmpsto nmbre_impsto,',
'       ',
'       (select listagg(vgncia || ''('' || lista_prdos || '')'', '', '') within group(order by vgncia)',
'          from (select cv_sub.vgncia,',
'                       listagg(distinct cv_sub.prdo, '','') within group(order by cv_sub.prdo) as lista_prdos',
'                  from v_gf_g_cartera_x_vigencia cv_sub',
'                 where cv_sub.id_sjto_impsto = si.id_sjto_impsto',
'                   and cv_sub.id_impsto_sbmpsto = cv.id_impsto_sbmpsto',
'                   and cv_sub.vlor_sldo_cptal > 0',
'                   and cv_sub.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'                 group by cv_sub.vgncia)) as vgncias_r,',
'       ',
'       trim(to_char(sum(cv.vlor_sldo_cptal + cv.vlor_intres), :F_FRMTO_MNDA)) as saldo_r',
'  from v_si_i_sujetos_impuesto si',
'  join si_c_sujetos s',
'    on s.id_sjto = si.id_sjto',
'  join v_gf_g_cartera_x_vigencia cv',
'    on cv.id_sjto_impsto = si.id_sjto_impsto',
'  join df_c_impuestos i',
'    on i.id_impsto = si.id_impsto',
'  join df_i_impuestos_subimpuesto su',
'    on su.id_impsto_sbmpsto = cv.id_impsto_sbmpsto',
' where i.cdgo_impsto = ''REN''',
'   and cv.vlor_sldo_cptal > 0',
'   and si.idntfccion_sjto = :P37_JSON',
'   and cv.cdgo_mvnt_fncro_estdo in (''NO'', ''CN'')',
'   and su.actvo = ''S''',
' group by si.id_sjto_impsto, cv.id_impsto_sbmpsto, su.nmbre_impsto_sbmpsto;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111025224448076911)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.*,pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''CTI'') as cnsctvo',
'  from (select si.idntfccion_sjto as idntfccion,',
'               p.nmbre_rzon_scial as nmbre_rzon_scial,',
'               TO_CHAR(SYSDATE, ''DD'', ''NLS_DATE_LANGUAGE = SPANISH'') ||',
'               '' del mes de '' ||',
'               TRIM(TO_CHAR(SYSDATE, ''Month'', ''NLS_DATE_LANGUAGE = SPANISH'')) ||',
'               '' de '' || TO_CHAR(SYSDATE, ''YYYY'') AS fecha_formateada',
'          from v_si_i_sujetos_impuesto si',
'          join v_si_i_personas p',
'            on si.id_sjto_impsto = p.id_sjto_impsto',
'         where si.idntfccion_sjto = :P37_JSON',
'           and rownum = 1',
'        UNION ALL',
'        select r.idntfccion_rspnsble as idntfccion,',
'               r.nmbre_rzon_scial as nmbre_rzon_scial,',
'               TO_CHAR(SYSDATE, ''DD'', ''NLS_DATE_LANGUAGE = SPANISH'') ||',
'               '' del mes de '' ||',
'               TRIM(TO_CHAR(SYSDATE, ''Month'', ''NLS_DATE_LANGUAGE = SPANISH'')) ||',
'               '' de '' || TO_CHAR(SYSDATE, ''YYYY'') AS fecha_formateada',
'          from v_si_i_sujetos_impuesto si',
'          join v_si_i_sujetos_responsable r',
'            on si.id_sjto_impsto = r.id_sjto_impsto',
'         where r.idntfccion_rspnsble = :P37_JSON',
'           and rownum = 1) t',
' where rownum = 1'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(111025493890076911)
,p_shared_query_id=>wwv_flow_api.id(95785365487557441)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--QR',
'select trim(APEX_WEB_SERVICE.BLOB2CLOBBASE64(f_bmp2jpg',
'    (zt_qr.f_qr_as_bmp(''https://monteria.taxationsmart.co/ords/f?p=150000:2025021:::::F_CDGO_CLNTE,P2025021_ID_SJTO_IMPSTO,P2025021_ID_RPRTE_AUDTRIA_TRZA:23001,'' || json_value(:P37_JSON_2, ''$.id_sjto_impsto'') || '','' || json_value(:P37_JSON_2, ''$.id_r'
||'prte_audtria_trza''), ''M'', ''N'')',
'                                 ))',
'                                    ) as QR ',
'from dual;'))
);
end;
/
