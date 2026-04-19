prompt --application/shared_components/reports/report_queries/gf_g_ajustes_realizados
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(33166390106206590)
,p_name=>'gf_g_ajustes_realizados'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_ajste,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto,',
'       a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'       a.idntfccion_sjto,',
'       a.drccion,',
'       b.nmbre_rzon_scial,',
'       a.fcha,',
'       a.nmro_slctud,',
'       a.cdgo_tpo_ajste,',
'       a.tpo_ajste,',
'       a.dscrpcion_estado',
'  from v_gf_g_ajustes a',
'  join v_si_i_sujetos_responsable b',
'    on a.id_sjto_impsto = b.id_sjto',
' where (trunc(a.fcha) between :P21_FECHA_DESDE and :P21_FECHA_HASTA)',
'   and b.prncpal_s_n            = ''S''',
' ',
''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_ajustes_realizados'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72496941564064089)
,p_shared_query_id=>wwv_flow_api.id(33166390106206590)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.id_ajste,',
'       pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto,',
'       a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'       a.drccion,',
'       upper(c.nmbre_rzon_scial) prptrio_prcpal,',
'       to_char(a.fcha, ''DD/MM/YYYY'') fecha,',
'       a.nmro_slctud,',
'       a.cdgo_tpo_ajste,',
'       a.tpo_ajste,',
'       a.dscrpcion_motivo,',
'       a.dscrpcion_estado,',
'       b.vlor_ajste,',
'       d.nmbre_trcro',
'       ',
'from v_gf_g_ajustes a       ',
'join v_gf_g_ajuste_detalle      b on a.id_ajste = b.id_ajste',
'join v_si_i_sujetos_responsable c on a.id_sjto  = c.id_sjto',
'join v_sg_g_usuarios            d on a.id_usrio = d.id_usrio',
' where a.cdgo_clnte =:F_CDGO_CLNTE ',
'   and a.id_impsto              = nvl(:P21_ID_IMPSTO, a.id_impsto)',
'   and a.id_impsto_sbmpsto      = nvl(:P21_ID_IMPSTO_SBMPSTO, a.id_impsto_sbmpsto)',
'   and a.idntfccion_sjto        = nvl(:P21_IDNTFCCION, a.idntfccion_sjto)',
'   and a.cdgo_ajste_estdo       = nvl(:P21_CDGO_AJSTE, a.cdgo_ajste_estdo)',
' --  and a.tpo_ajste              = nvl(:P21_TPO_AJSTE, a.tpo_ajste)',
'   and b.tpo_ajste              = nvl(:P21_TPO_AJSTE, b.tpo_ajste)   ',
'   and a.id_usrio               = nvl(:P21_AJSTE_USRIOS, a.id_usrio) ',
'   and ( (b.vlor_ajste  between :P21_VLOR_AJSTE and :P21_VLOR_AJSTE_HASTA)',
'   or (b.vlor_ajste >= :P21_VLOR_AJSTE and :P21_VLOR_AJSTE_HASTA is null) ',
'   or (b.vlor_ajste <= :P21_VLOR_AJSTE_HASTA and :P21_VLOR_AJSTE is null)',
'   or (:P21_VLOR_AJSTE is null and :P21_VLOR_AJSTE_HASTA is null )) ',
'      ',
'   and  ((trunc(a.fcha) between :P21_FECHA and :P21_FECHA_HASTA)',
'   or (trunc(a.fcha) >= :P21_FECHA and :P21_FECHA_HASTA is null) ',
'   or (trunc(a.fcha) <= :P21_FECHA_HASTA and :P21_FECHA  is null)',
'   or(:P21_FECHA is null and :P21_FECHA_HASTA is null ))',
'   order by a.id_ajste desc;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72497192442064089)
,p_shared_query_id=>wwv_flow_api.id(33166390106206590)
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
'       :F_IP as ipaddr,',
'       nvl(:P21_ID_IMPSTO,'''') IDIMPSTO,',
'       nvl(:P21_ID_IMPSTO_SBMPSTO,'''') IDIMPSTOSBMPSTO,',
'       nvl(:P21_IDNTFCCION,'''') IDNTFCCION,',
'       nvl(:P21_CDGO_AJSTE,''NT'') CDGOAJSTE,',
'       nvl(:P21_TPO_AJSTE,'''') TPOAJSTE,',
'       nvl(:P21_AJSTE_USRIOS,'''') AJSTEUSRIOS,',
'       nvl(:P21_FECHA,'''') Fecha_desde,',
'       nvl(:P21_FECHA_HASTA,'''') Fecha_hasta,',
'       nvl(:P21_VLOR_AJSTE,'''') Valor_desde,',
'       nvl(:P21_VLOR_AJSTE_HASTA,'''') Valor_hasta ',
'       ',
'       ',
'from   v_df_s_clientes                        a',
'join   df_c_imagenes_cliente                  b on a.cdgo_clnte = b.cdgo_clnte and b.cdgo_imgen_clnte = ''L_E''',
'join   v_si_c_terceros                        c on a.cdgo_clnte = c.cdgo_clnte and c.idntfccion = coalesce( sys_context(''APEX$SESSION'',''app_user''), regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*''), sys_context(''userenv'',''session_use'
||'r'') ) ',
'',
'where  a.cdgo_clnte = :F_CDGO_CLNTE; '))
);
end;
/
