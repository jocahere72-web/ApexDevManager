prompt --application/shared_components/reports/report_queries/si_g_stdo_crtra_cntrbynte
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(41055517961469868)
,p_name=>'si_g_stdo_crtra_cntrbynte'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select trim(e.prmer_nmbre||'' ''||e.sgndo_nmbre||'' ''||e.prmer_aplldo||'' ''||e.sgndo_aplldo) as nmbre',
'                  , c.vgncia',
'                  , c.prdo',
'                  , c.dscrpcion_cncpto',
'                  , c.vlor_sldo_cptal',
'                  , c.vlor_intres',
'                  , c.vlor_sldo_cptal + c.vlor_intres as vlor_ttal',
'                  , b.txto_trfa',
'                  , a.bse_grvble',
'                  , c.dscrpcion_mvnt_fncro_estdo                 ',
'               from gi_g_liquidaciones a',
'               join v_gi_g_liquidaciones_concepto b',
'                 on a.id_lqdcion          = b.id_lqdcion',
'               join v_gf_g_cartera_x_concepto c',
'                 on a.cdgo_clnte          = c.cdgo_clnte',
'                and a.id_impsto           = c.id_impsto',
'                and a.id_impsto_sbmpsto   = c.id_impsto_sbmpsto',
'                and a.vgncia              = c.vgncia',
'                and a.id_prdo             = c.id_prdo',
'                and a.id_sjto_impsto      = c.id_sjto_impsto',
'               join v_si_i_sujetos_impuesto d',
'                 on a.id_sjto_impsto      = d.id_sjto_impsto',
'               join v_si_i_sujetos_responsable e ',
'                 on d.id_sjto_impsto      = e.id_sjto_impsto        ',
'              where a.cdgo_clnte          = 6',
'                and a.id_impsto           = 16',
'                and a.id_impsto_sbmpsto   = 13          ',
'                and a.vgncia between      2015 and 2019',
'                --and a.id_prdo             =  328432',
'                and a.id_sjto_impsto      in (347418,',
'347419,',
'347420,',
'347421,',
'347422,',
'347423)--= nvl(9000,a.id_sjto_impsto )',
'                and a.cdgo_lqdcion_estdo  = ''L'';',
'				'))
,p_format=>'PDF'
,p_output_file_name=>'si_g_stdo_crtra_cntrbynte'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(46542677286461170)
,p_shared_query_id=>wwv_flow_api.id(41055517961469868)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --1. detalle del reporte',
'             select c.cdgo_cncpto',
'                  , c.vgncia',
'                  , c.prdo                  ',
'                  , c.dscrpcion_cncpto',
'                  , b.txto_trfa',
'                  , a.bse_grvble',
'                  , c.dscrpcion_mvnt_fncro_estdo     ',
'                  , nvl(f.indcdor,''No'') as indcdor',
'                  , upper(json_value(:P37_JSON , ''$.nmbre_rprte'')) as nmbre_rprte',
'                  , sum(c.vlor_sldo_cptal) as vlor_sldo_cptal',
'                  , sum(c.vlor_intres) as vlor_intres',
'                  , (sum(c.vlor_sldo_cptal) + sum(c.vlor_intres)) as vlor_ttal',
'               from gi_g_liquidaciones a',
'               join v_gi_g_liquidaciones_concepto b',
'                 on a.id_lqdcion          = b.id_lqdcion',
'               join v_gf_g_cartera_x_concepto c',
'                 on a.cdgo_clnte          = c.cdgo_clnte',
'                and a.id_impsto           = c.id_impsto',
'                and a.id_impsto_sbmpsto   = c.id_impsto_sbmpsto',
'                and a.vgncia              = c.vgncia',
'                and a.id_prdo             = c.id_prdo',
'                and a.id_sjto_impsto      = c.id_sjto_impsto   ',
'                and b.cdgo_cncpto         = c.cdgo_cncpto',
'             left join (   select id_sjto_impsto',
'                                , vgncia',
'                                , id_prdo',
'                                , id_cncpto',
unistr('                                , ''S\00ED'' as indcdor'),
'                             from cb_g_procesos_jrdco_mvmnto a',
'                             join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'                            where a.estdo = ''A''',
'                              and b.cdgo_prcsos_jrdco_estdo = ''A''',
'                         group by id_sjto_impsto',
'                                , vgncia',
'                                , id_prdo',
'                                , id_cncpto',
unistr('                                , ''S\00ED'') f'),
'                    on a.id_sjto_impsto   = f.id_sjto_impsto',
'                    and a.id_prdo         = f.id_prdo',
'                    and a.vgncia          = f.vgncia',
'                    and c.id_prdo         = f.id_prdo',
'              where a.cdgo_clnte          = :F_CDGO_CLNTE',
'                and a.id_impsto           = json_value(:P37_JSON , ''$.id_impsto'') ',
'                and a.id_impsto_sbmpsto   = json_value(:P37_JSON , ''$.id_impsto_sbmpsto'')          ',
'                and a.vgncia between        json_value(:P37_JSON , ''$.vgncia_dsd'')  and json_value(:P37_JSON , ''$.vgncia_hsta'')              ',
'                and a.id_sjto_impsto      = json_value(:P37_JSON , ''$.id_sjto_impsto'') ',
'                and a.cdgo_lqdcion_estdo  = ''L''',
'           group by c.cdgo_cncpto',
'                  , c.vgncia',
'                  , c.prdo                  ',
'                  , c.dscrpcion_cncpto',
'                  , b.txto_trfa',
'                  , a.bse_grvble',
'                  , c.dscrpcion_mvnt_fncro_estdo     ',
'                  , nvl(f.indcdor,''No'')',
'                  , upper(json_value(:P37_JSON , ''$.nmbre_rprte''));'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(46542845377461170)
,p_shared_query_id=>wwv_flow_api.id(41055517961469868)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. encabezado y pie de pagina',
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
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(46543037353461170)
,p_shared_query_id=>wwv_flow_api.id(41055517961469868)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3. Datos responsable',
'select trim( c.prmer_nmbre||'' ''||c.sgndo_nmbre||'' ''||c.prmer_aplldo||'' ''||c.sgndo_aplldo) as nmbre             ',
'              , b.idntfccion_sjto_frmtda              ',
'              , b.drccion           ',
'              , a.avluo_ctstral            ',
'              , a.dscrpcion_prdo_dstno',
'              , a.dscrpcion_estrto             ',
'           from v_si_i_predios a',
'           join v_si_i_sujetos_impuesto  b',
'             on a.id_sjto_impsto       = b.id_sjto_impsto',
'           join si_i_sujetos_responsable c',
'             on b.id_sjto_impsto       = c.id_sjto_impsto',
'          where b.cdgo_clnte           = :F_CDGO_CLNTE ',
'            and b.id_impsto            = json_value(:P37_JSON , ''$.id_impsto'')  ',
'            and a.id_sjto_impsto       = json_value(:P37_JSON , ''$.id_sjto_impsto'');'))
);
end;
/
