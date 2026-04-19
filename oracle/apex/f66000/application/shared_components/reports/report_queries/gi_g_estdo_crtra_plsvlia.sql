prompt --application/shared_components/reports/report_queries/gi_g_estdo_crtra_plsvlia
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(92620178303677328)
,p_name=>'gi_g_estdo_crtra_plsvlia'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. encabezado',
'select trim( b.prmer_nmbre||'' ''||b.sgndo_nmbre||'' ''||b.prmer_aplldo||'' ''||b.sgndo_aplldo) as nmbre  ',
'      , a.idntfccion_sjto_frmtda              ',
'      , a.drccion ',
'      , a.mtrcla_inmblria',
'      , b.idntfccion',
'   from  v_si_i_sujetos_impuesto  a             ',
'   join si_i_sujetos_responsable  b',
'     on a.id_sjto_impsto        = b.id_sjto_impsto',
'  where a.cdgo_clnte            = :F_CDGO_CLNTE ',
'    and a.id_impsto             = json_value(:P37_JSON , ''$.id_impsto'')  ',
'    and a.id_sjto_impsto        = json_value(:P37_JSON , ''$.id_sjto_impsto'') ;	'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_estdo_crtra_plsvlia'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(92649235426954067)
,p_shared_query_id=>wwv_flow_api.id(92620178303677328)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. encabezado',
'select trim( b.prmer_nmbre||'' ''||b.sgndo_nmbre||'' ''||b.prmer_aplldo||'' ''||b.sgndo_aplldo) as nmbre  ',
'      , a.idntfccion_sjto_frmtda              ',
'      , a.drccion ',
'      , a.mtrcla_inmblria',
'      , b.idntfccion',
'   from  v_si_i_sujetos_impuesto  a             ',
'   join si_i_sujetos_responsable  b',
'     on a.id_sjto_impsto        = b.id_sjto_impsto',
'  where a.cdgo_clnte            = :F_CDGO_CLNTE ',
'    and a.id_impsto             = json_value(:P37_JSON , ''$.id_impsto'')  ',
'    and a.id_sjto_impsto        = json_value(:P37_JSON , ''$.id_sjto_impsto'') ;	'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(92649409735954067)
,p_shared_query_id=>wwv_flow_api.id(92620178303677328)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_cncpto',
'      , a.vgncia',
'      , a.prdo                  ',
'      , a.dscrpcion_cncpto  ',
'      , upper(json_value(:P37_JSON , ''$.nmbre_rprte'')) 			as nmbre_rprte',
'      , to_char(sum(a.vlor_sldo_cptal), :F_FRMTO_MNDA)			as vlor_sldo_cptal',
'      , to_char((sum(a.vlor_sldo_cptal) + sum(a.vlor_intres)), :F_FRMTO_MNDA) 			as vlor_ttal ',
'	  , decode(b.cdgo_plsv_estdo,''P'',''Si'',''No'') 			as indcdor_pgo',
'	  , to_char(nvl(b.vlor_plsvlia_actlzda,0), :F_FRMTO_MNDA)							as vlor_bse',
'	  , decode(b.tpo_plsvlia,''A'',''Vigencia ''||c.vgncia,'''')	    as vgncia_bse',
'	  , decode(b.tpo_plsvlia,''L'',''Liquidado'',''A'',''Actualizado'','''') as nmbre_cmpo',
'  from  v_gf_g_cartera_x_concepto   a     ',
'  join  gi_g_plusvalia_procso_dtlle b on a.id_orgen = b.id_lqdcion ',
'  join  gi_g_plusvalia_proceso      c on b.id_prcso_plsvlia = c.id_prcso_plsvlia',
'  where a.cdgo_clnte          = :F_CDGO_CLNTE',
'    and a.id_impsto           = json_value(:P37_JSON , ''$.id_impsto'') ',
'    and a.id_impsto_sbmpsto   = json_value(:P37_JSON , ''$.id_impsto_sbmpsto'')          ',
'    and a.vgncia between        json_value(:P37_JSON , ''$.vgncia_dsd'')  and json_value(:P37_JSON , ''$.vgncia_hsta'')              ',
'    and a.id_sjto_impsto      = json_value(:P37_JSON , ''$.id_sjto_impsto'')                ',
'group by a.cdgo_cncpto',
'      , a.vgncia',
'      , a.prdo                  ',
'      , a.dscrpcion_cncpto             ',
'      , upper(json_value(:P37_JSON , ''$.nmbre_rprte''))',
'      , a.id_sjto_impsto',
'      , b.cdgo_plsv_estdo ',
'      , b.vlor_plsvlia_actlzda ',
'      , b.tpo_plsvlia',
'      , c.vgncia;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(92649681199954067)
,p_shared_query_id=>wwv_flow_api.id(92620178303677328)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--slogan	',
' select upper(b.nmbre_clnte) nmbre_clnte,',
'        upper(b.slgan) slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO) nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE) nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''	'))
);
end;
/
