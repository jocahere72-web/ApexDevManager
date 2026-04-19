prompt --application/shared_components/reports/report_queries/re_p_gestion_financiera
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(52291430931607473)
,p_name=>'re_p_gestion_financiera'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto, a.nmbre_impsto, nvl(sum(vlor_dbe - vlor_hber),0) sldo_ttal, ''Deuda por Impuestos'' title,',
'        ''<b>Impuesto :</b> '' || a.nmbre_impsto || ''<br>'' ||',
'        ''<b>Saldo:</b> $'' || nvl(to_char(sum(vlor_dbe - vlor_hber), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) || ''<br>'' toltip_impsto',
'  from df_c_impuestos a ',
'  left join v_gf_g_movimientos_detalle b on a.id_impsto= b.id_impsto ',
'       and ((:P65_FILTRAR_POR = ''VG'' and vgncia = nvl(:P65_VGNCIA,vgncia))',
'      or ( ',
'          :P65_FILTRAR_POR = ''FC'' ',
'                                                                     and ((trunc(b.fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'                                                                     or (trunc(b.fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'                                                                     or (trunc(b.fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'                                                                     or(:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null ))))',
'  where a.cdgo_clnte = :F_CDGO_CLNTE ',
'  group by a.id_impsto, a.nmbre_impsto',
'  order by a.nmbre_impsto;'))
,p_format=>'PDF'
,p_output_file_name=>'re_p_gestion_financiera'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(52700890248892421)
,p_shared_query_id=>wwv_flow_api.id(52291430931607473)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_impsto,',
'       a.nmbre_impsto, ',
'       nvl(sum(vlor_dbe - vlor_hber),0) sldo_ttal',
'  from df_c_impuestos a ',
'  left join v_gf_g_movimientos_detalle b on a.id_impsto= b.id_impsto ',
'       and ((:P65_FILTRAR_POR = ''VG'' and vgncia = nvl(:P65_VGNCIA,vgncia))',
'      or ( ',
'          :P65_FILTRAR_POR = ''FC'' ',
'                                                                     and ((trunc(b.fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'                                                                     or (trunc(b.fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'                                                                     or (trunc(b.fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'                                                                     or(:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null ))))',
'  where a.cdgo_clnte = :F_CDGO_CLNTE ',
'  group by a.id_impsto, a.nmbre_impsto',
'  order by a.nmbre_impsto;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(52701025139892421)
,p_shared_query_id=>wwv_flow_api.id(52291430931607473)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_clnte,',
'       upper(a.nmbre_clnte)nmbre_clnte,',
'       upper(a.slgan)slgan,',
'       a.id_ofcna,',
'       a.nmbre_ofcna,       ',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => b.file_blob ) as lgo_slgan, ',
'       b.file_mimetype,       ',
'       c.nmbre_trcro as nombre_usuario,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr     ',
'from   v_df_s_clientes                        a',
'join   df_c_imagenes_cliente                  b on a.cdgo_clnte = b.cdgo_clnte and b.cdgo_imgen_clnte = ''L_E''',
'join   v_si_c_terceros                        c on a.cdgo_clnte = c.cdgo_clnte and c.idntfccion = coalesce( sys_context(''APEX$SESSION'',''app_user''), regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*''), sys_context(''userenv'',''session_use'
||'r'') ) ',
'where  a.cdgo_clnte = :F_CDGO_CLNTE'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(52701271236892421)
,p_shared_query_id=>wwv_flow_api.id(52291430931607473)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''$'' || nvl(to_char(sum(vlor_dbe - vlor_hber), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) SALDO_TOTAL, ''Total Cartera'' TOTAL',
'from v_gf_g_movimientos_detalle',
'where cdgo_clnte = :F_CDGO_CLNTE ',
'      and (:P65_FILTRAR_POR = ''VG'' and vgncia = nvl(:P65_VGNCIA,vgncia))',
'      or ( ',
'          :P65_FILTRAR_POR = ''FC'' ',
'          and (:P65_FCHA_INCIO is not null and :P65_FCHA_FIN is not null) ',
'          and (((trunc(fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'            or (trunc(fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'            or (trunc(fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'            or (:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null )) )',
'         );  ',
'            '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(52701479322892421)
,p_shared_query_id=>wwv_flow_api.id(52291430931607473)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with c_ttal_sjto_impsto as (',
'                            select decode(count (distinct a.id_sjto_impsto),0,1, count (distinct a.id_sjto_impsto)) ttal_sjto_impsto',
'                              from v_gf_g_movimientos_detalle a ',
'                             where a.cdgo_clnte = :F_CDGO_CLNTE',
'                               and a.CDGO_MVNT_FNCRO_ESTDO in (''NO'',''CN'',''RC'')      ',
'                               and (',
'                                    (:P65_FILTRAR_POR = ''VG'' and a.vgncia = :P65_VGNCIA) ',
'                                 or (:P65_FILTRAR_POR = ''FC'' and (',
'                                                                    (trunc(a.fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'                                                                 or (trunc(a.fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'                                                                 or (trunc(a.fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'                                                                 or (:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null )  ',
'                                                                 ) ',
'                                    ) ',
'                                  )',
'                                 ',
'                            ) ',
'',
' select a.CDGO_MVNT_FNCRO_ESTDO,',
'        upper (a.DSCRPCION)                                                                                                  DESCRIPCION,',
'        count (distinct c.id_sjto_impsto) count_sjto_impsto,',
'        dbms_lob.getlength(a.file_blob)                                                                                      IMAGEN,',
'          ''Total Deuda: $'' || nvl(to_char(sum(vlor_dbe - vlor_hber), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) Total_deuda,',
'        ''Total Sujetos: ''  ||nvl(to_char(count (distinct c.id_sjto_impsto), ''999G999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.''''''),0) Total_sujetos,',
'           ''Porcentaje: ''  || to_char( (nvl( count(distinct c.id_sjto_impsto),0)  * 100)  /  nvl(b.ttal_sjto_impsto,1), ''9990D99'')  porcentaje,',
'       :P65_VGNCIA vigencia,',
'       :P65_FCHA_INCIO fecha_ini,',
'       :P65_FCHA_FIN fecha_fin,',
'       :P65_FILTRAR_POR filtro',
'   from GF_D_MVMNTO_FNCRO_ESTDO          a',
'   join c_ttal_sjto_impsto               b on b.ttal_sjto_impsto       = b.ttal_sjto_impsto',
'   left join v_gf_g_movimientos_detalle  c on a.CDGO_MVNT_FNCRO_ESTDO  = c.CDGO_MVNT_FNCRO_ESTDO     ',
'         and (',
'                (:P65_FILTRAR_POR = ''VG'' and c.vgncia = :P65_VGNCIA) ',
'             or (:P65_FILTRAR_POR = ''FC'' and (',
'                                                (trunc(c.fcha_mvmnto) between :P65_FCHA_INCIO and :P65_FCHA_FIN)',
'                                             or (trunc(c.fcha_mvmnto) >= :P65_FCHA_INCIO and :P65_FCHA_FIN is null) ',
'                                             or (trunc(c.fcha_mvmnto) <= :P65_FCHA_FIN and :P65_FCHA_INCIO  is null)',
'                                              or(:P65_FCHA_INCIO is null and :P65_FCHA_FIN is null )  ',
'                                             ) ',
'                ) ',
'             )                                        ',
'   where a.CDGO_MVNT_FNCRO_ESTDO in (''NO'',''CN'',''RC'')      ',
'   group by b.ttal_sjto_impsto , ',
'            a.DSCRPCION,',
'            a.CDGO_MVNT_FNCRO_ESTDO,',
'            dbms_lob.getlength(a.file_blob) ',
'   order by 3 desc;             '))
);
end;
/
