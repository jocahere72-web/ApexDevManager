prompt --application/shared_components/reports/report_queries/mc_g_ofcio_gnral_embrgos
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(154033132813766835)
,p_name=>'mc_g_ofcio_gnral_embrgos'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) ',
'		  from df_c_impuestos m ',
'		 where m.id_impsto = json_value(:P7_JSON, ''$.id_impsto'')) as nmbre_impsto,',
'       (select upper(nmbre_rprte) ',
'		  from gn_d_reportes m ',
'		 where m.id_rprte = json_value(:P7_JSON, ''$.id_rprte'') ) as nmbre_rpte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = json_value(:P7_JSON, ''$.cdgo_clnte'')',
'   and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'mc_g_ofcio_gnral_embrgos'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24928354721853368)
,p_shared_query_id=>wwv_flow_api.id(154033132813766835)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_rprte) ',
'		  from gn_d_reportes m ',
'		 where m.id_rprte = json_value(:P2_XML, ''$.id_rprte'') ) as nmbre_rpte',
'  from df_c_imagenes_cliente a',
'  join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
' where a.cdgo_clnte = json_value(:P2_XML, ''$.cdgo_clnte'')',
'   and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24928506974853368)
,p_shared_query_id=>wwv_flow_api.id(154033132813766835)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto_ofcio as nmro_ofcio,',
'      a.fcha_ofcio,',
'      pkg_gn_generalidades.fnc_cl_fecha_texto(a.fcha_OFCIO) as fcha',
'from mc_g_solicitudes_y_oficios a',
'where a.id_acto_slctud = json_value(:P2_XML, ''$.id_acto_slctud'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24928732782853368)
,p_shared_query_id=>wwv_flow_api.id(154033132813766835)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select distinct(a.dscrpcion) as entidad',
'from v_mc_g_solicitudes_y_oficios 	a',
'where a.acto_slctud = json_value(:P2_XML, ''$.id_acto_slctud'')',
'and (a.id_entddes = json_value(:P2_XML, ''$.id_entddes'') or  json_value(:P2_XML, ''$.id_entddes'') is null);*/',
'',
'select case',
'        when json_value(:P2_XML, ''$.id_entddes'') is not null then    ',
'            (',
'            select ',
'                LISTAGG(b.dscrpcion, '', '') as dscrpcion',
'            from (select ',
'                        b.dscrpcion',
'                    from mc_g_solicitudes_y_oficios a join mc_d_entidades b on a.id_entddes = b.id_entddes',
'                    where ',
'                    case ',
'                        when json_value(:P2_XML, ''$.id_acto_ofi'') is not null and  a.Id_Acto_Ofcio = json_value(:P2_XML, ''$.id_acto_ofi'') then 1',
'                        else 0',
'                    end = 1',
'                    and b.cdgo_entdad_tpo = ''FN''',
'                    group by b.dscrpcion,a.id_acto_ofcio) b',
'            )',
'            else',
'                (select ',
'                        distinct b.dscrpcion',
'                    from mc_g_solicitudes_y_oficios a join mc_d_entidades b on a.id_entddes = b.id_entddes',
'                    where a.id_acto_slctud = json_value(:P2_XML, ''$.id_acto_slctud''))',
'            end as entidad',
'from dual'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24928912262853369)
,p_shared_query_id=>wwv_flow_api.id(154033132813766835)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct e.nmro_acto as rslcion_embrgo',
'              ,max(to_char (e.fcha_acto,''dd/mm/yyyy'')) as fcha_rslcion ',
'              , i.idntfccion',
'              , replace((i.prmer_nmbre||'' ''||i.sgndo_nmbre||'' ''||i.prmer_aplldo||'' ''||i.sgndo_aplldo),'' .'','''') as nombre_completo',
'              , k.idntfccion as rfrncia',
'              , to_char(d.vlor_mdda_ctlar,:F_FRMTO_MNDA) as cntia',
'              , max(g.nmro_prcso_jrdco)as nmro_prcso',
'              ,case  ',
'                 when substr(e.nmro_acto,0,4) in (''2012'',''2013'',''2014'') then e.nmro_acto',
'                 else to_char(l.nmro_cnsctvo)  ',
'               end as ofcio_bnco',
'from mc_g_embargos_resolucion		e',
'join mc_g_embargos_cartera         	d on e.id_embrgos_crtra = d.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd 	f on f.id_embrgos_crtra = d.id_embrgos_crtra',
'left join cb_g_procesos_juridico   	g on g.id_prcsos_jrdco = f.id_prcsos_jrdco',
'join mc_g_embargos_responsable     	i on i.id_embrgos_crtra = d.id_embrgos_crtra',
'join mc_g_embargos_sjto            	j on j.id_embrgos_crtra = d.id_embrgos_crtra',
'join si_c_sujetos                  	k on k.id_sjto = j.id_sjto',
'join mc_g_lotes_mdda_ctlar         	l on e.id_lte_mdda_ctlar = l.id_lte_mdda_ctlar',
'join mc_d_estados_cartera          	m on d.id_estdos_crtra = m.id_estdos_crtra and m.cdgo_estdos_crtra not in (''N'')',
'where d.id_tpos_mdda_ctlar = json_value(:P2_XML, ''$.id_tpos_mdda_ctlar'')',
'and e.id_embrgos_rslcion in (select rslciones from',
'                            (select level,',
'                                    (regexp_substr( ',
'                                    (select json_value(:P2_XML, ''$.id_embrgos_rslcion.v_embrgos_rslcion'') from dual),',
'                                    ''[^,]+'', 1, level )) as rslciones',
'                               from dual',
'                            connect by level <= regexp_count( ',
'                                                (select json_value(:P2_XML, ''$.id_embrgos_rslcion.v_embrgos_rslcion'') from dual),',
'                                                '','' ) + 1',
'                                and prior sys_guid() is not null))',
'--and trunc(e.fcha_acto) = trunc(sysdate)',
'group by',
'               e.nmro_acto ',
'              ,e.fcha_acto',
'             , i.idntfccion',
'              , (i.prmer_nmbre||'' ''||i.sgndo_nmbre||'' ''||i.prmer_aplldo||'' ''||i.sgndo_aplldo)',
'              , k.idntfccion ',
'              ,  d.vlor_mdda_ctlar',
'              --, g.nmro_prcso_jrdco',
'              ,e.nmro_acto,l.nmro_cnsctvo',
'order by e.nmro_acto asc'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24929147163853369)
,p_shared_query_id=>wwv_flow_api.id(154033132813766835)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as dscrpcion_tpo_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where id_tpos_mdda_ctlar = json_value(:P2_XML, ''$.id_tpos_mdda_ctlar'');'))
);
end;
/
