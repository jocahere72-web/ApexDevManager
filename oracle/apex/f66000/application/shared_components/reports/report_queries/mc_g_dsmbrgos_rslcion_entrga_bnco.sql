prompt --application/shared_components/reports/report_queries/mc_g_dsmbrgos_rslcion_entrga_bnco
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(23577834629770490)
,p_name=>'mc_g_dsmbrgos_rslcion_entrga_bnco'
,p_query_text=>'select * from dual;'
,p_format=>'PDF'
,p_output_file_name=>'mc_g_dsmbrgos_rslcion_entrga_bnco'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(49586891820686983)
,p_shared_query_id=>wwv_flow_api.id(23577834629770490)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'       (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE)nmbre_rpte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(49587086467686983)
,p_shared_query_id=>wwv_flow_api.id(23577834629770490)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_cnsctvo',
'     , a.fcha_lte ',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => b.firma_file_blob) as frma',
'     , b.nmbre_trcro',
'     , b.nmbre_crgo',
'     , pkg_gn_generalidades.fnc_cl_fecha_texto(a.fcha_lte) as fcha',
'  from mc_g_lotes_mdda_ctlar a',
'  join v_df_c_funcionarios   b on a.id_fncnrio = b.id_fncnrio',
' where tpo_lte = ''D'' ',
'   and id_lte_mdda_ctlar = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_lte_mdda_ctlar'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(49587246704686983)
,p_shared_query_id=>wwv_flow_api.id(23577834629770490)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select distinct c.entidad',
'  from v_mc_g_desembargos_resolucion a',
'  join v_gn_g_actos b on a.id_acto = b.id_acto',
'  join v_mc_g_desembargos_oficio c on a.id_dsmbrgos_rslcion = c.id_dsmbrgos_rslcion',
' where a.cdgo_clnte         = :F_CDGO_CLNTE',
'   and a.id_lte_mdda_ctlar  = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_lte_mdda_ctlar'')',
'   and a.id_acto is not null;*/',
'   ',
' select distinct(a.dscrpcion) entidad',
'from v_mc_g_solicitudes_y_oficios a',
'join mc_g_desembargos_cartera     b on a.id_embrgos_crtra    = b.id_embrgos_crtra',
'join mc_g_desembargos_oficio	  c on b.id_dsmbrgos_rslcion = c.id_dsmbrgos_rslcion',
'join mc_g_desembargos_resolucion  d on c.id_dsmbrgos_rslcion = d.id_dsmbrgos_rslcion',
'where d.cdgo_clnte         = :F_CDGO_CLNTE',
'and   d.id_lte_mdda_ctlar = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_lte_mdda_ctlar'')',
'and   d.id_acto is not null;     '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(49587462310686983)
,p_shared_query_id=>wwv_flow_api.id(23577834629770490)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select distinct a.nmro_acto  as rslcion_dsmbrgo',
'     , i.idntfccion',
'     , i.prmer_nmbre',
'     , k.idntfccion as rfrncia',
'     , to_char(d.vlor_mdda_ctlar,:F_FRMTO_MNDA) as cntia',
'     , e.nmro_acto as rslcion_embrgo',
'     , g.nmro_prcso_jrdco as nmro_prcso',
'     , b.nmro_acto || '' de '' || pkg_gn_generalidades.fnc_cl_fecha_texto(b.fcha_acto) as ofcio_bnco',
'  from mc_g_desembargos_resolucion     a ',
'  join mc_g_desembargos_oficio         b  on b.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'  join mc_g_desembargos_cartera        c  on c.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'  join mc_g_embargos_cartera           d  on d.id_embrgos_crtra = c.id_embrgos_crtra',
' join mc_g_embargos_resolucion         e  on e.id_embrgos_crtra = d.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd     f  on f.id_embrgos_crtra = d.id_embrgos_crtra',
'left join cb_g_procesos_juridico       g  on g.id_prcsos_jrdco = f.id_prcsos_jrdco',
'  join mc_g_embargos_responsable       i on i.id_embrgos_crtra   = d.id_embrgos_crtra  ',
'  join mc_g_embargos_sjto              j on j.id_embrgos_crtra   = d.id_embrgos_crtra',
'  join si_c_sujetos                    k on k.id_sjto            = j.id_sjto',
'where a.id_lte_mdda_ctlar   = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_lte_mdda_ctlar'')*/',
'/*',
'select distinct a.nmro_acto as rslcion_dsmbrgo',
'              , i.idntfccion',
'              , i.prmer_nmbre',
'              , k.idntfccion as rfrncia',
'              , to_char(d.vlor_mdda_ctlar,:F_FRMTO_MNDA) as cntia',
'              , e.nmro_acto as rslcion_embrgo',
'              , g.nmro_prcso_jrdco as nmro_prcso',
'              ,case',
'                 when substr(e.nmro_acto,0,4)in (''2012'',''2013'',''2014'') then e.nmro_acto',
'                 else to_char(l.nmro_cnsctvo)',
'               end as ofcio_bnco',
'from mc_g_desembargos_resolucion   a',
'join mc_g_desembargos_oficio       b on b.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'join mc_g_desembargos_cartera      c on c.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'join mc_g_embargos_cartera         d on d.id_embrgos_crtra = c.id_embrgos_crtra',
'join mc_g_embargos_resolucion      e on e.id_embrgos_crtra = d.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd f on f.id_embrgos_crtra = d.id_embrgos_crtra',
'left join cb_g_procesos_juridico   g on g.id_prcsos_jrdco = f.id_prcsos_jrdco',
'join mc_g_embargos_responsable     i on i.id_embrgos_crtra = d.id_embrgos_crtra',
'join mc_g_embargos_sjto            j on j.id_embrgos_crtra = d.id_embrgos_crtra',
'join si_c_sujetos                  k on k.id_sjto = j.id_sjto',
'join mc_g_lotes_mdda_ctlar         l on e.id_lte_mdda_ctlar = l.id_lte_mdda_ctlar',
'where a.id_lte_mdda_ctlar = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_lte_mdda_ctlar'')*/',
'',
'select distinct a.nmro_acto as rslcion_dsmbrgo',
'              , i.idntfccion',
'              , i.prmer_nmbre',
'              , k.idntfccion as rfrncia',
'              , to_char(d.vlor_mdda_ctlar,:F_FRMTO_MNDA) as cntia',
'              , e.nmro_acto as rslcion_embrgo',
'              , g.nmro_prcso_jrdco as nmro_prcso',
'            --, b.nmro_acto || '' de '' || pkg_gn_generalidades.fnc_cl_fecha_texto(b.fcha_acto) as ofcio_bnco',
'              ,case  ',
'                 when substr(e.nmro_acto,0,4)in (''2012'',''2013'',''2014'') then e.nmro_acto',
'                 else to_char(l.nmro_cnsctvo)  ',
'               end as ofcio_bnco',
'from mc_g_desembargos_resolucion   a',
'join mc_g_desembargos_oficio       b on b.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'join mc_g_desembargos_cartera      c on c.id_dsmbrgos_rslcion = a.id_dsmbrgos_rslcion',
'join mc_g_embargos_cartera         d on d.id_embrgos_crtra = c.id_embrgos_crtra',
'join mc_g_embargos_resolucion      e on e.id_embrgos_crtra = d.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd f on f.id_embrgos_crtra = d.id_embrgos_crtra',
'left join cb_g_procesos_juridico   g on g.id_prcsos_jrdco = f.id_prcsos_jrdco',
'join mc_g_embargos_responsable     i on i.id_embrgos_crtra = d.id_embrgos_crtra',
'join mc_g_embargos_sjto            j on j.id_embrgos_crtra = d.id_embrgos_crtra',
'join si_c_sujetos                  k on k.id_sjto = j.id_sjto',
'join mc_g_lotes_mdda_ctlar         l on e.id_lte_mdda_ctlar = l.id_lte_mdda_ctlar',
'join mc_d_estados_cartera          m on d.id_estdos_crtra = m.id_estdos_crtra and m.cdgo_estdos_crtra not in (''N'')',
'where a.id_lte_mdda_ctlar = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_lte_mdda_ctlar'')'))
);
end;
/
