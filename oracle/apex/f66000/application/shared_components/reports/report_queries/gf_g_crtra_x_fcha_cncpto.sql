prompt --application/shared_components/reports/report_queries/gf_g_crtra_x_fcha_cncpto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(28608968918630498)
,p_name=>'gf_g_crtra_x_fcha_cncpto'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte,',
'       json_value(:P37_JSON,''$.fcha'') as fcha_crte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_crtra_x_fcha_cncpto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28815117823206158)
,p_shared_query_id=>wwv_flow_api.id(28608968918630498)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte,',
'       json_value(:P37_JSON,''$.fcha'') as fcha_crte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28815303519206159)
,p_shared_query_id=>wwv_flow_api.id(28608968918630498)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*                   select upper(a.nmbre_impsto) as nmbre_impsto',
'                        , upper(a.nmbre_impsto_sbmpsto) as nmbre_impsto_sbmpsto',
'                        , trunc(a.vlor_sldo_cptal) as vlor_sldo_cptal',
'                        , a.id_cncpto',
'                        , a.cdgo_cncpto',
'                        , a.dscrpcion_cncpto',
'                      from (',
'                                  select + index (gf_g_movimientos_detalle gf_g_movimientos_dtlle_fcha_mvmnto_idx)',
'                                         c.nmbre_impsto',
'                                       , c.nmbre_impsto_sbmpsto',
'                                       , sum( b.vlor_dbe - b.vlor_hber ) as vlor_sldo_cptal',
'                                       , b.id_cncpto',
'                                       , f.cdgo_cncpto',
'                                       , f.dscrpcion as dscrpcion_cncpto',
'                                    from gf_g_movimientos_financiero  a',
'                                    join gf_g_movimientos_detalle     b on a.id_mvmnto_fncro = b.id_mvmnto_fncro',
'                                    join v_df_i_impuestos_subimpuesto c on a.id_impsto_sbmpsto = c.id_impsto_sbmpsto',
'                                    join df_i_periodos                d on a.id_prdo = d.id_prdo',
'                                    join gf_d_mvmnto_fncro_estdo      e on a.cdgo_mvnt_fncro_estdo = e.cdgo_mvnt_fncro_estdo',
'                                    join df_i_conceptos               f on b.id_cncpto = f.id_cncpto',
'                                   where a.id_impsto           = nvl(json_value(:P37_JSON,''$.id_impsto''),a.id_impsto)-- (101,102)',
'                                     and trunc( b.fcha_mvmnto) <= json_value(:P37_JSON,''$.fcha'')',
'                                group by c.nmbre_impsto',
'                                       , c.nmbre_impsto_sbmpsto                                       ',
'                                       , b.id_cncpto',
'                                       , f.dscrpcion',
'                                       , f.cdgo_cncpto',
'                        ) a',
'                 where a.vlor_sldo_cptal > 0',
'                 order by 1, 6;*/',
'                 ',
'        select id_impsto',
'             , nmbre_impsto',
'             , id_impsto_sbmpsto',
'             , nmbre_impsto_sbmpsto',
'             , id_cncpto',
'             , cdgo_cncpto',
'             , dscrpcion_cncpto',
'             , round(sum(vlor_sldo_cptal))           as vlor_sldo_cptal',
'             , sum(interes)                   as vlor_intres',
'             , round(sum(vlor_sldo_cptal + interes)) as vlor_ttal',
'          from temp_cartera',
'     group by id_impsto',
'            , nmbre_impsto',
'            , id_impsto_sbmpsto',
'            , nmbre_impsto_sbmpsto',
'            , id_cncpto',
'            , cdgo_cncpto',
'            , dscrpcion_cncpto',
'     order by id_impsto',
'            , id_impsto_sbmpsto',
'            , id_cncpto                 '))
);
end;
/
