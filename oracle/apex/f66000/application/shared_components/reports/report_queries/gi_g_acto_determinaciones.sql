prompt --application/shared_components/reports/report_queries/gi_g_acto_determinaciones
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(72738077767164497)
,p_name=>'gi_g_acto_determinaciones'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte) nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''PTC'';'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_acto_determinaciones'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121334343939291606)
,p_shared_query_id=>wwv_flow_api.id(72738077767164497)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte) nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        --pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'       --a.file_mimetype,',
'        upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''PTC'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121334584016291606)
,p_shared_query_id=>wwv_flow_api.id(72738077767164497)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 2. Documento',
'with responsables as',
'   (select a.id_dtrmncion,',
'           rtrim(xmlagg(XMLELEMENT(e, c.prmer_nmbre || '' identificado con '' || b.nmtcnco_idntfccion_tpo || '' '' || c.idntfccion, '', '').EXTRACT(''//text()'')).GetClobVal(),'','') rspnsbles',
'  from gi_g_determinaciones a',
'  join gi_g_dtrmncn_rspnsble c',
'    on c.id_dtrmncion = a.id_dtrmncion',
'  join df_s_identificaciones_tipo b',
'    on c.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
' where a.id_dtrmncion_lte = json_value(:P37_JSON, ''$.id_dtrmncion_lte'')',
'   and a.id_dtrmncion =',
'       nvl(json_value(:P37_JSON, ''$.id_dtrmncion''), a.id_dtrmncion)',
' group by a.id_dtrmncion),',
'/* (select a.id_dtrmncion,',
'         listagg(prmer_nmbre || '' identificado(a) con '' ||',
'                 b.nmtcnco_idntfccion_tpo || '' '' || idntfccion,',
'                 '', '') within group(order by prmer_nmbre) as rspnsbles',
'    from gi_g_determinaciones a',
'    join gi_g_dtrmncn_rspnsble c',
'      on c.id_dtrmncion = a.id_dtrmncion',
'    join df_s_identificaciones_tipo b',
'      on c.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'   where a.id_dtrmncion_lte = json_value(:P37_JSON, ''$.id_dtrmncion_lte'')',
'     and a.id_dtrmncion =',
'         nvl(json_value(:P37_JSON, ''$.id_dtrmncion''), a.id_dtrmncion)',
'   group by a.id_dtrmncion),*/',
'vigencias as',
' (select id_dtrmncion,',
'         trim(to_char(sum(vlor), ''999G999G999G999G999G999G990'')) vlor_dtrmncion,',
'         upper(pkg_gn_generalidades.fnc_number_to_text(sum(vlor), ''p'')) vlor_ltras,',
'         listagg(vgncia, '', '') within group(order by vgncia) as vgncias',
'    from (select l.id_dtrmncion,',
'                 l.vgncia,',
'                 sum(nvl(vlor_cptal, 0) + nvl(vlor_intres, 0)) vlor',
'            from gi_g_determinaciones k',
'            join gi_g_determinacion_detalle l',
'              on l.id_dtrmncion = k.id_dtrmncion',
'           where k.id_dtrmncion_lte =',
'                 json_value(:P37_JSON, ''$.id_dtrmncion_lte'')',
'             and k.id_dtrmncion =',
'                 nvl(json_value(:P37_JSON, ''$.id_dtrmncion''),',
'                     k.id_dtrmncion)',
'           group by l.id_dtrmncion, l.vgncia)',
'   group by id_dtrmncion)',
'',
'select f.idntfccion_sjto,',
'       trim(f.drccion) drccion,',
'       f.nmbre_mncpio_ntfccion,',
'       f.nmbre_dprtmnto_ntfccion,',
'       trim(f.drccion_ntfccion) drccion_ntfccion,',
'       to_char(a.fcha_dtrmncion, ''DD/MM/YYYY'') fcha_dtrmncion,',
'       d.nmro_acto cnsctvo,',
'       j.vlor_dtrmncion,',
'       j.vlor_ltras,',
'       h.rspnsbles,',
'       pkg_gi_determinacion.fnc_co_detalle_determinacion(a.id_dtrmncion) as dtlle_vgncia,',
'       j.vgncias,',
'       d.nmbre_trcro,',
'       d.nmbre_crgo,',
'       case',
'         when e.frma_tpo = ''MNL'' then',
'          null',
'         else',
'          pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => c.firma_file_blob)',
'       end as frma,',
'       case',
'         when e.frma_tpo = ''MNL'' then',
'          null',
'         else',
'          d.dscrpcion_dcrto_jstfccion_frma',
'       end as dcrto_frma',
'  from gi_g_determinaciones a',
'  join v_gn_g_actos d',
'    on a.id_acto = d.id_acto',
'  join df_c_funcionarios c',
'    on d.id_fncnrio_frma = c.id_fncnrio',
'  join gn_d_actos_funcionario_frma e',
'    on d.id_acto_tpo = e.id_acto_tpo',
'  join v_si_i_sujetos_impuesto f',
'    on f.id_sjto_impsto = a.id_sjto_impsto',
'  join responsables h',
'    on h.id_dtrmncion = a.id_dtrmncion',
'  join vigencias j',
'    on j.id_dtrmncion = a.id_dtrmncion',
' where a.id_dtrmncion_lte = json_value(:P37_JSON, ''$.id_dtrmncion_lte'')',
'   and a.id_dtrmncion =',
'       nvl(json_value(:P37_JSON, ''$.id_dtrmncion''), a.id_dtrmncion)',
'   and ((json_value(:P37_JSON, ''$.gnrcion_tpo'') = ''ACT'' and',
'       d.nmro_acto between',
'       nvl(json_value(:P37_JSON, ''$.rango_inicio''), d.nmro_acto) and',
'       nvl(json_value(:P37_JSON, ''$.rango_fin''), d.nmro_acto)) or',
'       json_value(:P37_JSON, ''$.gnrcion_tpo'') is null)',
' order by d.nmro_acto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121334768106291606)
,p_shared_query_id=>wwv_flow_api.id(72738077767164497)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--4. Logo Pie de pagina ',
'select NULL as lgo_pie_pgna--pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_pie_pgna',
'from df_c_imagenes_cliente a ',
'where a.cdgo_clnte = :F_CDGO_CLNTE and a.cdgo_imgen_clnte = ''LPP'';'))
);
end;
/
