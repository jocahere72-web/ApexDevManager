prompt --application/shared_components/reports/report_queries/gf_g_registro_ajuste
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(72498604048147362)
,p_name=>'gf_g_registro_ajuste'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--consulta para mostrar el encabezado del reporte(nombre del cliente, slogan , oficina)',
'select a.cdgo_clnte, upper(a.nmbre_clnte)nmbre_clnte, upper(a.slgan)slgan, a.id_ofcna, b.nmbre_ofcna ',
'from df_s_clientes a left join df_c_oficinas b on a.id_ofcna = b.id_ofcna',
'where  a.cdgo_clnte = :F_CDGO_CLNTE',
''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_registro_ajuste'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28478092989455095)
,p_shared_query_id=>wwv_flow_api.id(72498604048147362)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Nombre del Impuesto y el nombre del usuario que elaboro el reporte.',
'select upper(NMBRE_IMPSTO)nmbre_impsto, initcap(:F_NMBRE_USRIO)nmbre_usrio ',
'from df_c_impuestos ',
'where cdgo_clnte =:F_CDGO_CLNTE and id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_impuesto'' );   '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28478250923455095)
,p_shared_query_id=>wwv_flow_api.id(72498604048147362)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--mustra la caracteristicas del Ajuste.',
'select 	upper(a.NMBRE_IMPSTO)nmbre_impsto,',
'		a.id_ajste,',
'		a.numro_ajste,',
'		a.fcha,',
'		initcap(b.dscrpcion_tpo_ajste) tpo_ajste,',
'		initcap(a.dscrpcion_motivo) dscrpcion_motivo,',
'		to_char(b.vlor_ajste, :F_FRMTO_MNDA) vlor_ajste,',
'		initcap(nmbre_rzon_scial) prptrio_prcpal,',
'		pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => a.idntfccion_sjto, p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) idntfccion_sjto,',
'		--a.idntfccion_sjto,',
'		initcap(a.drccion) drccion,',
'		a.obsrvcion,',
'		b.vgncia,',
'		--SUBSTR(b.dscrpcion_periodo,9) dscrpcion_periodo,',
'		b.dscrpcion_periodo dscrpcion_periodo,',
'		initcap(b.dscrpcion_concepto) dscrpcion_concepto,',
'		to_char(b.sldo_cptal, :F_FRMTO_MNDA) sldo_cptal,',
'		--b.saldo_total ',
'		--to_char(b.saldo_total, ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') saldo_total,',
'		nvl(b.fcha_pryccion_intres,a.fcha) fcha_pryccion_intres,',
'		to_char(b.intres_cptal_mrtrio, :F_FRMTO_MNDA) intres_cptal_mrtrio,',
'		to_char(b.intres_ajste_mrtrio, :F_FRMTO_MNDA) intres_ajste_mrtrio',
'		--to_char((b.intres_cptal_pryctdo - b.intres_ajste_pryctdo), ''999G999G999'',''NLS_NUMERIC_CHARACTERS = '''',.'''''') ttl_intres',
'from 	v_gf_g_ajustes 				a ',
'join 	v_gf_g_ajuste_detalle 		b on a.id_ajste = b.id_ajste',
'join 	v_si_i_sujetos_responsable 	c on a.id_sjto_impsto = c.id_sjto_impsto and c.prncpal_s_n = ''S''',
'where   a.cdgo_clnte =:F_CDGO_CLNTE  and a.id_ajste = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_ajuste'' )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28478464061455095)
,p_shared_query_id=>wwv_flow_api.id(72498604048147362)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- Consulta que retorna el logo del cliente',
'/* select pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan, ',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';*/',
'    ',
'',
'select a.cdgo_clnte,',
'       upper(a.nmbre_clnte)nmbre_clnte,',
'       upper(a.slgan)slgan,',
'       a.id_ofcna,',
'       a.nmbre_ofcna,       ',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => b.file_blob ) as lgo_slgan, ',
'       b.file_mimetype,       ',
'       c.nmbre_trcro as nombre_usuario,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr ',
'from   v_df_s_clientes                        a',
'join   df_c_imagenes_cliente                  b on a.cdgo_clnte = b.cdgo_clnte and b.cdgo_imgen_clnte = ''L_E''',
'join   v_si_c_terceros                        c on a.cdgo_clnte = c.cdgo_clnte and c.idntfccion = coalesce( sys_context(''APEX$SESSION'',''app_user''), regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*''), sys_context(''userenv'',''session_use'
||'r'') ) ',
'where  a.cdgo_clnte = :F_CDGO_CLNTE   '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28478654564455095)
,p_shared_query_id=>wwv_flow_api.id(72498604048147362)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--consulta para mostrar el total del ajuste ',
'select  to_char(a.vlor, :F_FRMTO_MNDA) total_ajuste,',
'		to_char(nvl(a.vlor_intres,0), :F_FRMTO_MNDA) vlor_intres,',
'		to_char(a.vlor + nvl(a.vlor_intres,0), :F_FRMTO_MNDA) valor_total',
'from 	gf_g_ajustes 			a ',
'join 	v_gf_g_ajuste_detalle 	b on a.id_ajste = b.id_ajste ',
'where 	a.cdgo_clnte = :F_CDGO_CLNTE ',
'and 	a.id_ajste = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_ajuste'' )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28478842991455095)
,p_shared_query_id=>wwv_flow_api.id(72498604048147362)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'		a.id_instncia_fljo,',
'		a.id_usrio,',
'		c.nmbre_trcro,',
'		a.id_fljo_trea_orgen,',
'		a.fcha_incio,',
'		b.nmbre_trea  ',
'		from wf_g_instancias_transicion 	a',
'		join v_wf_d_flujos_tarea			b	on a.id_fljo_trea_orgen		= b.id_fljo_trea',
'		join v_sg_g_usuarios				c	on a.id_usrio				= c.id_usrio',
'        where ',
'        --a.id_instncia_fljo=:P104_ID_INSTNCIA_FLJO',
'		a.id_instncia_fljo = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P104_ID_INSTNCIA_FLJO'' )',
'        order by fcha_incio'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(28479039983455095)
,p_shared_query_id=>wwv_flow_api.id(72498604048147362)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Usuario Firma Reporte',
'select a.id_instncia_trnscion,',
'       c.nmbre_trcro          as usrio_frma,',
'       a.id_fljo_trea_orgen   id_fljo_trea_orgen_2',
'  from wf_g_instancias_transicion a',
'  join v_wf_d_flujos_tarea b',
'    on a.id_fljo_trea_orgen = b.id_fljo_trea',
'  join v_sg_g_usuarios c',
'    on a.id_usrio = c.id_usrio',
' where a.id_instncia_fljo =',
'       pkg_gn_generalidades.fnc_ca_extract_value(p_xml  => :P2_XML,',
'                                                 p_nodo => ''P104_ID_INSTNCIA_FLJO'')',
'   and a.id_instncia_trnscion =',
'       (select max(d.id_instncia_trnscion)',
'          from wf_g_instancias_transicion d',
'         where d.id_instncia_fljo =',
'               pkg_gn_generalidades.fnc_ca_extract_value(p_xml  => :P2_XML,',
'                                                         p_nodo => ''P104_ID_INSTNCIA_FLJO''))                         '))
);
end;
/
