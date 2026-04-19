prompt --application/shared_components/reports/report_queries/gf_g_stdo_crtra
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(47817401150907014)
,p_name=>'gf_g_stdo_crtra'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   with ttal_vgncia',
'             as (                   ',
'                        select sum(m.vlor_sldo_cptal+m.vlor_intres) as vlor_ttal                           ',
'                             , m.vgncia',
'                             , m.id_prdo',
'                          from v_gf_g_cartera_x_concepto  m',
'                         where m.cdgo_clnte        = 6--:F_CDGO_CLNTE',
'                           and m.id_impsto         = 16--:P18_ID_IMPSTO',
'                           and m.id_impsto_sbmpsto = 13--:P18_ID_IMPSTO_SBMPSTO',
'                           and (m.vgncia * 100) + m.prdo between ( 2014 * 100 ) + 1',
'						  	                                 and ( 2019 * 100 ) + 1',
'                          group by m.vgncia',
'                                 , m.id_prdo',
'                )',
'             select a.vgncia||''-''||a.prdo as vgncia_prdo',
'                  , count (a.id_sjto_impsto) as nmro_prdios',
'                  , a.cdgo_cncpto  ',
'                  , a.id_cncpto',
'                  , a.dscrpcion_cncpto',
'                  , sum(a.vlor_sldo_cptal) as vlor_sldo_cptal',
'                  , sum(a.vlor_intres) as vlor_intres    ',
'                  , c.vlor_ttal',
'               from v_gf_g_cartera_x_concepto a      ',
'               join df_i_periodos b',
'                 on a.vgncia = b.vgncia',
'                and a.id_prdo = b.id_prdo',
'                and (b.vgncia * 100) + b.prdo  between ( 2014 * 100 ) + 1',
'										  and ( 2019* 100 ) + 1',
'               join ttal_vgncia c',
'                 on a.vgncia            = c.vgncia',
'                and a.id_prdo           = c.id_prdo ',
'              where a.cdgo_clnte        = 6--:F_CDGO_CLNTE',
'                and a.id_impsto         = 16--:P18_ID_IMPSTO',
'                and a.id_impsto_sbmpsto = 13--:P18_ID_IMPSTO_SBMPSTO                ',
'           group by a.vgncia',
'                  , a.prdo',
'                  , a.dscrpcion_cncpto',
'                  , a.cdgo_cncpto                 ',
'                  , a.id_cncpto',
'                  , c.vlor_ttal',
'           order by a.vgncia;'))
,p_report_layout_id=>wwv_flow_api.id(48001467291869982)
,p_format=>'XLS'
,p_output_file_name=>'gf_g_stdo_crtra'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21758176911723996)
,p_shared_query_id=>wwv_flow_api.id(47817401150907014)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'         select a.vgncia',
'              , a.prdo',
'              , a.cdgo_cncpto',
'              , a.dscrpcion_cncpto',
'              , sum(a.vlor_sldo_cptal) as vlor_sldo_cptal',
'              , sum(a.vlor_intres) as vlor_intres',
'              , (',
'                 select (sum(a.vlor_sldo_cptal)+sum(a.vlor_intres)) as vlor_ttal              ',
'                    from v_gf_g_cartera_x_concepto a          ',
'                   where a.cdgo_clnte =:F_CDGO_CLNTE',
'                     and a.vgncia = json_value( :P37_JSON , ''$.vgncia'') ',
'                     and a.prdo   = json_value( :P37_JSON , ''$.prdo'')',
'                ) as vlor_ttal',
'              , json_value( :P37_JSON , ''$.vgncia'') as p_vgncia',
'              , json_value( :P37_JSON , ''$.prdo'') as p_prdo',
'              , json_value( :P37_JSON , ''$.nmbre_rprte'') as nmbre_rprte',
'           from v_gf_g_cartera_x_concepto a          ',
'          where a.cdgo_clnte =:F_CDGO_CLNTE',
'            and a.vgncia = json_value( :P37_JSON , ''$.vgncia'') ',
'            and a.prdo   = json_value( :P37_JSON , ''$.prdo'') ',
'       group by a.vgncia',
'              , a.prdo',
'              , a.cdgo_cncpto',
'              , a.dscrpcion_cncpto;'))
);
end;
/
