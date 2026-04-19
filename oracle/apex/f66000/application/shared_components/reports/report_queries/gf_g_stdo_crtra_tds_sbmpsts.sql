prompt --application/shared_components/reports/report_queries/gf_g_stdo_crtra_tds_sbmpsts
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(8244076535904472)
,p_name=>'gf_g_stdo_crtra_tds_sbmpsts'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de Pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE)nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_stdo_crtra_tds_sbmpsts'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(101876088810915789)
,p_shared_query_id=>wwv_flow_api.id(8244076535904472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de Pagina',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P32_ID_RPRTE)nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(101876257665915789)
,p_shared_query_id=>wwv_flow_api.id(8244076535904472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Consulta Todos los Sub impuestos',
'    select upper(a.nmbre_impsto_sbmpsto) as nmbre_impsto_sbmpsto',
'         , nvl2( b.id_impsto_sbmpsto , ''X'' , '' '' ) as si',
'         , nvl2( b.id_impsto_sbmpsto , '' '' , ''X'' ) as no',
'         , nvl( max(nvl2( b.id_impsto_sbmpsto , ''si'' , '''' )) over() , ''no'' ) as indcdor',
'      from df_i_impuestos_subimpuesto a',
' left join (',
'                    select a.id_impsto_sbmpsto',
'                      from v_gf_g_cartera_x_vigencia a',
'                     where a.id_sjto_impsto in (',
'                                                    select a.id_sjto_impsto',
'                                                      from si_i_sujetos_impuesto a',
'                                                     where exists(',
'                                                                    select 1',
'                                                                      from si_c_sujetos b',
'                                                                     where b.cdgo_clnte = json_value(:P37_JSON, ''$.cdgo_clnte'')',
'                                                                       and b.id_sjto    = a.id_sjto',
'                                                                 )',
'                                                      and exists (',
'                                                                     select id_sjto_impsto',
'                                                                       from si_i_sujetos_responsable c',
'                                                                      where trim(idntfccion) like json_value(:P37_JSON, ''$.idntfccion_rspnsble'')||''%''',
'                                                                        and c.id_sjto_impsto = a.id_sjto_impsto',
'                                                                 )',
'                                                )',
'                      and a.vlor_sldo_cptal > 0',
'                 group by a.id_impsto_sbmpsto',
'         ) b',
'        on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto',
'     where a.cdgo_clnte = json_value(:P37_JSON, ''$.cdgo_clnte'')',
'     order by a.nmbre_impsto_sbmpsto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(101876439850915789)
,p_shared_query_id=>wwv_flow_api.id(8244076535904472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3. Consulta el detalle por sujeto',
'select sum(vlor_intres+vlor_sldo_cptal) as deuda  ',
'     , a.vgncia',
'     , a.prdo',
'     , sum( a.vlor_sldo_cptal + a.vlor_intres ) as vlor_ttal',
'     , upper(b.nmbre_impsto_sbmpsto) as nmbre_impsto_sbmpsto_dtlle',
'     , c.idntfccion_sjto     ',
'  from v_gf_g_cartera_x_vigencia  a',
'  join v_si_i_sujetos_impuesto c',
'    on a.id_sjto_impsto = c.id_sjto_impsto',
'  join df_i_impuestos_subimpuesto b ',
'    on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto',
'  join si_i_sujetos_responsable d',
'    on d.id_sjto_impsto = c.id_sjto_impsto',
'   and trim(d.idntfccion)  like  json_value(:P37_JSON, ''$.idntfccion_rspnsble'')||''%''',
' where a.cdgo_clnte        = json_value(:P37_JSON, ''$.cdgo_clnte'')',
'   and a.id_impsto         = nvl(json_value(:P37_JSON, ''$.id_impsto''),a.id_impsto)',
'   and a.id_impsto_sbmpsto = nvl(json_value(:P37_JSON, ''$.id_impsto_sbmpsto''),a.id_impsto_sbmpsto)',
'   ',
' group by a.vgncia',
'     , a.prdo',
'     , upper(b.nmbre_impsto_sbmpsto)',
'     ,  c.idntfccion_sjto',
'     , c.id_sjto_impsto',
'   having sum(vlor_intres+vlor_sldo_cptal) > 0',
'    order by c.idntfccion_sjto',
'            , nmbre_impsto_sbmpsto_dtlle',
'            , a.vgncia',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(101876662981915789)
,p_shared_query_id=>wwv_flow_api.id(8244076535904472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--4. Datos Basicos',
'select b.nmbre_mncpio',
'     , c.nmbre_dprtmnto',
'     , a.nmbre_clnte',
'     , a.nmro_idntfccion        ',
'     , to_char(sysdate, ''DD'')               as dias',
'     , trim(upper(to_char(sysdate, ''month'')))     as mes',
'     , to_char(sysdate, ''YYYY'')             as anio',
'     , json_value(:P37_JSON , ''$.usrio'')   as usrio',
'     , json_value(:P37_JSON , ''$.cnsctvo'') as cnsctvo',
'     , pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte           => json_value(:P37_JSON, ''$.cdgo_clnte'')',
'                                                      , p_cdgo_dfncion_clnte_ctgria  => ''GFN''',
'                                                      , p_cdgo_dfncion_clnte     => ''VAC'' ) as vgncia',
'     , decode(pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte            => json_value(:P37_JSON, ''$.cdgo_clnte'')',
'                                                          , p_cdgo_dfncion_clnte_ctgria  => ''GFN''',
'                                                          , p_cdgo_dfncion_clnte     => ''AEC'' ), ''-1'', '' '', pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte  => json_value(:P37_JSON, ''$.cdgo_clnte'')',
'                                                                                                                                                             , p_cdgo_dfncion_clnte_ctgria  => ''GFN''',
'                                                                                                                                                             , p_cdgo_dfncion_clnte    => ''AEC'' )) as articulo                                            '
||'          ',
'  from df_s_clientes      a ',
'  join df_s_municipios    b on  a.id_mncpio   = b.id_mncpio',
'  join df_s_departamentos c on  a.id_dprtmnto = c.id_dprtmnto      ',
' where a.cdgo_clnte = json_value(:P37_JSON, ''$.cdgo_clnte'')',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(101876890991915789)
,p_shared_query_id=>wwv_flow_api.id(8244076535904472)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--5. Datos Responsable',
'select trim(a.prmer_nmbre||'' ''|| a.sgndo_nmbre||'' ''||a.prmer_aplldo||'' ''||a.sgndo_aplldo) as nmbre',
'     , length(trim(a.prmer_nmbre||'' ''|| a.sgndo_nmbre||'' ''||a.prmer_aplldo||'' ''||a.sgndo_aplldo)) as lngtd',
'     , trim(a.idntfccion_rspnsble) as idntfccion  ',
'     , a.dscrpcion_idntfccion_tpo',
'  from v_si_i_sujetos_responsable a',
' where trim(a.idntfccion_rspnsble) like json_value(:P37_JSON, ''$.idntfccion_rspnsble'') ||''%''',
' order by lngtd desc',
' fetch first 1 rows only'))
);
end;
/
