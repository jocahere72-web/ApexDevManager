prompt --application/shared_components/reports/report_queries/gf_g_estdo_crtra_cntrbynte_23001
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(3998415976070722)
,p_name=>'gf_g_estdo_crtra_cntrbynte_23001'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_cncpto',
'      , a.vgncia',
'      , a.prdo                  ',
'      , a.dscrpcion_cncpto                 ',
'      , a.dscrpcion_mvnt_fncro_estdo     ',
'      , nvl(b.indcdor,''No'') as indcdor',
'      , upper(json_value(:P37_JSON , ''$.nmbre_rprte'')) as nmbre_rprte',
'      , sum(a.vlor_sldo_cptal) as vlor_sldo_cptal',
'      , sum(a.vlor_intres) as vlor_intres',
'      , (sum(a.vlor_sldo_cptal) + sum(a.vlor_intres)) as vlor_ttal ',
'  from  v_gf_g_cartera_x_concepto a                               ',
'  left join (   select id_sjto_impsto',
'                    , vgncia',
'                    , id_prdo',
'                    , id_cncpto',
unistr('                    , ''S\00ED'' as indcdor'),
'                 from cb_g_procesos_jrdco_mvmnto a',
'                 join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'                where a.estdo = ''A''',
'                  and b.cdgo_prcsos_jrdco_estdo = ''A''',
'             group by id_sjto_impsto',
'                    , vgncia',
'                    , id_prdo',
'                    , id_cncpto',
unistr('                    , ''S\00ED'') b'),
'         on a.id_sjto_impsto  = b.id_sjto_impsto',
'        and a.id_cncpto       = b.id_cncpto ',
'        and a.id_prdo         = b.id_prdo',
'        and a.vgncia          = b.vgncia',
'        and a.id_prdo         = b.id_prdo',
'  where a.cdgo_clnte          = :F_CDGO_CLNTE',
'    and a.id_impsto           = json_value(:P37_JSON , ''$.id_impsto'') ',
'    and a.id_impsto_sbmpsto   = json_value(:P37_JSON , ''$.id_impsto_sbmpsto'')          ',
'    and a.vgncia between        json_value(:P37_JSON , ''$.vgncia_dsd'')  and json_value(:P37_JSON , ''$.vgncia_hsta'')              ',
'    and a.id_sjto_impsto      = json_value(:P37_JSON , ''$.id_sjto_impsto'')                ',
'group by a.cdgo_cncpto',
'      , a.vgncia',
'      , a.prdo                  ',
'      , a.dscrpcion_cncpto                  ',
'      , a.dscrpcion_mvnt_fncro_estdo     ',
'      , nvl(b.indcdor,''No'')',
'      , upper(json_value(:P37_JSON , ''$.nmbre_rprte''))',
'      , a.id_sjto_impsto'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_estdo_crtra_cntrbynte_23001'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(12131183188052438)
,p_shared_query_id=>wwv_flow_api.id(3998415976070722)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.cdgo_cncpto',
'      , a.vgncia',
'      , a.prdo                  ',
'      , a.dscrpcion_cncpto                 ',
'      , a.dscrpcion_mvnt_fncro_estdo     ',
'      , nvl(b.indcdor,''No'') as indcdor',
'      , upper(json_value(:P37_JSON , ''$.nmbre_rprte'')) as nmbre_rprte',
'      , sum(a.vlor_sldo_cptal) as vlor_sldo_cptal',
'      , sum(a.vlor_intres) as vlor_intres',
'      , (sum(a.vlor_sldo_cptal) + sum(a.vlor_intres)) as vlor_ttal ',
'  from  v_gf_g_cartera_x_concepto a                               ',
'  left join (   select id_sjto_impsto',
'                    , vgncia',
'                    , id_prdo',
'                    , id_cncpto',
unistr('                    , ''S\00ED'' as indcdor'),
'                 from cb_g_procesos_jrdco_mvmnto a',
'                 join cb_g_procesos_juridico b on b.id_prcsos_jrdco = a.id_prcsos_jrdco',
'                where a.estdo = ''A''',
'                  and b.cdgo_prcsos_jrdco_estdo = ''A''',
'             group by id_sjto_impsto',
'                    , vgncia',
'                    , id_prdo',
'                    , id_cncpto',
unistr('                    , ''S\00ED'') b'),
'         on a.id_sjto_impsto  = b.id_sjto_impsto',
'        and a.id_cncpto       = b.id_cncpto ',
'        and a.id_prdo         = b.id_prdo',
'        and a.vgncia          = b.vgncia',
'        and a.id_prdo         = b.id_prdo',
'  where a.cdgo_clnte          = :F_CDGO_CLNTE',
'    and a.id_impsto           = json_value(:P37_JSON , ''$.id_impsto'') ',
'    and a.id_impsto_sbmpsto   = json_value(:P37_JSON , ''$.id_impsto_sbmpsto'')          ',
'    and a.vgncia between        json_value(:P37_JSON , ''$.vgncia_dsd'')  and json_value(:P37_JSON , ''$.vgncia_hsta'')              ',
'    and a.id_sjto_impsto      = json_value(:P37_JSON , ''$.id_sjto_impsto'')    ',
'    and a.cdgo_mvnt_fncro_estdo not in (''AN'')',
'group by a.cdgo_cncpto',
'      , a.vgncia',
'      , a.prdo                  ',
'      , a.dscrpcion_cncpto                  ',
'      , a.dscrpcion_mvnt_fncro_estdo     ',
'      , nvl(b.indcdor,''No'')',
'      , upper(json_value(:P37_JSON , ''$.nmbre_rprte''))',
'      , a.id_sjto_impsto',
'  order by a.vgncia    ',
'         , a.prdo   ',
'         , a.dscrpcion_cncpto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(12131345794052438)
,p_shared_query_id=>wwv_flow_api.id(3998415976070722)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select trim( b.prmer_nmbre||'' ''||b.sgndo_nmbre||'' ''||b.prmer_aplldo||'' ''||b.sgndo_aplldo) as nmbre             ',
'              , a.idntfccion_sjto_frmtda              ',
'              , a.drccion                         ',
'           from  v_si_i_sujetos_impuesto  a             ',
'           join si_i_sujetos_responsable  b',
'             on a.id_sjto_impsto        = b.id_sjto_impsto',
'          where a.cdgo_clnte            = :F_CDGO_CLNTE ',
'            and a.id_impsto             = json_value(:P37_JSON , ''$.id_impsto'')  ',
'            and a.id_sjto_impsto        = json_value(:P37_JSON , ''$.id_sjto_impsto'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(12131546025052439)
,p_shared_query_id=>wwv_flow_api.id(3998415976070722)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'          to_char(systimestamp, ''DD'') as dia,',
'          to_char(systimestamp, ''MM'') as mes,',
'          to_char(systimestamp, ''YYYY'') as anio,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype',
'      --  (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'      -- (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE)nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(12131759216052439)
,p_shared_query_id=>wwv_flow_api.id(3998415976070722)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Consulta 4',
'  select a.nmbre_dprtmnto nmbre_dprtmnto_clnte',
'      ,a.nmbre_mncpio   nmbre_mncpio_clnte',
'      , decode(b.id_impsto,:F_CDGO_CLNTE||3, d.nmbre_impsto_sbmpsto,b.nmbre_impsto) nmbre_impsto',
'      ,pkg_gn_generalidades.fnc_cl_consecutivo(:F_CDGO_CLNTE, ''ECC'') as cnsctvo',
'      ,PKG_GF_PAZ_Y_SALVO.fnc_co_sjto_trbto( p_cdgo_clnte 	   =>  :F_CDGO_CLNTE',
'										   , p_id_sjto_impsto  =>  json_value(:P37_JSON , ''$.id_sjto_impsto'')  ',
'										   , p_id_impsto       =>  json_value(:P37_JSON , ''$.id_impsto'')) as sjto_trbto',
'     ,PKG_GF_PAZ_Y_SALVO.fnc_co_rspnsbles_paz_y_slvo ( p_cdgo_clnte 	 => :F_CDGO_CLNTE',
'                                                     , p_id_sjto_impsto  => json_value(:P37_JSON , ''$.id_sjto_impsto'')  ',
'                                                     , p_id_impsto       => json_value(:P37_JSON , ''$.id_impsto'')) as rspnsble',
'    , case when c.cdgo_sjto_tpo = ''E'' then',
'                ''Contribuyente''',
'           when c.cdgo_sjto_tpo = ''P'' then',
'                 ''Predio''',
'           when c.cdgo_sjto_tpo = ''V'' then',
unistr('                 ''Veh\00EDculo''   '),
'      end as tpo_sjto',
' from v_df_s_clientes  a',
' join df_c_impuestos   b on a.cdgo_clnte = b.cdgo_clnte',
' join v_si_i_sujetos_impuesto c on c.id_sjto_impsto = json_value(:P37_JSON , ''$.id_sjto_impsto'')',
' join df_i_impuestos_subimpuesto d on d.id_impsto = c.id_impsto and d.id_impsto_sbmpsto = json_value(:P37_JSON , ''$.id_impsto_sbmpsto'')',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and b.id_impsto  = json_value(:P37_JSON , ''$.id_impsto'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(12131950737052439)
,p_shared_query_id=>wwv_flow_api.id(3998415976070722)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Consulta 5',
'select trim(APEX_WEB_SERVICE.BLOB2CLOBBASE64(f_bmp2jpg',
'    (zt_qr.f_qr_as_bmp(''https://monteria.taxationsmart.co/ords/f?p=150000:2025021:::::F_CDGO_CLNTE,P2025021_ID_SJTO_IMPSTO,P2025021_ID_RPRTE_AUDTRIA_TRZA:23001,'' || json_value(:P37_JSON, ''$.id_sjto_impsto'') || '','' || json_value(:P37_JSON, ''$.id_rprte'
||'_audtria_trza''), ''M'', ''N'')',
'                                 ))',
'                                    ) as QR ',
'from dual;'))
);
end;
/
