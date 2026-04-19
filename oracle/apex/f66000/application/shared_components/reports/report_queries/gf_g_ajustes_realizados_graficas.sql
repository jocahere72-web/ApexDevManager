prompt --application/shared_components/reports/report_queries/gf_g_ajustes_realizados_graficas
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(85064933801911359)
,p_name=>'gf_g_ajustes_realizados_graficas'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(fcha_frmtda, ''DD/MM/YYYY'') fcha_formatiada,fcha_frmtda,sum(vlor),',
' ''<b>Ajuste Credito</b>',
' <b>Fecha:</b> '' ||to_char(fcha_frmtda, ''DD/MM/YYYY'') || ''<br>'' ||',
' ''<b>Valor Ajuste:</b> $''  || to_char(sum(vlor), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') || ''<br>'' toltip_vlor_fcha',
'',
'from v_gf_g_ajustes ',
'',
'',
'where CDGO_TPO_AJSTE =''CR'' AND CDGO_AJSTE_ESTDO=''AP''',
'',
'and ((trunc(fcha) between :P33_FECHA and :P33_FECHA_HASTA)',
'   or (trunc(fcha) >= :P33_FECHA and :P33_FECHA_HASTA is null) ',
'   or (trunc(fcha) <= :P33_FECHA_HASTA and :P33_FECHA  is null)',
'   or(:P33_FECHA is null and :P33_FECHA_HASTA is null ))',
'and cdgo_clnte = :F_CDGO_CLNTE   ',
'group by fcha_frmtda',
'order by fcha_frmtda asc;',
''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_ajustes_realizados_graficas'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22049199957045557)
,p_shared_query_id=>wwv_flow_api.id(85064933801911359)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. consulta grafica 1 de la pantalla TOTAL AJUSTES APLICADOS',
'select b.vgncia as vgncia_1,',
'       json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') as vgncia_incial,',
'       json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')   as vgncia_fnal,',
'       sum(b.VLOR_AJSTE) mnto_ttal_1 ',
'  from gf_g_ajustes        a',
'  join gf_g_ajuste_detalle b on a.id_ajste  = b.id_ajste ',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.id_impsto         = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO''),a.id_impsto)',
'   and a.id_impsto_sbmpsto = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO_SBMPSTO''),a.id_impsto_sbmpsto)',
'   and b.vgncia between    json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') and  json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')',
'   and a.cdgo_ajste_estdo  =''AP''',
' group by b.vgncia        ',
' order by b.vgncia asc'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22049391974045557)
,p_shared_query_id=>wwv_flow_api.id(85064933801911359)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --2. consulta grafica 2 de la pantalla TOTAL AJUSTES APLICADOS CREDITO',
'select b.vgncia as vgncia_2,',
'       json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') as VGNCIA_INCIAL,',
'       json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')   as VGNCIA_FNAL,',
'       sum(b.VLOR_AJSTE) mnto_ttal_2      ',
'  from gf_g_ajustes        a',
'  join gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
' where a.cdgo_clnte        = :F_CDGO_CLNTE   ',
'   and a.id_impsto         = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO''),a.id_impsto)',
'   and a.id_impsto_sbmpsto = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO_SBMPSTO''),a.id_impsto_sbmpsto)',
'   and b.vgncia            between json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') and  json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')',
'   and a.cdgo_ajste_estdo  = ''AP''',
'   and a.tpo_ajste         = ''CR''',
' group by b.vgncia',
' order by b.vgncia asc',
' '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22049540458045557)
,p_shared_query_id=>wwv_flow_api.id(85064933801911359)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --3. consulta grafica 3 de la pantalla  TOTAL AJUSTES APLICADOS DEBITO',
'select b.vgncia as vgncia_3,',
'      json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') as VGNCIA_INCIAL,',
'      json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')   as VGNCIA_FNAL, ',
'      sum(b.VLOR_AJSTE) mnto_ttal_3',
' from gf_g_ajustes        a',
' join gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'where a.cdgo_clnte        = :F_CDGO_CLNTE   ',
'  and a.id_impsto         = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO''),a.id_impsto)',
'  and a.id_impsto_sbmpsto = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO_SBMPSTO''),a.id_impsto_sbmpsto)',
'  and b.vgncia            between json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') and  json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')',
'  and a.cdgo_ajste_estdo  = ''AP''',
'  and a.tpo_ajste         = ''DB''',
'group by b.vgncia',
'order by b.vgncia asc'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22049705722045558)
,p_shared_query_id=>wwv_flow_api.id(85064933801911359)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--4. consulta grafica 4 de la pantalla  ',
'select ''Vigencia ''|| b.vgncia || '' -  Total: ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''')  as vgncia_4,',
'       sum(b.vlor_ajste) as mnto_ttal_4',
'  from gf_g_ajustes        a',
'  join gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
' where a.cdgo_clnte        = :F_CDGO_CLNTE   ',
'  and a.id_impsto          = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO''),a.id_impsto)',
'  and a.id_impsto_sbmpsto  = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO_SBMPSTO''),a.id_impsto_sbmpsto)',
'  and b.vgncia between     json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') and  json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')',
'  and a.cdgo_ajste_estdo   = ''AP''',
'group by b.vgncia',
'order by b.vgncia asc'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22049916032045558)
,p_shared_query_id=>wwv_flow_api.id(85064933801911359)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--5. consulta grafica 5 de la pantalla  ',
'select ''Vigencia ''|| b.vgncia || '' -  Total: ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''')  as vgncia_5,',
'       sum(b.vlor_ajste) as mnto_ttal_5',
' from gf_g_ajustes        a',
' join gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'where a.cdgo_clnte        = :F_CDGO_CLNTE   ',
'  and a.id_impsto         = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO''),a.id_impsto)',
'  and a.id_impsto_sbmpsto = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO_SBMPSTO''),a.id_impsto_sbmpsto)',
'  and b.vgncia            between json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') and  json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')',
'  and a.cdgo_ajste_estdo  =''AP'' ',
'  and a.tpo_ajste         = ''CR''',
'group by b.vgncia',
'order by b.vgncia asc'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22050111028045558)
,p_shared_query_id=>wwv_flow_api.id(85064933801911359)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--6. consulta grafica 6 de la pantalla   ',
'select ''Vigencia ''|| b.vgncia || '' -  Total: ''  ||  to_char(sum(b.VLOR_AJSTE), :F_FRMTO_MNDA,''NLS_NUMERIC_CHARACTERS = '''',.'''''')  as vgncia_6,',
'       sum(b.vlor_ajste) as mnto_ttal_6       ',
'  from gf_g_ajustes  a',
'  join gf_g_ajuste_detalle b on a.id_ajste = b.id_ajste',
'where a.cdgo_clnte         = :F_CDGO_CLNTE   ',
'  and a.id_impsto          = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO''),a.id_impsto)',
'  and a.id_impsto_sbmpsto  = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO_SBMPSTO''),a.id_impsto_sbmpsto)',
'  and b.vgncia             between json_value(:P37_JSON,''$.P_VIGENCIA_INICIAL'') and  json_value(:P37_JSON,''$.P_VIGENCIA_FINAL'')',
'  and a.cdgo_ajste_estdo   =''AP''',
'  and a.tpo_ajste          =''DB''',
'group by b.vgncia',
'order by b.vgncia asc'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22050310807045558)
,p_shared_query_id=>wwv_flow_api.id(85064933801911359)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--7. Encabezado y Pie de Pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where a.cdgo_clnte       =:F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
''))
);
end;
/
