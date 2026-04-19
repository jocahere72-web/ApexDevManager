prompt --application/shared_components/reports/report_queries/fi_g_informe_crga_lbral
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(36503432992159062)
,p_name=>'fi_g_informe_crga_lbral'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'fi_g_informe_crga_lbral'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(36503638283159063)
,p_shared_query_id=>wwv_flow_api.id(36503432992159062)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y pir de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_in'' )   as fcha_in,',
'        json_value(:P37_JSON ,''$.fcha_fin'' )  as fcha_fin,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(36503853207159063)
,p_shared_query_id=>wwv_flow_api.id(36503432992159062)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2.',
'select j.id_fncnrio,',
'       j.idntfccion,',
'       j.nmbre_ofcna,',
'       j.nmbre_crgo,',
'       j.nmbre_trcro,',
'       c.idntfccion_sjto,',
'       b.nmbre_rzon_scial,',
'       to_char(e.fcha_aprtra,''DD/MM/YYYY HH:MI:SS am'') as fcha_aprtra,',
'       e.nmro_expdnte,',
'       e.id_fsclzcion_expdnte,',
'       l.tpo_acto,',
'       l.nmro_acto,',
'       to_char(l.fcha_crcion,''DD/MM/YYYY HH:MI:SS am'') as fcha_crcion',
'  from v_fi_g_candidatos              a',
'  join si_i_personas                  b   on  a.id_sjto_impsto        =   b.id_sjto_impsto',
'  join v_si_i_sujetos_impuesto        c   on  b.id_sjto_impsto        =   c.id_sjto_impsto',
'  join fi_g_candidatos_vigencia       d   on  a.id_cnddto             =   d.id_cnddto  ',
'  join fi_g_fiscalizacion_expdnte     e   on  a.id_cnddto             =   e.id_cnddto',
'  join fi_g_fsclzcion_expdnte_acto    f   on  e.id_fsclzcion_expdnte  =   f.id_fsclzcion_expdnte',
'  join gn_g_actos                     i   on  f.id_acto               =   i.id_acto',
'  join gn_d_actos_tipo                h   on  i.id_acto_tpo           =   h.id_acto_tpo',
'  join v_df_c_funcionarios            j   on  e.id_fncnrio            =   j.id_fncnrio',
'  left join table (pkg_gf_paz_y_salvo.fnc_co_ultmo_acto(e.id_fsclzcion_expdnte)) l on l.id_fsclzcion_expdnte = e.id_fsclzcion_expdnte',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and j.id_fncnrio = nvl(json_value(:P37_JSON ,''$.id_fncnrio'' ),j.id_fncnrio)',
'   and e.cdgo_expdnte_estdo = ''ABT''',
' group by c.idntfccion_sjto,',
'       b.nmbre_rzon_scial,',
'       j.nmbre_trcro,',
'       j.id_fncnrio,',
'       to_char(e.fcha_aprtra,''DD/MM/YYYY HH:MI:SS am''),',
'       e.nmro_expdnte,',
'       e.id_fsclzcion_expdnte,',
'       l.nmro_acto,',
'       to_char(l.fcha_crcion,''DD/MM/YYYY HH:MI:SS am''),',
'       l.tpo_acto,',
'       j.idntfccion,',
'       j.nmbre_ofcna,',
'       j.nmbre_crgo    '))
);
end;
/
