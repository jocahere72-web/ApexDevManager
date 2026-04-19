prompt --application/shared_components/reports/report_queries/gi_g_sjtos_dclrcion
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(129209966780624673)
,p_name=>'gi_g_sjtos_dclrcion'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_sjto_impsto',
'     , c.idntfccion',
'     , d.nmbre_rzon_scial',
'     , c.drccion',
'     , b.email',
'  from gi_g_declaraciones    a',
'  join si_i_sujetos_impuesto b  on a.id_sjto_impsto = b.id_sjto_impsto   ',
'  join si_c_sujetos          c  on b.id_sjto        = c.id_sjto ',
'  join si_i_personas         d  on a.id_sjto_impsto = d.id_sjto_impsto',
' where a.cdgo_clnte                 = 23001',
'   and a.id_dclrcion_vgncia_frmlrio in (',
'                                            select x.id_dclrcion_vgncia_frmlrio',
'                                              from gi_d_dclrcnes_vgncias_frmlr x',
'                                              join gi_d_dclrcnes_tpos_vgncias  y on x.id_dclrcion_tpo_vgncia = y.id_dclrcion_tpo_vgncia',
'                                             where y.vgncia  = 2021',
'                                               and y.id_prdo = 363',
'   ',
'                                         )',
'   and a.id_impsto           = 230012',
'   and a.id_impsto_sbmpsto   = ''2300122''  ',
'   and a.cdgo_dclrcion_estdo = ''APL''',
'   and not exists (',
'                    select x.id_sjto_impsto',
'                      from gi_g_declaraciones x',
'                     where x.id_sjto_impsto      = a.id_sjto_impsto',
'                        and x.id_dclrcion_vgncia_frmlrio in (',
'                                                                select f.id_dclrcion_vgncia_frmlrio',
'                                                                  from gi_d_dclrcnes_vgncias_frmlr f',
'                                                                  join gi_d_dclrcnes_tpos_vgncias  y on f.id_dclrcion_tpo_vgncia = y.id_dclrcion_tpo_vgncia',
'                                                                 where y.vgncia  = 2022',
'                                                                   and y.id_prdo = 1394',
'                                                            ) ',
'                       and x.id_impsto           = 230012',
'                       and x.id_impsto_sbmpsto   = ''2300122''',
'                       and x.cdgo_dclrcion_estdo = ''APL''',
'                       ',
'                  )'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_sjtos_dclrcion'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(129362084793001415)
,p_shared_query_id=>wwv_flow_api.id(129209966780624673)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. detalle del reporte',
'select a.id_sjto_impsto',
'     , c.idntfccion',
'     , d.nmbre_rzon_scial',
'     , c.drccion',
'     , b.email',
'     , listagg(a.vgncia, '' - '') within group(order by a.vgncia) as vgncias_prsntdas',
'  from gi_g_declaraciones    a',
'  join si_i_sujetos_impuesto b  on a.id_sjto_impsto = b.id_sjto_impsto   ',
'  join si_c_sujetos          c  on b.id_sjto        = c.id_sjto ',
'  join si_i_personas         d  on a.id_sjto_impsto = d.id_sjto_impsto',
' where a.cdgo_clnte                 = :F_CDGO_CLNTE',
'   and a.id_dclrcion_vgncia_frmlrio = (',
'                                            select x.id_dclrcion_vgncia_frmlrio',
'                                              from gi_d_dclrcnes_vgncias_frmlr x',
'                                              join gi_d_dclrcnes_tpos_vgncias  y on x.id_dclrcion_tpo_vgncia = y.id_dclrcion_tpo_vgncia',
'                                             where y.vgncia  = json_value(:P37_JSON,''$.vgncia_prsntda'')',
'                                               and y.id_prdo = json_value(:P37_JSON,''$.prdo_prsntdo'')',
'   ',
'                                         )',
'   and a.id_impsto           = json_value(:P37_JSON,''$.id_impsto'')',
'   and a.id_impsto_sbmpsto   = json_value(:P37_JSON,''$.id_impsto_sbmpsto'')',
'   and a.cdgo_dclrcion_estdo = ''APL''',
'   and not exists (',
'                    select x.id_sjto_impsto',
'                      from gi_g_declaraciones x',
'                     where x.id_sjto_impsto      = a.id_sjto_impsto',
'                        and x.id_dclrcion_vgncia_frmlrio = (',
'                                                                select f.id_dclrcion_vgncia_frmlrio',
'                                                                  from gi_d_dclrcnes_vgncias_frmlr f',
'                                                                  join gi_d_dclrcnes_tpos_vgncias  y on f.id_dclrcion_tpo_vgncia = y.id_dclrcion_tpo_vgncia',
'                                                                 where y.vgncia  = json_value(:P37_JSON,''$.vgncia_no_prsntda'')',
'                                                                   and y.id_prdo = json_value(:P37_JSON,''$.prdo_no_prsntdo'')',
'                                                            ) ',
'                       and x.id_impsto           = json_value(:P37_JSON,''$.id_impsto'')',
'                       and x.id_impsto_sbmpsto   = json_value(:P37_JSON,''$.id_impsto_sbmpsto'')',
'                       and x.cdgo_dclrcion_estdo = ''APL''',
'                       ',
'                  )',
'group by a.id_sjto_impsto, c.idntfccion, d.nmbre_rzon_scial, c.drccion, b.email                 '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(129362273403001415)
,p_shared_query_id=>wwv_flow_api.id(129209966780624673)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 2. Encabezado',
'select upper(b.nmbre_clnte)                                     as nmbre_clnte',
'     , upper(b.slgan)                                           as slgan',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'     , to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'')             as fcha_imprsion',
'     , :F_IP                                                    as ipaddr',
'     , :F_NMBRE_USRIO                                           as usrio',
'     , a.file_mimetype',
'     , upper(json_value(:P37_JSON,''$.nmbre_rprte''))             as nmbre_rprte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes         b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'' '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(129362488311001415)
,p_shared_query_id=>wwv_flow_api.id(129209966780624673)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 3. parametros',
'select  json_value(:P37_JSON,''$.dscrpcion_prdo_prsntdo'')         as  dscrpcion_prdo_prsntdo',
'      , json_value(:P37_JSON,''$.dscrpcion_prdo_no_prsntdo'')      as  dscrpcion_prdo_no_prsntdo',
'      , json_value(:P37_JSON,''$.vgncia_prsntda'')                 as vgncia_prsntda',
'      , json_value(:P37_JSON,''$.vgncia_no_prsntda'')              as vgncia_no_prsntda',
'   from dual;'))
);
end;
/
