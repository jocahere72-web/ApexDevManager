prompt --application/shared_components/reports/report_queries/gf_g_paz_y_slvos_gnrdos
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(38244760638073375)
,p_name=>'gf_g_paz_y_slvos_gnrdos'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de Pagina',
'		select upper(b.nmbre_clnte)nmbre_clnte,',
'		       upper(b.slgan)slgan,',
'		       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'		       to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'		       :F_IP as ipaddr,',
'		       :F_NMBRE_USRIO as Usuario,       ',
'		       a.file_mimetype,',
'		       json_value(:P37_JSON,''$.fcha_i'') as fcha_incial,',
'		       json_value(:P37_JSON,''$.fcha_f'') as fcha_fnal,',
'		       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'		  from df_c_imagenes_cliente a',
'		  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'		 where a.cdgo_clnte = :F_CDGO_CLNTE',
'		   and a.cdgo_imgen_clnte = ''L_E''   '))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_paz_y_slvos_gnrdos'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(39670177959395581)
,p_shared_query_id=>wwv_flow_api.id(38244760638073375)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de Pagina',
'		select upper(b.nmbre_clnte)nmbre_clnte,',
'		       upper(b.slgan)slgan,',
'		       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'		       to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'		       :F_IP as ipaddr,',
'		       :F_NMBRE_USRIO as Usuario,       ',
'		       a.file_mimetype,',
'		       json_value(:P37_JSON,''$.fcha_i'') as fcha_incial,',
'		       json_value(:P37_JSON,''$.fcha_f'') as fcha_fnal,',
'		       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'		  from df_c_imagenes_cliente a',
'		  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'		 where a.cdgo_clnte = :F_CDGO_CLNTE',
'		   and a.cdgo_imgen_clnte = ''L_E''   '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(39670357698395581)
,p_shared_query_id=>wwv_flow_api.id(38244760638073375)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  --2. informacion general',
'		select a.cnsctvo',
'		     , to_char(a.fcha_pz_slvo,''DD/MM/YYYY HH:MI AM'') as fcha_pz_slvo',
'		     , e.idntfccion_sjto',
'		     , e.idntfccion_rspnsble',
'		     , trim(e.prmer_nmbre||'' ''||e.sgndo_nmbre||'' ''||e.prmer_aplldo||'' ''||e.sgndo_aplldo) as rspnsble',
'		     , a.id_impsto',
'		     , c.nmbre_impsto',
'		     , a.id_impsto_sbmpsto',
'		     , d.nmbre_impsto_sbmpsto',
'		     , b.id_usrio',
'		     , b.nmbre_trcro',
'		  from gf_g_paz_y_salvo           a',
'		  join v_sg_g_usuarios            b  on a.usrio_dgta        = b.user_name',
'		  join df_c_impuestos             c  on a.id_impsto         = c.id_impsto',
'		  join df_i_impuestos_subimpuesto d  on a.id_impsto_sbmpsto = d.id_impsto_sbmpsto',
'		  join v_si_i_sujetos_responsable e  on a.id_sjto_impsto    = e.id_sjto_impsto',
'		                                    and e.prncpal_s_n       = ''S''    ',
'		 where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'		   and trunc(a.fcha_pz_slvo) between json_value(:P37_JSON,''$.fcha_i'') ',
'		                                                and json_value(:P37_JSON,''$.fcha_f'')',
'           and b.id_usrio                    = nvl(json_value(:P37_JSON,''$.id_usrio''),b.id_usrio)                                                       ',
'		 order by b.id_usrio',
'		        , a.id_impsto',
'		        , a.id_impsto_sbmpsto',
'                , to_char(a.fcha_pz_slvo,''DD/MM/YYYY HH:MI AM'')',
'		        , e.idntfccion_sjto;'))
);
end;
/
