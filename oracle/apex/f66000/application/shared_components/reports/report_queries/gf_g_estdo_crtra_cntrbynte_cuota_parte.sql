prompt --application/shared_components/reports/report_queries/gf_g_estdo_crtra_cntrbynte_cuota_parte
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(99723172456917592)
,p_name=>'gf_g_estdo_crtra_cntrbynte_cuota_parte'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Detalle cartera',
'select  a.cdgo_cncpto',
'        , a.vgncia',
'        , a.prdo                  ',
'        , a.dscrpcion_cncpto                 ',
'        , a.dscrpcion_mvnt_fncro_estdo',
'        , upper(json_value(:P37_JSON , ''$.nmbre_rprte'')) 	                as nmbre_rprte',
'        , sum( decode(indcdor_pgdo , 1 , 0 , a.vlor_sldo_cptal_prcntje) )  	as vlor_sldo_cptal',
'        , sum( decode(indcdor_pgdo , 1 , 0 , a.vlor_intres_prcntje) ) 		as vlor_intres',
'        , (sum( decode(indcdor_pgdo , 1 , 0 , a.vlor_sldo_cptal_prcntje) ) + ',
'           sum( decode(indcdor_pgdo , 1 , 0 , a.vlor_intres_prcntje) )  )     as vlor_ttal ',
'from 	table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto( ',
'                                        p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                        p_id_impsto         => json_value(:P37_JSON , ''$.id_impsto''),',
'                                        p_id_impsto_sbmpsto => json_value(:P37_JSON , ''$.id_impsto_sbmpsto''),',
'                                        p_id_sjto_impsto    => json_value(:P37_JSON , ''$.id_sjto_impsto''),',
'                                        p_fcha_vncmnto      => sysdate,',
'                                        p_id_rspnsble       => json_value(:P37_JSON , ''$.id_sjto_rspnsble'')',
'                                        )  ) a',
'where	a.vgncia between        json_value(:P37_JSON , ''$.vgncia_dsd'')  and json_value(:P37_JSON , ''$.vgncia_hsta'')    ',
'and 	a.cdgo_mvnt_fncro_estdo not in (''AN'')',
'group by  a.cdgo_cncpto',
'		, a.vgncia',
'		, a.prdo                  ',
'		, a.dscrpcion_cncpto                  ',
'		, a.dscrpcion_mvnt_fncro_estdo',
'		, upper(json_value(:P37_JSON , ''$.nmbre_rprte''))',
'order by a.vgncia    ',
'         , a.prdo   ',
'         , a.dscrpcion_cncpto'))
,p_report_layout_id=>wwv_flow_api.id(99722930627917339)
,p_format=>'PDF'
,p_output_file_name=>'gf_g_estdo_crtra_cntrbynte_cuota_parte'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(110726976403339580)
,p_shared_query_id=>wwv_flow_api.id(99723172456917592)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Detalle cartera',
'select  a.cdgo_cncpto',
'        , a.vgncia',
'        , a.prdo                  ',
'        , a.dscrpcion_cncpto                 ',
'        , a.dscrpcion_mvnt_fncro_estdo',
'        , upper(json_value(:P37_JSON , ''$.nmbre_rprte'')) 	                as nmbre_rprte',
'        , sum( decode(indcdor_pgdo , 1 , 0 , a.vlor_sldo_cptal_prcntje) )  	as vlor_sldo_cptal',
'        , sum( decode(indcdor_pgdo , 1 , 0 , a.vlor_intres_prcntje) ) 		as vlor_intres',
'        , (sum( decode(indcdor_pgdo , 1 , 0 , a.vlor_sldo_cptal_prcntje) ) + ',
'           sum( decode(indcdor_pgdo , 1 , 0 , a.vlor_intres_prcntje) )  )     as vlor_ttal ',
'from 	table(pkg_gf_movimientos_financiero.fnc_co_mvmnto_x_cncpto( ',
'                                        p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                        p_id_impsto         => json_value(:P37_JSON , ''$.id_impsto''),',
'                                        p_id_impsto_sbmpsto => json_value(:P37_JSON , ''$.id_impsto_sbmpsto''),',
'                                        p_id_sjto_impsto    => json_value(:P37_JSON , ''$.id_sjto_impsto''),',
'                                        p_fcha_vncmnto      => sysdate,',
'                                        p_id_rspnsble       => json_value(:P37_JSON , ''$.id_sjto_rspnsble'')',
'                                        )  ) a',
'where	a.vgncia between        json_value(:P37_JSON , ''$.vgncia_dsd'')  and json_value(:P37_JSON , ''$.vgncia_hsta'')    ',
'and 	a.cdgo_mvnt_fncro_estdo not in (''AN'')',
'group by  a.cdgo_cncpto',
'		, a.vgncia',
'		, a.prdo                  ',
'		, a.dscrpcion_cncpto                  ',
'		, a.dscrpcion_mvnt_fncro_estdo',
'		, upper(json_value(:P37_JSON , ''$.nmbre_rprte''))',
'order by a.vgncia    ',
'         , a.prdo   ',
'         , a.dscrpcion_cncpto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(110727137562339581)
,p_shared_query_id=>wwv_flow_api.id(99723172456917592)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Datos cliente',
'select 	upper(b.nmbre_clnte)	nmbre_clnte,',
'		upper(b.slgan)slgan,',
'		pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'		to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'		:F_IP 					ipaddr,',
'		:F_NMBRE_USRIO 			Usuario,       ',
'		a.file_mimetype',
'from 	df_c_imagenes_cliente 	a',
'join 	df_s_clientes 			b on a.cdgo_clnte = b.cdgo_clnte ',
'where 	a.cdgo_clnte = :F_CDGO_CLNTE',
'and 	a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(110727341810339581)
,p_shared_query_id=>wwv_flow_api.id(99723172456917592)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Consulta 3',
'select 	a.nmbre_dprtmnto	nmbre_dprtmnto_clnte',
'		, a.nmbre_mncpio   	nmbre_mncpio_clnte',
'		, decode(b.id_impsto,:F_CDGO_CLNTE||3, d.nmbre_impsto_sbmpsto,b.nmbre_impsto) nmbre_impsto',
'		, pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''ECC'') 			  cnsctvo',
'		, PKG_GF_PAZ_Y_SALVO.fnc_co_sjto_trbto( p_cdgo_clnte 	   =>  :F_CDGO_CLNTE',
'											   , p_id_sjto_impsto  =>  json_value(:P37_JSON , ''$.id_sjto_impsto'')  ',
'											   , p_id_impsto       =>  json_value(:P37_JSON , ''$.id_impsto'')) as sjto_trbto',
'		, PKG_GF_PAZ_Y_SALVO.fnc_co_rspnsbles_cuota_parte ( p_cdgo_clnte 	   => :F_CDGO_CLNTE',
'														  , p_id_sjto_impsto   => json_value(:P37_JSON , ''$.id_sjto_impsto'')  ',
'														  , p_id_impsto        => json_value(:P37_JSON , ''$.id_impsto'')',
'														  , p_id_sjto_rspnsble => json_value(:P37_JSON , ''$.id_sjto_rspnsble'')',
'														  ) as rspnsble',
'		, case when c.cdgo_sjto_tpo = ''E'' then',
'				''Contribuyente''',
'			   when c.cdgo_sjto_tpo = ''P'' then',
'				''Predio''',
'			   when c.cdgo_sjto_tpo = ''V'' then',
unistr('				''Veh\00EDculo''   '),
'		  end as tpo_sjto',
'from 	v_df_s_clientes  			a',
'join 	df_c_impuestos   			b on a.cdgo_clnte = b.cdgo_clnte',
'join 	v_si_i_sujetos_impuesto 	c on c.id_sjto_impsto = json_value(:P37_JSON , ''$.id_sjto_impsto'')',
'join 	df_i_impuestos_subimpuesto	d on d.id_impsto = c.id_impsto and d.id_impsto_sbmpsto = json_value(:P37_JSON , ''$.id_impsto_sbmpsto'')',
'where 	a.cdgo_clnte = :F_CDGO_CLNTE',
'and 	b.id_impsto  = json_value(:P37_JSON , ''$.id_impsto'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(110727518656339581)
,p_shared_query_id=>wwv_flow_api.id(99723172456917592)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Consulta 4',
'select trim(APEX_WEB_SERVICE.BLOB2CLOBBASE64(f_bmp2jpg',
'    (zt_qr.f_qr_as_bmp(''https://monteria.taxationsmart.co/ords/f?p=150000:2025021:::::F_CDGO_CLNTE,P2025021_ID_SJTO_IMPSTO,P2025021_ID_RPRTE_AUDTRIA_TRZA:23001,'' || json_value(:P37_JSON, ''$.id_sjto_impsto'') || '','' || json_value(:P37_JSON, ''$.id_rprte'
||'_audtria_trza''), ''M'', ''N'')',
'                                 ))',
'                                    ) as QR ',
'from dual;',
''))
);
end;
/
