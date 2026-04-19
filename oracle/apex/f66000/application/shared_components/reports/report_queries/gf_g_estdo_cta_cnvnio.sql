prompt --application/shared_components/reports/report_queries/gf_g_estdo_cta_cnvnio
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(45765947627065134)
,p_name=>'gf_g_estdo_cta_cnvnio'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select trim(c.prmer_nmbre||'' ''||c.sgndo_nmbre||'' ''||c.prmer_aplldo||'' ''||c.sgndo_aplldo) as nmbre',
'             , a.id_cnvnio',
'             , a.idntfccion_sjto_frmtda',
'             , trim(a.drccion) as drccion',
'             , a.nmro_cnvnio',
'             , a.fcha_aplccion',
'             , a.nmro_cta as nmro_ctas',
'             , b.nmro_cta ',
'             , b.fcha_vncmnto',
'             , (b.vlor_cptal+ b.vlor_intres+b.vlor_fncncion) as ttal',
'             , b.estdo_cta',
'             , a.nmbre_slctnte            ',
'          from v_gf_g_convenios           a',
'          join v_gf_g_convenios_extracto  b on a.id_cnvnio      = b.id_cnvnio',
'          join si_i_sujetos_responsable   c on a.id_sjto_impsto = c.id_sjto_impsto     ',
'         where a.cdgo_clnte        = 6',
'           and a.id_sjto_impsto    = 422342',
'           and a.id_impsto         = 16',
'           and a.id_impsto_sbmpsto = 13',
'           and c.prncpal_s_n       = ''S'';'))
,p_report_layout_id=>wwv_flow_api.id(45833565655645440)
,p_format=>'PDF'
,p_output_file_name=>'gf_g_estdo_cta_cnvnio'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(45834067479646681)
,p_shared_query_id=>wwv_flow_api.id(45765947627065134)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select trim(c.prmer_nmbre||'' ''||c.sgndo_nmbre||'' ''||c.prmer_aplldo||'' ''||c.sgndo_aplldo) as nmbre',
'             , a.id_cnvnio, a.id_sjto_impsto',
'             , a.idntfccion_sjto_frmtda',
'             , trim(a.drccion) as drccion',
'             , a.nmro_cnvnio',
'             , trunc(a.fcha_aplccion) as fcha_aplccion',
'             , a.nmro_cta as nmro_ctas',
'             , b.nmro_cta ',
'             , b.fcha_vncmnto',
'             , decode(b.estdo_cta,''PAGADA'',''PAGADA'','' NO PAGADA'') as estdo_cta',
'             , a.nmbre_slctnte     ',
'             , (b.vlor_cptal+ b.vlor_intres+b.vlor_fncncion) as ttal',
'          from v_gf_g_convenios           a',
'          join v_gf_g_convenios_extracto  b on a.id_cnvnio      = b.id_cnvnio',
'          join si_i_sujetos_responsable   c on a.id_sjto_impsto = c.id_sjto_impsto     ',
'         where a.cdgo_clnte        = :F_CDGO_CLNTE           ',
'           and a.id_impsto         = json_value( :P28_JSON, ''$.id_impsto'')',
'           and a.id_impsto_sbmpsto = json_value( :P28_JSON, ''$.id_impsto_sbmpsto'')',
'         --  and a.id_sjto_impsto    = json_value( :P28_JSON, ''$.id_sjto_impsto'')',
'           and c.prncpal_s_n       = ''S''        ',
'           and a.cdgo_cnvnio_estdo = ''APL''',
'           and trunc(a.fcha_aplccion) between json_value( :P28_JSON, ''$.fcha_dsde'') and json_value( :P28_JSON, ''$.fcha_hsta'')',
'      order by b.id_cnvnio',
'             , b.nmro_cta;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(45834260481646681)
,p_shared_query_id=>wwv_flow_api.id(45765947627065134)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE)nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
end;
/
