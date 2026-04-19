prompt --application/shared_components/reports/report_queries/reporte_determinación
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(34784977823776117)
,p_name=>unistr('Reporte Determinaci\00F3n')
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--consulta para mostrar el encabezado del reporte(nombre del cliente, slogan , oficina)',
'select a.cdgo_clnte, upper(a.nmbre_clnte)nmbre_clnte, upper(a.slgan)slgan, a.id_ofcna, b.nmbre_ofcna ',
'from df_s_clientes a left join df_c_oficinas b on a.id_ofcna = b.id_ofcna',
'where  a.cdgo_clnte = :F_CDGO_CLNTE'))
,p_report_layout_id=>wwv_flow_api.id(105687932065655420)
,p_format=>'PDF'
,p_output_file_name=>unistr('Reporte Determinaci\00F3n')
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(105702678867708177)
,p_shared_query_id=>wwv_flow_api.id(34784977823776117)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Reemplazar el 4 por :ID_DTRMNCION item de la pagina desde donde se va a imprimir el informe',
'select  ',
'        row_number() over(partition by a.id_dtrmncion order by b.cdgo_clnte) numeracion_registros,',
'        a.id_dtrmncion,',
'		b.cdgo_clnte,',
'        upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        b.id_ofcna, ',
'        b.nmbre_ofcna, ',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.file_blob ) as lgo_slgan,',
'        c.file_mimetype,',
'        upper(d.nmbre_impsto)nmbre_impsto,',
'        to_char(a.fcha_dtrmncion, ''dd/mm/yyyy'') fecha,',
'        n.rspnsble_nombre responsables,',
'        n.tipoidentificacion identificaciones_tipo,',
'        pkg_gn_generalidades.fnc_cl_formato_texto(p_txto => e.idntfccion_sjto , p_frmto => ''xx-xx-xxxx-xxxx-xxx'' , p_crcter_dlmtdor => ''-'' ) referencia_catastral, ',
'        e.drccion,',
'        e.drccion_ntfccion,',
'        (f.area_trrno|| '' '' || ''mts2'') area_trrno,',
'        (f.area_cnstrda|| '' '' || ''mts2'') area_cnstrda,',
'        nvl2(f.mtrcla_inmblria,upper(f.mtrcla_inmblria),''no definido'') mtrcla_inmblria,',
'        nvl2(f.dscrpcion_prdo_dstno,upper(f.dscrpcion_prdo_dstno),''no definido'') destino,',
'        nvl2(f.dscrpcion_estrto,upper(f.dscrpcion_estrto),''no definido'') dscrpcion_estrto,',
'        nvl2(f.dscrpcion_prdio_clsfccion,upper(f.dscrpcion_prdio_clsfccion),''no definido'') clasificacion,',
'        m.vgncia_dscrpcion vigencia_concepto,',
'        to_char(m.avluo,''999,999,999,999,999'') avaluos,',
'        m.trfa tarifas,',
'        to_char(m.vlor_cptal,''999,999,999,999,999'') saldo_capital,',
'        to_char(m.vlor_intres,''999,999,999,999,999'') saldo_interes,',
'      	to_char(m.saldo_total,''999,999,999,999,999'') saldo_total,',
'        to_char((select sum(vlor_cptal) vlor_dueda_cptal from table(pkg_gi_determinacion.fnc_co_dtrmncn_dtos_dtlle(a.id_dtrmncion))),''999,999,999,999,999'') vlor_dueda_cptal,',
'        to_char((select sum(vlor_intres) vlor_dueda_cptal from table(pkg_gi_determinacion.fnc_co_dtrmncn_dtos_dtlle(a.id_dtrmncion))),''999,999,999,999,999'') vlor_dueda_intres,',
'        to_char((select sum(saldo_total) vlor_dueda_cptal from table(pkg_gi_determinacion.fnc_co_dtrmncn_dtos_dtlle(a.id_dtrmncion))),''999,999,999,999,999'') vlor_ttal_pgar,',
'        upper(h.nmbre_trcro) fncnrio_frma,',
'        h.nmbre_crgo crgo_fncnrio_frma,',
'        to_char(i.fcha_vncmnto, ''dd/mm/yyyy'') fcha_vncmnto,',
'        upper(''HASTA''|| '' '' || to_char (i.fcha_vncmnto,''DD "de" Month "de" YYYY'')) fcha_vncmnto_hasta,',
'        i.nmro_dcmnto liquidacion_factura,',
'        pkgbarcode.funcadfac(null,null, null, i.nmro_dcmnto,i.vlor_ttal, i.fcha_vncmnto, d.cdgo_ean, ''S'') txto_cdgo_brra,',
'        pkgbarcode.fungencod(''EANUCC128'',pkgbarcode.funcadfac(null,null, null, i.nmro_dcmnto,i.vlor_ttal, i.fcha_vncmnto, d.cdgo_ean, ''N'' ) )cdgo_brra',
'      ',
'        ',
'             ',
'       ',
'from    gi_g_determinaciones                                                    a  ',
'        join v_df_s_clientes                                                    b on a.cdgo_clnte = b.cdgo_clnte',
'        join df_c_imagenes_cliente                                              c on a.cdgo_clnte = c.cdgo_clnte and c.cdgo_imgen_clnte = ''L_E''',
'        join v_df_i_impuestos_subimpuesto                                       d on a.cdgo_clnte = d.cdgo_clnte  and a.id_impsto = d.id_impsto',
'        --join df_c_impuestos                                                     d on a.cdgo_clnte = d.cdgo_clnte  and a.id_impsto = d.id_impsto       ',
'        join v_si_i_sujetos_impuesto                                            e on a.id_sjto_impsto = e.id_sjto_impsto ',
'        --join v_si_i_predios                                                     f on f.id_sjto = e.id_sjto     ',
'        join v_si_i_predios                                                     f on f.id_sjto_impsto = e.id_sjto_impsto   ',
'        left join v_df_c_funcionarios                                           h on h.cdgo_clnte = a.cdgo_clnte and h.id_fncnrio = a.id_fncnrio_frma ',
'        join re_g_documentos                                               i on a.id_dcmnto = i.id_dcmnto',
'        join table ( pkg_gi_determinacion.fnc_co_dtrmncn_rspbl_nmbr_tpid(a.id_dtrmncion))    n on n.rspnsble_nombre  = n.rspnsble_nombre',
'        join table ( pkg_gi_determinacion.fnc_co_dtrmncn_dtos_dtlle(a.id_dtrmncion))       m on m.vgncia_dscrpcion  = m.vgncia_dscrpcion',
'       ',
'        ',
'where  a.ID_DTRMNCION_LTE = 7;'))
);
end;
/
