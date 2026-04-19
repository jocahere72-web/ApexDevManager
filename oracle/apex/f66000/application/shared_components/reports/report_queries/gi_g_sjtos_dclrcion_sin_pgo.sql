prompt --application/shared_components/reports/report_queries/gi_g_sjtos_dclrcion_sin_pgo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(129312586912724257)
,p_name=>'gi_g_sjtos_dclrcion_sin_pgo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. detalle del reporte',
'select a.id_sjto_impsto',
'     , c.idntfccion_sjto',
'     , d.nmbre_rzon_scial',
'     , c.drccion',
'     , c.email      ',
'     , a.nmro_cnsctvo',
'     , a.vlor_ttal',
'     , a.vlor_pago      ',
'     , (',
'           select sum(vlor_hber) ',
'             from gf_g_movimientos_financiero x',
'             join gf_g_movimientos_detalle    z on x.id_mvmnto_fncro = z.id_mvmnto_fncro',
'            where x.cdgo_clnte        = a.cdgo_clnte',
'              and x.id_impsto         = a.id_impsto',
'              and x.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'              and x.id_sjto_impsto    = a.id_sjto_impsto',
'              and z.vgncia            = a.vgncia',
'              and z.id_prdo           = a.id_prdo',
'       ',
'       ) as vlor_pgdo',
'     , b.vlor_sldo_cptal',
'     , b.vlor_intres        ',
'  from gi_g_declaraciones          a',
'  join v_gf_g_cartera_x_vigencia   b  on a.cdgo_clnte            = b.cdgo_clnte',
'                                     and a.id_impsto             = b.id_impsto',
'                                     and a.id_impsto_sbmpsto     = b.id_impsto_sbmpsto',
'                                     and a.id_sjto_impsto        = b.id_sjto_impsto',
'                                     and a.vgncia                = b.vgncia',
'                                     and a.id_prdo               = b.id_prdo',
'                                     and b.cdgo_mvmnto_orgn      = ''DL''',
'                                     and b.id_orgen              = a.id_dclrcion     ',
'                                     and b.cdgo_mvnt_fncro_estdo = ''CN''',
'  join v_si_i_sujetos_impuesto     c  on a.id_sjto_impsto        = c.id_sjto_impsto',
'  join si_i_personas               d  on a.id_sjto_impsto        = d.id_sjto_impsto',
' where a.cdgo_clnte          = :F_CDGO_CLNTE',
'   and a.id_impsto           = json_value(:P37_JSON,''$.id_impsto'')',
'   and a.id_impsto_sbmpsto   = json_value(:P37_JSON,''$.id_impsto_sbmpsto'')',
'   and a.cdgo_dclrcion_estdo = ''APL''',
'   and a.vgncia              = json_value(:P37_JSON,''$.vgncia'')',
'   and a.id_prdo             = json_value(:P37_JSON,''$.id_prdo'')                        ',
'   and b.vlor_sldo_cptal     > 0',
';'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_sjtos_dclrcion_sin_pgo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(129369754588131295)
,p_shared_query_id=>wwv_flow_api.id(129312586912724257)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. detalle del reporte',
'select a.id_sjto_impsto',
'     , c.idntfccion_sjto',
'     , d.nmbre_rzon_scial',
'     , c.drccion',
'     , c.email      ',
'     , a.nmro_cnsctvo',
'     , a.vlor_ttal',
'     , a.vlor_pago      ',
'     , (',
'           select sum(vlor_hber) ',
'             from gf_g_movimientos_financiero x',
'             join gf_g_movimientos_detalle    z on x.id_mvmnto_fncro = z.id_mvmnto_fncro',
'            where x.cdgo_clnte        = a.cdgo_clnte',
'              and x.id_impsto         = a.id_impsto',
'              and x.id_impsto_sbmpsto = a.id_impsto_sbmpsto',
'              and x.id_sjto_impsto    = a.id_sjto_impsto',
'              and z.vgncia            = a.vgncia',
'              and z.id_prdo           = a.id_prdo',
'       ',
'       ) as vlor_pgdo',
'     , b.vlor_sldo_cptal',
'     , b.vlor_intres       ',
'  from gi_g_declaraciones          a',
'  join v_gf_g_cartera_x_vigencia   b  on a.cdgo_clnte            = b.cdgo_clnte',
'                                     and a.id_impsto             = b.id_impsto',
'                                     and a.id_impsto_sbmpsto     = b.id_impsto_sbmpsto',
'                                     and a.id_sjto_impsto        = b.id_sjto_impsto',
'                                     and a.vgncia                = b.vgncia',
'                                     and a.id_prdo               = b.id_prdo',
'                                     and b.cdgo_mvmnto_orgn      = ''DL''',
'                                     and b.id_orgen              = a.id_dclrcion     ',
'                                     and b.cdgo_mvnt_fncro_estdo = json_value(:P37_JSON,''$.cdgo_mvnt_fncro_estdo'')',
'  join v_si_i_sujetos_impuesto     c  on a.id_sjto_impsto        = c.id_sjto_impsto',
'  join si_i_personas               d  on a.id_sjto_impsto        = d.id_sjto_impsto',
' where a.cdgo_clnte          = :F_CDGO_CLNTE',
'   and a.id_impsto           = json_value(:P37_JSON,''$.id_impsto'')',
'   and a.id_impsto_sbmpsto   = json_value(:P37_JSON,''$.id_impsto_sbmpsto'')',
'   and a.cdgo_dclrcion_estdo = ''APL''',
'   and a.vgncia              = json_value(:P37_JSON,''$.vgncia'')',
'   and a.id_prdo             = json_value(:P37_JSON,''$.id_prdo'')                        ',
'   and b.vlor_sldo_cptal     > 0',
';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(129369909853131295)
,p_shared_query_id=>wwv_flow_api.id(129312586912724257)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 2. Encabezado',
'select upper(b.nmbre_clnte)                                     as nmbre_clnte',
'     , upper(b.slgan)                                           as slgan',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'     , to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'')             as fcha_imprsion',
'     , :F_IP                                                    as ipaddr',
'     , :F_NMBRE_USRIO                                           as usrio',
'     , a.file_mimetype',
'     , upper(json_value(:P37_JSON,''$.nmbre_rprte''))             as nmbre_rprte  ',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes         b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'' '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(129370199004131295)
,p_shared_query_id=>wwv_flow_api.id(129312586912724257)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 3. parametros',
'select json_value(:P37_JSON,''$.prdo'')   as prdo',
'     , json_value(:P37_JSON,''$.vgncia'') as vgncia',
unistr('     , decode(json_value(:P37_JSON,''$.cdgo_mvnt_fncro_estdo''), ''CN'', ''S\00ED'', ''No'') as cnvnio'),
'  from dual;  '))
);
end;
/
