prompt --application/shared_components/reports/report_queries/re_g_rcdos_x_cncpto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(37597114231762675)
,p_name=>'re_g_rcdos_x_cncpto'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmro_dcmnto,',
'       c.idntfccion_sjto,',
'       b.fcha_rcdo,',
'       a.vgncia,',
'       a.cdgo_cncpto,',
'       a.dscrpcion_cncpto,',
'       a.vlor_cptal,',
'       a.vlor_intres,',
'       a.vlor_sldo_fvor,',
'       a.vlor_ttal',
'  from v_re_g_recaudos_detalle a',
'  join re_g_recaudos b',
'    on b.id_rcdo = a.id_rcdo',
'  join v_si_i_sujetos_impuesto c',
'    on c.id_sjto_impsto = b.id_sjto_impsto',
'   join re_g_recaudos_control d on d.id_rcdo_cntrol = b.id_rcdo_cntrol',
' where d.cdgo_clnte = :F_CDGO_CLNTE',
'   and d.id_impsto = nvl(json_value(:P37_JSON, ''$.id_impsto''), d.id_impsto)',
'   and d.id_impsto_sbmpsto =',
'       nvl(json_value(:P37_JSON, ''$.id_impsto_sbmpsto''),',
'           d.id_impsto_sbmpsto)',
'   and trunc(b.fcha_rcdo) between',
'       json_value(:P37_JSON, ''$.fcha_incial'') and',
'       json_value(:P37_JSON, ''$.fcha_fnal'')',
'   and b.cdgo_rcdo_estdo = ''AP''',
'   and d.id_bnco = nvl(json_value(:P37_JSON, ''$.id_bnco''), d.id_bnco)',
' order by b.fcha_rcdo, b.nmro_dcmnto, a.cdgo_cncpto',
''))
,p_format=>'XLS'
,p_output_file_name=>'re_g_rcdos_x_cncpto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(64758894768716346)
,p_shared_query_id=>wwv_flow_api.id(37597114231762675)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmro_dcmnto,',
'       c.idntfccion_sjto,',
'       trunc(b.fcha_rcdo) as fcha_rcdo,',
'       e.dscrpcion orgen_rcdo,',
'       a.vgncia,',
'       a.cdgo_cncpto,',
'       a.dscrpcion_cncpto,',
'       a.vlor_cptal,',
'       a.vlor_intres,',
'       a.vlor_sldo_fvor,',
'       a.vlor_ttal',
'  from v_re_g_recaudos_detalle a',
'  join re_g_recaudos b',
'    on b.id_rcdo = a.id_rcdo',
'  join v_si_i_sujetos_impuesto c',
'    on c.id_sjto_impsto = b.id_sjto_impsto',
'   join re_g_recaudos_control d on d.id_rcdo_cntrol = b.id_rcdo_cntrol',
'   join re_d_recaudo_origen e on e.cdgo_rcdo_orgen = d.cdgo_rcdo_orgen',
' where d.cdgo_clnte = :F_CDGO_CLNTE',
'   and d.id_impsto = nvl(json_value(:P37_JSON, ''$.id_impsto''), d.id_impsto)',
'   and d.id_impsto_sbmpsto =',
'       nvl(json_value(:P37_JSON, ''$.id_impsto_sbmpsto''),',
'           d.id_impsto_sbmpsto)',
'   and trunc(b.fcha_rcdo) between',
'       json_value(:P37_JSON, ''$.fcha_incial'') and',
'       json_value(:P37_JSON, ''$.fcha_fnal'')',
'   and b.cdgo_rcdo_estdo = ''AP''',
'   and d.id_bnco = nvl(json_value(:P37_JSON, ''$.id_bnco''), d.id_bnco)',
' order by b.fcha_rcdo, b.nmro_dcmnto, a.cdgo_cncpto',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(64759020963716346)
,p_shared_query_id=>wwv_flow_api.id(37597114231762675)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'      --   pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P5_ID_RPRTE)nmbre_rpte',
'        , json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial',
'        , json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
end;
/
