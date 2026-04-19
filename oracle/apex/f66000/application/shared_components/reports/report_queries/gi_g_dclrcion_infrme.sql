prompt --application/shared_components/reports/report_queries/gi_g_dclrcion_infrme
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(30308911412858461)
,p_name=>'gi_g_dclrcion_infrme'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado',
'select  a.nmro_cnsctvo,',
'        a.vgncia,',
'        b.prdo,',
'        b.dscrpcion dscrpcion_prdo,',
'        c.idntfccion_sjto,',
'        (',
'            select  t1.vlor_dsplay',
'            from    json_table  (',
'                                    pkg_gi_declaraciones.fnc_gn_json_propiedades_2(p_id_dclrcion    =>  a.id_dclrcion),',
'                                    ''$[*]'' columns  (',
'                                                        id_dclrcion     number          path ''$.id_dclrcion'',',
'                                                        id_hmlgcion     number          path ''$.id_hmlgcion'',',
'                                                        cdgo_hmlgcion   varchar2(100)   path ''$.cdgo_hmlgcion'',',
'                                                        cdgo_prpdad     varchar2(100)   path ''$.cdgo_prpdad'',',
'                                                        vlor            clob            path ''$.vlor'',',
'                                                        vlor_dsplay     clob            path ''$.vlor_dsplay''',
'                                                    )',
'                                )   t1',
'            where   t1.cdgo_hmlgcion    =   ''PRD''',
'            and     t1.cdgo_prpdad      =   ''TST''',
'        ) rgmen,',
'        d.nmbre_rzon_scial',
'from    gi_g_declaraciones      a',
'join    df_i_periodos           b   on  b.id_prdo           =   a.id_prdo',
'join    v_si_i_sujetos_impuesto c   on  c.id_sjto_impsto    =   a.id_sjto_impsto',
'join    si_i_personas           d   on  d.id_sjto_impsto    =   a.id_sjto_impsto',
'where   a.id_dclrcion   =   json_value(:P37_JSON,''$.id_dclrcion'');'))
,p_xml_structure=>'STANDARD'
,p_format=>'PDF'
,p_output_file_name=>'gi_g_dclrcion_infrme'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(30309140169858461)
,p_shared_query_id=>wwv_flow_api.id(30308911412858461)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado',
'select  a.nmro_cnsctvo,',
'        a.vgncia,',
'        b.prdo,',
'        b.dscrpcion dscrpcion_prdo,',
'        c.idntfccion_sjto,',
'        (',
'            select  t1.vlor_dsplay',
'            from    json_table  (',
'                                    pkg_gi_declaraciones.fnc_gn_json_propiedades_2(p_id_dclrcion    =>  a.id_dclrcion),',
'                                    ''$[*]'' columns  (',
'                                                        id_dclrcion     number          path ''$.id_dclrcion'',',
'                                                        id_hmlgcion     number          path ''$.id_hmlgcion'',',
'                                                        cdgo_hmlgcion   varchar2(100)   path ''$.cdgo_hmlgcion'',',
'                                                        cdgo_prpdad     varchar2(100)   path ''$.cdgo_prpdad'',',
'                                                        vlor            clob            path ''$.vlor'',',
'                                                        vlor_dsplay     clob            path ''$.vlor_dsplay''',
'                                                    )',
'                                )   t1',
'            where   t1.cdgo_hmlgcion    =   ''PRD''',
'            and     t1.cdgo_prpdad      =   ''TST''',
'        ) rgmen,',
'        d.nmbre_rzon_scial',
'from    gi_g_declaraciones      a',
'join    df_i_periodos           b   on  b.id_prdo           =   a.id_prdo',
'join    v_si_i_sujetos_impuesto c   on  c.id_sjto_impsto    =   a.id_sjto_impsto',
'join    si_i_personas           d   on  d.id_sjto_impsto    =   a.id_sjto_impsto',
'where   a.id_dclrcion   =   json_value(:P37_JSON,''$.id_dclrcion'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(30309361838858469)
,p_shared_query_id=>wwv_flow_api.id(30308911412858461)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Detalle',
'select  a.dscrpcion,',
'        a.vlor_dsplay',
'from    json_table  (',
'                        pkg_gi_declaraciones.fnc_co_atributos_seleccion(p_id_dclrcion    =>  json_value(:P37_JSON,''$.id_dclrcion'')), ''$[*]''',
'                        columns (',
'                                    cdgo_extrccion_objto    varchar2(1000)  path ''$.cdgo_extrccion_objto'',',
'                                    id_frmlrio              number          path ''$.id_frmlrio'',',
'                                    id_frmlrio_rgion        number          path ''$.id_frmlrio_rgion'',',
'                                    id_frmlrio_rgion_atrbto number          path ''$.id_frmlrio_rgion_atrbto'',',
'                                    dscrpcion               varchar2(1000)  path ''$.dscrpcion'',',
'                                    vlor                    clob            path ''$.vlor'',',
'                                    vlor_dsplay             clob            path ''$.vlor_dsplay''',
'                                )',
'                    )   a',
'where   a.cdgo_extrccion_objto  =   ''ITM'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(30309408381858469)
,p_shared_query_id=>wwv_flow_api.id(30308911412858461)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3. Total',
'select  count(*) item_dclrdos',
'from    json_table  (',
'                        pkg_gi_declaraciones.fnc_co_atributos_seleccion(p_id_dclrcion    =>  json_value(:P37_JSON,''$.id_dclrcion'')), ''$[*]''',
'                        columns (',
'                                    cdgo_extrccion_objto    varchar2(1000)  path ''$.cdgo_extrccion_objto'',',
'                                    id_frmlrio              number          path ''$.id_frmlrio'',',
'                                    id_frmlrio_rgion        number          path ''$.id_frmlrio_rgion'',',
'                                    id_frmlrio_rgion_atrbto number          path ''$.id_frmlrio_rgion_atrbto'',',
'                                    dscrpcion               varchar2(1000)  path ''$.dscrpcion'',',
'                                    vlor                    clob            path ''$.vlor'',',
'                                    vlor_dsplay             clob            path ''$.vlor_dsplay''',
'                                )',
'                    )   a;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(30309670965858469)
,p_shared_query_id=>wwv_flow_api.id(30308911412858461)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--4. Encabeza y Pie de pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
end;
/
