prompt --application/shared_components/reports/report_queries/gf_g_crtra_x_cncpto_x_vgncia
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(40832241583393024)
,p_name=>'gf_g_crtra_x_cncpto_x_vgncia'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select vgncia',
'      , cdgo_cncpto',
'      , dscrpcion_cncpto',
'      , vlor_sldo_cptal',
'      , vlor_intres',
'      , (vlor_sldo_cptal+vlor_intres) as vlor_ttal ',
'      , id_impsto',
'      , id_impsto_sbmpsto',
'   from v_gf_g_cartera_x_concepto',
'  where id_impsto=16',
'    and id_impsto_sbmpsto=13',
'    and vgncia >= 2017;'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_crtra_x_cncpto_x_vgncia'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21969736445762654)
,p_shared_query_id=>wwv_flow_api.id(40832241583393024)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'     select vgncia',
'          , cdgo_cncpto',
'          , dscrpcion_cncpto',
'          , trunc(sum(vlor_sldo_cptal)) as vlor_sldo_cptal',
'          , trunc(sum(vlor_intres)) as vlor_intres',
'          , trunc(sum(vlor_sldo_cptal)+sum(vlor_intres)) as vlor_ttal ',
'          , id_impsto',
'          , id_impsto_sbmpsto',
'          , json_value( :P37_JSON , ''$.vgncia'') as p_vgncia',
'          , upper(json_value( :P37_JSON , ''$.v_nmbre_rprte'')) as nmbre_rprte',
'       from v_gf_g_cartera_x_concepto',
'      where cdgo_clnte        = :F_CDGO_CLNTE',
'        and id_impsto         =json_value( :P37_JSON , ''$.id_impsto'')',
'        and id_impsto_sbmpsto =json_value( :P37_JSON , ''$.id_impsto_sbmpsto'')',
'        and vgncia            >= json_value( :P37_JSON , ''$.vgncia'')',
'   group by vgncia',
'          , cdgo_cncpto',
'          , dscrpcion_cncpto',
'          , id_impsto',
'          , id_impsto_sbmpsto',
'          , json_value( :P37_JSON , ''$.vgncia'')',
'   order by vgncia                  '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21969955121762654)
,p_shared_query_id=>wwv_flow_api.id(40832241583393024)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'       (select upper(nmbre_rprte)  from gn_d_reportes m  where m.id_rprte  = :P_ID_RPRTE)nmbre_rpte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
end;
/
