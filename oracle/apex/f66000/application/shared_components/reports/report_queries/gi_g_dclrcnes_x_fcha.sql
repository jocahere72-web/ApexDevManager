prompt --application/shared_components/reports/report_queries/gi_g_dclrcnes_x_fcha
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(30307706249845454)
,p_name=>'gi_g_dclrcnes_x_fcha'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabeza y Pie de pagina',
'select  upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'from    df_c_imagenes_cliente a',
'join    df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where   a.cdgo_clnte = :F_CDGO_CLNTE',
'and     a.cdgo_imgen_clnte = ''L_E'';'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_dclrcnes_x_fcha'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(30307980127845567)
,p_shared_query_id=>wwv_flow_api.id(30307706249845454)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabeza y Pie de pagina',
'select  upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'from    df_c_imagenes_cliente a',
'join    df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where   a.cdgo_clnte = :F_CDGO_CLNTE',
'and     a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(30308210315845675)
,p_shared_query_id=>wwv_flow_api.id(30307706249845454)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Reporte 2',
'select      a.dscrpcion dscrpcion_dclrcion_tpo,',
'            b.vgncia,',
'            c.dscrpcion dscrpcion_prdo,',
'            e.fcha_prsntcion,',
'            e.nmro_cnsctvo,',
'            f.idntfccion_sjto,',
'            g.nmbre_rzon_scial,',
'            to_char(e.bse_grvble, ''999G999G999G999G999G999G999G999G999G999G999'') bse_grvble,',
'            to_char(e.vlor_ttal, ''999G999G999G999G999G999G999G999G999G999G999'') vlor_ttal,',
'            to_char(e.vlor_pago, ''999G999G999G999G999G999G999G999G999G999G999'') vlor_pago,',
'            h.vlor_dsplay tpo_sjto',
'from        gi_d_declaraciones_tipo     a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcn_tpo             =   a.id_dclrcn_tpo',
'inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo',
'inner join  gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_tpo_vgncia    =   b.id_dclrcion_tpo_vgncia',
'inner join  gi_g_declaraciones          e   on  e.id_dclrcion_vgncia_frmlrio=   d.id_dclrcion_vgncia_frmlrio',
'inner join  v_si_i_sujetos_impuesto     f   on  f.id_sjto_impsto            =   e.id_sjto_impsto',
'inner join  si_i_personas               g   on  g.id_sjto_impsto            =   f.id_sjto_impsto',
'left  join  json_table  (',
'                            pkg_gi_declaraciones.fnc_gn_json_propiedades_2(p_id_dclrcion    =>  e.id_dclrcion),',
'                            ''$[*]'' columns  (',
'                                                id_dclrcion     number          path ''$.id_dclrcion'',',
'                                                id_hmlgcion     number          path ''$.id_hmlgcion'',',
'                                                cdgo_hmlgcion   varchar2(100)   path ''$.cdgo_hmlgcion'',',
'                                                cdgo_prpdad     varchar2(100)   path ''$.cdgo_prpdad'',',
'                                                vlor            clob            path ''$.vlor'',',
'                                                vlor_dsplay     clob            path ''$.vlor_dsplay''',
'                                            )',
'                        )               h   on  h.id_dclrcion               =   e.id_dclrcion',
'                                            and h.cdgo_hmlgcion             =   ''PRD''',
'                                            and h.cdgo_prpdad               =   ''TST''',
'where       a.cdgo_clnte                =   :F_CDGO_CLNTE',
'and         a.id_impsto                 =   nvl(json_value(:P37_JSON,''$.p_id_impsto''), a.id_impsto)',
'and         a.id_impsto_sbmpsto         =   nvl(json_value(:P37_JSON,''$.p_id_impsto_sbmpsto''), a.id_impsto_sbmpsto)',
'and         a.id_dclrcn_tpo             =   nvl(json_value(:P37_JSON,''$.p_id_dclrcn_tpo''), a.id_dclrcn_tpo)',
'and         b.vgncia                    =   nvl(json_value(:P37_JSON,''$.p_vgncia''), b.vgncia)',
'and         c.id_prdo                   =   nvl(json_value(:P37_JSON,''$.p_id_prdo''), c.id_prdo)',
'and         f.idntfccion_sjto           =   nvl(json_value(:P37_JSON,''$.p_idntfccion_sjto''), f.idntfccion_sjto)',
'and         to_number(nvl(h.vlor, 0))   =   nvl(json_value(:P37_JSON,''$.p_id_sjto_tpo''), to_number(nvl(h.vlor, 0)))',
'and         e.cdgo_dclrcion_estdo   in  (''PRS'', ''APL'', ''FRM'', ''COR'')',
'and         trunc(e.fcha_prsntcion) between to_timestamp(json_value(:P37_JSON,''$.p_fcha_incial''), ''dd/mm/yyyy'') and to_timestamp(json_value(:P37_JSON,''$.p_fcha_fnal''), ''dd/mm/yyyy'')',
'order by    e.fcha_prsntcion desc;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(30308377074845718)
,p_shared_query_id=>wwv_flow_api.id(30307706249845454)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Reporte 2',
'--Consulta 2',
'select      to_char(sum(e.bse_grvble), ''999G999G999G999G999G999G999G999G999G999G999'') ttal_bse_grvble,',
'            to_char(sum(e.vlor_ttal), ''999G999G999G999G999G999G999G999G999G999G999'') ttal_vlor_ttal,',
'            to_char(sum(e.vlor_pago), ''999G999G999G999G999G999G999G999G999G999G999'') ttal_vlor_pago',
'from        gi_d_declaraciones_tipo     a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcn_tpo             =   a.id_dclrcn_tpo',
'inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo',
'inner join  gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_tpo_vgncia    =   b.id_dclrcion_tpo_vgncia',
'inner join  gi_g_declaraciones          e   on  e.id_dclrcion_vgncia_frmlrio=   d.id_dclrcion_vgncia_frmlrio',
'inner join  v_si_i_sujetos_impuesto     f   on  f.id_sjto_impsto            =   e.id_sjto_impsto',
'inner join  si_i_personas               g   on  g.id_sjto_impsto            =   f.id_sjto_impsto',
'left  join  json_table  (',
'                            pkg_gi_declaraciones.fnc_gn_json_propiedades_2(p_id_dclrcion    =>  e.id_dclrcion),',
'                            ''$[*]'' columns  (',
'                                                id_dclrcion     number          path ''$.id_dclrcion'',',
'                                                id_hmlgcion     number          path ''$.id_hmlgcion'',',
'                                                cdgo_hmlgcion   varchar2(100)   path ''$.cdgo_hmlgcion'',',
'                                                cdgo_prpdad     varchar2(100)   path ''$.cdgo_prpdad'',',
'                                                vlor            clob            path ''$.vlor'',',
'                                                vlor_dsplay     clob            path ''$.vlor_dsplay''',
'                                            )',
'                        )               h   on  h.id_dclrcion               =   e.id_dclrcion',
'                                            and h.cdgo_hmlgcion             =   ''PRD''',
'                                            and h.cdgo_prpdad               =   ''TST''',
'where       a.cdgo_clnte                =   :F_CDGO_CLNTE',
'and         a.id_impsto                 =   nvl(json_value(:P37_JSON,''$.p_id_impsto''), a.id_impsto)',
'and         a.id_impsto_sbmpsto         =   nvl(json_value(:P37_JSON,''$.p_id_impsto_sbmpsto''), a.id_impsto_sbmpsto)',
'and         a.id_dclrcn_tpo             =   nvl(json_value(:P37_JSON,''$.p_id_dclrcn_tpo''), a.id_dclrcn_tpo)',
'and         b.vgncia                    =   nvl(json_value(:P37_JSON,''$.p_vgncia''), b.vgncia)',
'and         c.id_prdo                   =   nvl(json_value(:P37_JSON,''$.p_id_prdo''), c.id_prdo)',
'and         f.idntfccion_sjto           =   nvl(json_value(:P37_JSON,''$.p_idntfccion_sjto''), f.idntfccion_sjto)',
'and         to_number(nvl(h.vlor, 0))   =   nvl(json_value(:P37_JSON,''$.p_id_sjto_tpo''), to_number(nvl(h.vlor, 0)))',
'and         e.cdgo_dclrcion_estdo   in  (''PRS'', ''APL'', ''FRM'', ''COR'')',
'and         trunc(e.fcha_prsntcion) between to_timestamp(json_value(:P37_JSON,''$.p_fcha_incial''), ''dd/mm/yyyy'') and to_timestamp(json_value(:P37_JSON,''$.p_fcha_fnal''), ''dd/mm/yyyy'');'))
);
end;
/
