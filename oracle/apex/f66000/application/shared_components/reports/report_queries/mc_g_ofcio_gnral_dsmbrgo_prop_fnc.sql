prompt --application/shared_components/reports/report_queries/mc_g_ofcio_gnral_dsmbrgo_prop_fnc
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(106819890834705993)
,p_name=>'mc_g_ofcio_gnral_dsmbrgo_prop_fnc'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_report_layout_id=>wwv_flow_api.id(106819660374705728)
,p_format=>'PDF'
,p_output_file_name=>'mc_g_ofcio_gnral_dsmbrgo_prop_fnc'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(106825060928717973)
,p_shared_query_id=>wwv_flow_api.id(106819890834705993)
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
 p_id=>wwv_flow_api.id(106825245670717973)
,p_shared_query_id=>wwv_flow_api.id(106819890834705993)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_acto as nmro_ofcio',
'     , trunc(a.fcha_acto) as fcha_ofcio',
'     , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.firma_file_blob) as frma',
'     , c.nmbre_trcro',
'     , c.nmbre_crgo',
'     , pkg_gn_generalidades.fnc_cl_fecha_texto(a.fcha_acto) as fcha',
'     , e.NMBRE_TRCRO PRYCTO',
'  from mc_g_desembargos_oficio a',
'  join mc_g_desembargos_resolucion b on a.id_dsmbrgos_rslcion = b.id_dsmbrgos_rslcion',
'  left join v_df_c_funcionarios   c on b.id_fncnrio = c.id_fncnrio',
'  join gn_g_actos d on d.id_acto = a.id_acto',
'join v_sg_g_usuarios e on e.id_usrio = d.id_usrio',
' where a.id_dsmbrgo_ofcio = json_value(:P2_XML, ''$.id_dsmbrgo_ofcio'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(106825456431717974)
,p_shared_query_id=>wwv_flow_api.id(106819890834705993)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select (select case',
'            when json_value(:P2_XML, ''$.vlor_cnfgrcion'') = ''G'' then    ',
'                (',
'                select ',
'                    LISTAGG(b.dscrpcion, '', '') as dscrpcion',
'                from (select ',
'                            distinct a.dscrpcion',
'                        from mc_d_entidades a join mc_d_entidades_tipo_embargo b ',
'                    on a.id_entddes = b.id_entddes',
'            where a.cdgo_entdad_tpo = ''FN''',
'                and b.cdgo_clnte = :F_CDGO_CLNTE',
'                and a.actvo = ''S'') b',
'                )',
'                else',
'                    (select ',
'                         ---   distinct c.dscrpcion',
'                      LISTAGG( DISTINCT c.dscrpcion, '', '') as dscrpcion',
'                        from ',
'                            mc_g_desembargos_oficio a join mc_g_solicitudes_y_oficios b on a.id_slctd_ofcio = b.id_slctd_ofcio',
'                            join mc_d_entidades c on b.id_entddes = c.id_entddes',
'                    --    where a.id_slctd_ofcio = json_value(:P2_XML, ''$.id_slctd_ofcio'')',
'                    )',
'                end',
'from dual) as entidad,',
'       a.drccion as direccion_entidad,',
'       a.contacto_entidad,',
'       a.nmro_rslcion_emb as resolucion_embargo,',
'     --  to_char(a.fcha_rslcion_emb,''dd/mm/yyyy'') as fecha_resolucion,',
'       pkg_gn_generalidades.fnc_cl_fecha_texto(a.fcha_rslcion_emb) as fecha_resolucion,',
'       --a.rspnsble',
'      REPLACE(a.rspnsble, ''  .'','''') as nombre_responsable,',
'       a.idntfccion as id_responsable,',
'       a.nmtcnco_idntfccion_tpo as tipo_id_responsable,',
'       a.nmro_acto_ofcio as nmro_embrgo_ofcio,',
'      pkg_gn_generalidades.fnc_cl_fecha_texto(a.fcha_ofcio)as fcha_embrgo_ofcio,',
'     -- to_char(a.fcha_ofcio,''dd/mm/yyyy'') as fcha_embrgo_ofcio,',
'      d.nmro_acto  as rslcion_dsmbrgo,',
'        pkg_gn_generalidades.fnc_cl_fecha_texto(d.fcha_acto)as fcha_dsmbrgo',
'    --   to_char(d.fcha_acto,''dd/mm/yyyy'') as fcha_dsmbrgo',
'      ',
'   from v_mc_g_solicitudes_y_oficios a',
'   left join v_mc_g_embargos_bienes b on b.id_slctd_ofcio = a.id_slctd_ofcio',
'   join v_mc_g_embargos_resolucion c on a.id_embrgos_crtra = c.id_embrgos_crtra ',
'   join v_mc_g_desembargos_resolucion d on d.id_instncia_fljo = c.id_instncia_fljo',
'  where a.id_slctd_ofcio = json_value(:P2_XML, ''$.id_slctd_ofcio'')',
'   and NVL(a.dsmbrgdo,''N'') = ''N'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(106825675898717974)
,p_shared_query_id=>wwv_flow_api.id(106819890834705993)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select	distinct a.nmro_acto as nmro_dsmbrgo',
'      , pkg_gn_generalidades.fnc_cl_fecha_texto(a.fcha_acto)as fcha_dsmbrgo',
'      ,	a.idntfccion as idntfccion_sjto',
'      ,  listagg(REPLACE(g.nmbre_cmplto, ''  .'','''')||'' identificado con ''||g.nmtcnco_idntfccion_tpo||'' No. ''|| trim(g.idntfccion),'', '') within group (order by g.nmbre_cmplto||'' Identificado con ''||g.nmtcnco_idntfccion_tpo||'' No.''|| trim(g.idntfccion))'
||' as responsables_no',
'      ,	d.vlor_mdda_ctlar',
'from v_mc_g_desembargos_resolucion 	a',
'left join mc_g_lotes_mdda_ctlar			b ',
'    on a.id_lte_mdda_ctlar   = b.id_lte_mdda_ctlar',
'left join mc_g_desembargos_cartera		c',
'    on a.id_dsmbrgos_rslcion = c.id_dsmbrgos_rslcion',
'left join mc_g_embargos_cartera			d',
'    on c.id_embrgos_crtra	   = d.id_embrgos_crtra',
'left join mc_g_embrgos_crt_prc_jrd	e',
'    on d.id_embrgos_crtra	   = e.id_embrgos_crtra',
'left join cb_g_procesos_juridico			f',
'    on e.id_prcsos_jrdco	   = f.id_prcsos_jrdco',
'left join v_mc_g_embargos_responsable		g',
'    on d.id_embrgos_crtra	   = g.id_embrgos_crtra and NVL(g.dsmbrgdo,''N'') = ''N'' ',
'where d.id_tpos_mdda_ctlar = json_value(:P2_XML, ''$.id_tpos_mdda_ctlar'')',
'and a.id_dsmbrgos_rslcion in  (select id_dsmbrgos_rslcion',
'          from (select level,',
'                       (regexp_substr((select json_value(:P2_XML,',
'                                                        ''$.id_dsmbrgos_rslcion.id_dsmbrgos_rslcion'')',
'                                        from dual),',
'                                      ''[^,]+'',',
'                                      1,',
'                                      level)) as id_dsmbrgos_rslcion',
'                  from dual',
'                connect by level <= regexp_count((select json_value(:P2_XML,',
'                                                                   ''$.id_dsmbrgos_rslcion.id_dsmbrgos_rslcion'')',
'                                                   from dual),',
'                                                 '','') + 1',
'                       and prior sys_guid() is not null))',
'--and trunc(a.fcha_acto) = trunc(sysdate)',
'GROUP BY a.nmro_acto, a.fcha_acto, f.nmro_prcso_jrdco, a.idntfccion, d.vlor_mdda_ctlar',
'order by a.nmro_acto;',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(106825806560717974)
,p_shared_query_id=>wwv_flow_api.id(106819890834705993)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as dscrpcion_mdda_ctlar',
'from mc_d_tipos_mdda_ctlar',
'where id_tpos_mdda_ctlar = json_value(:P2_XML, ''$.id_tpos_mdda_ctlar'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(106826020735717974)
,p_shared_query_id=>wwv_flow_api.id(106819890834705993)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('select listagg(REPLACE(b.nmbre_cmplto, ''  .'','''') || '' con identificaci\00F3n Nro. '' || trim(b.idntfccion) || '', '') '),
'within group (order by b.nmbre_cmplto || '' con identificaci&oacute;n Nro.'' || trim(b.idntfccion)) as responsables',
'from genesys.mc_g_embrgs_rslcion_rspnsbl a',
'join genesys.v_mc_g_embargos_responsable b on a.id_embrgos_rspnsble = b.id_embrgos_rspnsble',
'join genesys.mc_g_embargos_resolucion c on a.id_embrgos_rslcion = c.id_embrgos_rslcion',
'where b.id_dsmbrgos_rslcion = json_value(:P2_XML, ''$.id_dsmbrgos_rslcion.id_dsmbrgos_rslcion'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(106826267628717974)
,p_shared_query_id=>wwv_flow_api.id(106819890834705993)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(s.nmro_acto_ofcio)as nmro_embrgo_ofcio,',
'             pkg_gn_generalidades.fnc_cl_fecha_texto(max(s.fcha_ofcio))as fcha_embrgo_ofcio',
'             from v_mc_g_solicitudes_y_oficios s ',
'                 join mc_g_embargos_resolucion d',
'                 on s.id_embrgos_crtra = d.id_embrgos_crtra ',
'             where s.id_slctd_ofcio = json_value(:P2_XML, ''$.id_slctd_ofcio'')'))
);
end;
/
