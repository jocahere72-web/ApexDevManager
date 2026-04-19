prompt --application/shared_components/reports/report_queries/gf_g_ajustes_realizados
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(38321870593478453)
,p_name=>'gf_g_ajustes_realizados'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_format=>'PDF'
,p_output_file_name=>'gf_g_ajustes_realizados'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(61362299346188162)
,p_shared_query_id=>wwv_flow_api.id(38321870593478453)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1.',
'select a.id_ajste,',
'       a.numro_ajste,',
'       pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'       a.id_impsto,',
'       a.id_impsto_sbmpsto,',
'       a.id_sjto_impsto,',
'       a.nmbre_impsto,',
'       a.nmbre_impsto_sbmpsto,',
'       trim(a.drccion) as drccion,',
'       upper(c.nmbre_rzon_scial) prptrio_prcpal,',
'       to_char(a.fcha, ''DD/MM/YYYY'') fecha,',
'       a.nmro_slctud,',
'       a.cdgo_tpo_ajste,',
'       a.tpo_ajste,',
'       a.dscrpcion_motivo,',
'       a.dscrpcion_estado,',
'       ''$'' || to_char((a.vlor), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''')  vlor_ajste,',
'       d.nmbre_trcro       ',
'  from v_gf_g_ajustes                  a       ',
'  left join v_si_i_sujetos_responsable c on a.id_sjto  = c.id_sjto and c.id_sjto_impsto=a.id_sjto_impsto',
'  join v_sg_g_usuarios                 d on a.id_usrio = d.id_usrio',
' where a.cdgo_clnte        = :F_CDGO_CLNTE ',
'   and a.id_impsto         = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO'' ), a.id_impsto)',
'   and a.id_impsto_sbmpsto = nvl(json_value(:P37_JSON,''$.P_ID_IMPSTO_SBMPSTO'' ), a.id_impsto_sbmpsto)',
'   and a.idntfccion_sjto   = nvl(json_value(:P37_JSON,''$.P_IDNTFCCION'' ), a.idntfccion_sjto)',
'   and a.cdgo_ajste_estdo  = nvl(json_value(:P37_JSON,''$.P_CDGO_AJSTE'' ), a.cdgo_ajste_estdo) ',
'   and a.cdgo_tpo_ajste    = nvl(json_value(:P37_JSON,''$.P_TPO_AJSTE'' ), a.cdgo_tpo_ajste)   ',
'   and a.id_ajste_mtvo	   = nvl(json_value(:P37_JSON,''$.P_ID_AJSTE_MTVO'' ), a.id_ajste_mtvo)',
'   and a.id_usrio          = nvl(json_value(:P37_JSON,''$.P_AJSTE_USRIOS'' ), a.id_usrio )',
'   and ((a.vlor  between replace(json_value(:P37_JSON,''$.P_VLOR_AJSTE'' ),''.'','''') and replace(json_value(:P37_JSON,''$.P_VLOR_AJSTE_HASTA'' ),''.'',''''))',
'         or (a.vlor >= replace(json_value(:P37_JSON,''$.P_VLOR_AJSTE'' ),''.'','''') and replace(json_value(:P37_JSON,''$.P_VLOR_AJSTE_HASTA'' ),''.'','''')is null) ',
'         or (a.vlor <= replace(json_value(:P37_JSON,''$.P_VLOR_AJSTE_HASTA'' ),''.'','''') and replace(json_value(:P37_JSON,''$.P_VLOR_AJSTE'' ),''.'','''') is null)',
'         or (replace(json_value(:P37_JSON,''$.P_VLOR_AJSTE'' ),''.'','''')is null and replace(json_value(:P37_JSON,''$.P_VLOR_AJSTE_HASTA'' ),''.'','''')is null )',
'        )',
'   and trunc(a.fcha) between nvl( json_value(:P37_JSON,''$.P_FECHA'' ) , trunc(a.fcha)) and nvl( json_value(:P37_JSON,''$.P_FECHA_HASTA'' ) , trunc(a.fcha) )',
'   order by a.fcha     desc',
'          , a.id_ajste asc '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(61362478214188163)
,p_shared_query_id=>wwv_flow_api.id(38321870593478453)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2.',
'select a.cdgo_clnte,',
'       upper(a.nmbre_clnte)nmbre_clnte,',
'       upper(a.slgan)slgan,',
'       a.id_ofcna,',
'       a.nmbre_ofcna,       ',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => b.file_blob ) as lgo_slgan, ',
'       b.file_mimetype,       ',
'      -- c.nmbre_trcro as nombre_usuario,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr  ,',
'       json_value(:P37_JSON,''$.P_ID_IMPSTO'')  IDIMPSTO ,       ',
'       json_value(:P37_JSON,''$.P_ID_IMPSTO_SBMPSTO'')  IDIMPSTOSBMPSTO  ,',
'       json_value(:P37_JSON,''$.P_IDNTFCCION'' ) IDNTFCCION ,',
'       nvl(json_value(:P37_JSON,''$.P_CDGO_AJSTE'' ),''NT'') CDGOAJSTE ,',
'       json_value(:P37_JSON,''$.P_TPO_AJSTE'' ) TPOAJSTE ,',
'       json_value(:P37_JSON,''$.P_AJSTE_USRIOS'' ) AJSTEUSRIOS ,',
'       json_value(:P37_JSON,''$.P_FECHA'' ) Fecha_desde,',
'       json_value(:P37_JSON,''$.P_FECHA_HASTA'' ) Fecha_hasta,',
'       json_value(:P37_JSON,''$.P_VLOR_AJSTE'' ) Valor_desde,',
'       json_value(:P37_JSON,''$.P_VLOR_AJSTE_HASTA'' )  Valor_hasta       ',
'  from v_df_s_clientes         a',
'  join df_c_imagenes_cliente   b on a.cdgo_clnte = b.cdgo_clnte and b.cdgo_imgen_clnte = ''L_E''',
'  --join v_si_c_terceros         c on a.cdgo_clnte = c.cdgo_clnte --and c.idntfccion = coalesce( sys_context(''APEX$SESSION'',''app_user''), regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*''), sys_context(''userenv'',''session_user'') ) ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
''))
);
end;
/
