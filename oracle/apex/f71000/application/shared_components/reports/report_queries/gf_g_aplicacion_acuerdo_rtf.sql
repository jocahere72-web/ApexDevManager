prompt --application/shared_components/reports/report_queries/gf_g_aplicacion_acuerdo_rtf
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(14808048061980697)
,p_name=>'gf_g_aplicacion_acuerdo_RTF'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Datos generales acto apli',
'	select initcap(a.nmbre_slctnte) nmbre_apdrdo,',
'		   a.nmro_cnvnio,       ',
'		   a.nmro_idntfccion_slctnte nmro_idntfccion_apdrdo,',
'		   a.idntfccion_sjto_frmtda idntfccion_sjto,',
'		   a.drccion_ntfccion, ',
'		   a.nmro_acto,',
'		   a.nmbre_impsto_sbmpsto,',
'		   initcap(e.prmer_nmbre) nmbre_cntrbynte,',
'		   e.idntfccion idntfccion_cntrbynte,',
'		   initcap(d.dscrpcion) dscrpcion_dcrto,      ',
'		   initcap(to_char(a.fcha_prmra_cta, ''FMMONTH DD "de" YYYY '')) fcha_prmra_cta,',
unistr('		   decode(a.dscrpcion_prdcdad_cta, ''Anual'', ''A\00F1os'',''Mensual'', ''Meses'',''Bimensual'','),
'										   ''Bimestre'',''Trimensual'', ''Trimestre'', ''Cuatrimestral'', ''Cuatrimestre'',',
'										   ''Semestral'', ''Semestre'') dscrpcion_prdcdad_cta,       ',
'		   ''$'' ||trim(to_char(nvl(a.vlor_cta_incial,0),''999G999G999G999G999G999G990'')) vlor_cta_incial,',
'		   initcap(pkg_gn_generalidades.fnc_number_to_text(trunc(nvl(a.vlor_cta_incial,0)), ''d'')) vlor_cta_ini_ltras,',
'		   initcap(h.nmbre_bnco) nmbre_bnco_mdio_pgo,',
'		   initcap(to_char(g.fcha_rcdo, ''FMMONTH DD "de" YYYY '')) fcha_rcdo,',
'		   a.nmro_cta,',
'		   initcap(b.nmbre_clnte) nmbre_clnte, ',
'		   pkg_gf_convenios.fnc_cl_slct_crtra_vgncia_acrdo (p_cdgo_clnte => a.cdgo_clnte,',
'															p_id_cnvnio  => a.id_cnvnio) crtra_vgncia ,',
'		   (select to_char(sum(b.vlor_ttal_dcmnto),''FM$999G999G999G999G999G999G990'') as vlor_ttal                                    ',
'								   from gf_g_cnvnios_cta_incl_vgnc      a',
'								   join re_g_documentos                 b on a.id_dcmnto        = b.id_dcmnto',
'								  where a.id_cnvnio = :P54_ID_CNVNIO ) as vlor_ttal_cta_incal',
'	 from v_gf_g_convenios           a',
'	 join df_s_clientes              b on a.cdgo_clnte           =b.cdgo_clnte   ',
'	 join v_gf_d_convenios_tipo      c on a.id_cnvnio_tpo        = c.id_cnvnio_tpo',
'	left join df_c_decretos              d on c.id_dcrto             = d.id_dcrto',
'	 join si_i_sujetos_responsable   e on e.id_sjto_impsto       = a.id_sjto_impsto',
'	left join v_re_g_recaudos            g on a.id_dcmnto_cta_incial = g.id_orgen',
'	left join v_re_g_recaudos_control    h on g.id_rcdo_cntrol       = h.id_rcdo_cntrol',
'	where a.cdgo_clnte = :F_CDGO_CLNTE',
'	  and a.id_cnvnio =  :P54_ID_CNVNIO'))
,p_report_layout_id=>wwv_flow_api.id(14978590577199944)
,p_format=>'PDF'
,p_output_file_name=>'gf_g_aplicacion_acuerdo_RTF'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14979896149200803)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Datos generales acto apli',
'	select initcap(a.nmbre_slctnte) nmbre_apdrdo,',
'		   a.nmro_cnvnio,       ',
'		   a.nmro_idntfccion_slctnte nmro_idntfccion_apdrdo,',
'		   a.idntfccion_sjto_frmtda idntfccion_sjto,',
'		   a.drccion_ntfccion, ',
'		   a.nmro_acto,',
'		   a.nmbre_impsto_sbmpsto,',
'		   initcap(e.prmer_nmbre) nmbre_cntrbynte,',
'		   e.idntfccion idntfccion_cntrbynte,',
'		   initcap(d.dscrpcion) dscrpcion_dcrto,      ',
'		   initcap(to_char(a.fcha_slctud, ''FMMONTH DD "de" YYYY '')) fcha_prmra_cta,',
unistr('		   decode(a.dscrpcion_prdcdad_cta, ''Anual'', ''A\00F1os'',''Mensual'', ''Meses'',''Bimensual'','),
'										   ''Bimestre'',''Trimensual'', ''Trimestre'', ''Cuatrimestral'', ''Cuatrimestre'',',
'										   ''Semestral'', ''Semestre'') dscrpcion_prdcdad_cta,       ',
'		   ''$'' ||trim(to_char(nvl(a.vlor_cta_incial,0),''999G999G999G999G999G999G990'')) vlor_cta_incial,',
'		   initcap(pkg_gn_generalidades.fnc_number_to_text(trunc(nvl(a.vlor_cta_incial,0)), ''d'')) vlor_cta_ini_ltras,',
'		   initcap(h.nmbre_bnco) nmbre_bnco_mdio_pgo,',
'		   initcap(to_char(g.fcha_rcdo, ''FMMONTH DD "de" YYYY '')) fcha_rcdo,',
'		   a.nmro_cta,',
'		   initcap(b.nmbre_clnte) nmbre_clnte, ',
'		   pkg_gf_convenios.fnc_cl_slct_crtra_vgncia_acrdo (p_cdgo_clnte => a.cdgo_clnte,',
'															p_id_cnvnio  => a.id_cnvnio) crtra_vgncia ,',
'		   (select to_char(sum(b.vlor_ttal_dcmnto),''FM$999G999G999G999G999G999G990'') as vlor_ttal                                    ',
'								   from gf_g_cnvnios_cta_incl_vgnc      a',
'								   join re_g_documentos                 b on a.id_dcmnto        = b.id_dcmnto',
'								  where a.id_cnvnio = :P54_ID_CNVNIO ) as vlor_ttal_cta_incal',
'	 from v_gf_g_convenios           a',
'	 join df_s_clientes              b on a.cdgo_clnte           =b.cdgo_clnte   ',
'	 join v_gf_d_convenios_tipo      c on a.id_cnvnio_tpo        = c.id_cnvnio_tpo',
'	left join df_c_decretos              d on c.id_dcrto             = d.id_dcrto',
'	 join si_i_sujetos_responsable   e on e.id_sjto_impsto       = a.id_sjto_impsto',
'	left join v_re_g_recaudos            g on a.id_dcmnto_cta_incial = g.id_orgen',
'	left join v_re_g_recaudos_control    h on g.id_rcdo_cntrol       = h.id_rcdo_cntrol',
'	where a.cdgo_clnte = :F_CDGO_CLNTE',
'	  and a.id_cnvnio =  :P54_ID_CNVNIO'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14980000175200803)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Vigencias Acuerdos de Pag',
'	select listagg(vgncia, '', '') within group (order by vgncia) vgncia',
'	   from (',
'			   SELECT vgncia',
'				 FROM v_gf_g_convenios_cartera a',
'				 join v_gf_g_convenios         b   on   a.id_cnvnio=b.id_cnvnio',
'				where b.cdgo_clnte = :F_CDGO_CLNTE',
'				  and b.id_cnvnio  = :P54_ID_CNVNIO',
'				 group by vgncia',
'			 )  '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14980260464200803)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3. Garantias Acuerdo Pago',
'select initcap(listagg(b.dscrpcion, '', '') within group (order by b.dscrpcion)) dscrpcion',
'  from gf_g_convenios a',
'  join gf_g_convenios_garantia b',
'    on a.id_cnvnio = b.id_cnvnio',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_cnvnio  = :P54_ID_CNVNIO '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14980405116200803)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--4. Cuota Inicial',
'select pkg_gf_convenios.fnc_co_cuota_in(p_id_cnvnio => :P54_ID_CNVNIO) as cuota_inicial',
'   from dual   ',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14980615810200804)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--5. Plan de Pago',
'  select nmro_cta,',
'         to_char(vlor_ttal,:F_FRMTO_MNDA) as vlor_ttal,',
'         fcha_vncmnto',
'    from v_gf_g_convenios_extracto ',
'   where cdgo_clnte = :F_CDGO_CLNTE',
'     and id_cnvnio  = :P54_ID_CNVNIO',
'     and actvo = ''S''',
'   order by nmro_cta'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14980837218200804)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--6. Encabezado ',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        b.nmro_idntfccion nmro_idntfccion,',
'        b.nmbre_dprtmnto',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14981090505200804)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--7. Carteras Convenidas',
'select a.dscrpcion,',
'       a.vgncia ||''-''||a.prdo prdo,',
'       to_char(a.vlor_cptal,:F_FRMTO_MNDA)  as vlor_cptal,',
'       to_char(a.vlor_intres,:F_FRMTO_MNDA) as vlor_intres,',
'       to_char(a.vlor_ttal,:F_FRMTO_MNDA)   as vlor_ttal',
'  from v_gf_g_convenios_cartera a',
' where id_cnvnio =  :P54_ID_CNVNIO'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14981219823200804)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--8. Documentos Cuota Inicial',
' select a.id_cnvnio,',
'        a.id_dcmnto,',
'        b.nmro_dcmnto,',
'        to_char(b.vlor_ttal_dcmnto,:F_FRMTO_MNDA) as vlor_ttal_dcmnto,',
'        initcap(pkg_gn_generalidades.fnc_number_to_text(trunc(nvl(b.vlor_ttal_dcmnto,0)), ''d'')) vlor_cta_ini_ltras,',
'        initcap(d.nmbre_bnco) nmbre_bnco_mdio_pgo,',
'        initcap(to_char(c.fcha_rcdo, ''FMMONTH DD "de" YYYY '')) fcha_rcdo',
'   from gf_g_cnvnios_cta_incl_vgnc      a',
'   join re_g_documentos                 b on a.id_dcmnto        = b.id_dcmnto',
'   left join v_re_g_recaudos            c on a.id_dcmnto        = c.id_orgen',
'   left join v_re_g_recaudos_control    d on d.id_rcdo_cntrol   = c.id_rcdo_cntrol',
'  where a.id_cnvnio = :P54_ID_CNVNIO'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14981433567200804)
,p_shared_query_id=>wwv_flow_api.id(14808048061980697)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Obtener el funcionario Firma del Acto',
'select c.nmbre_trcro, d.nmbre_ofcna, e.nmbre_crgo',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios c on a.id_fncnrio = c.id_fncnrio',
'  join df_c_oficinas d on c.id_ofcna = d.id_ofcna',
'  join df_c_cargos e on c.id_crgo = e.id_crgo',
' where b.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.cdgo_acto_tpo = ''AAA'''))
);
end;
/
