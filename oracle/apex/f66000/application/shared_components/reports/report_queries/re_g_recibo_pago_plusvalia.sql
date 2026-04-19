prompt --application/shared_components/reports/report_queries/re_g_recibo_pago_plusvalia
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(90968820294311197)
,p_name=>'re_g_recibo_pago_plusvalia'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'       id_plsvlia_dtlle	',
'       , mtrcla_inmblria	                              ',
'       , cdgo_prdial			',
'       , prptrio				',
'       , drccion			',
'       , area		 	',
'       , area_objto		',
'       , cmna			',
'       , hcho_gnrdor   							',
'       , case when vlor_p2 > vlor_p1 then',
'                 trim(to_char(( vlor_p2 - vlor_p1 ), ''999G999G999G999G999G999'')) ',
'            else  ',
'                 trim(to_char(( vlor_p1 - vlor_p2 ), ''999G999G999G999G999G999''))   ',
'         end myor_vlor_mt2		',
'       , case when vlor_p2 > vlor_p1 then',
'                  trim(to_char(( vlor_p2 - vlor_p1 )*0.35, ''999G999G999G999G999G999''))  ',
'            else  ',
'                  trim(to_char(( vlor_p1 - vlor_p2 )*0.35, ''999G999G999G999G999G999'')) ',
'         end mnto_prtcpcion_mt2			',
'       , trim(to_char(vlor_ttal_plsvlia, ''999G999G999G999G999G999''))    vlor_plsvlia 	',
'       , trim(to_char(vlor_plsvlia_actlzda, ''999G999G999G999G999G999'')) vlor_actlzdo ',
'       , id_dcmnto',
'       , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => d.file_blob ) as lgo_slgan',
' from gi_g_plusvalia_procso_dtlle a',
' join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia  = b.id_prcso_plsvlia',
' join df_c_imagenes_cliente       d on b.cdgo_clnte        = d.cdgo_clnte',
'  and d.cdgo_imgen_clnte          = ''L_E''    ',
'where a.id_plsvlia_dtlle            = :P2_PRMTRO_1'))
,p_format=>'PDF'
,p_output_file_name=>'re_g_recibo_pago_plusvalia'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(128350449613917238)
,p_shared_query_id=>wwv_flow_api.id(90968820294311197)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'       a.id_plsvlia_dtlle	',
'       , a.mtrcla_inmblria	                              ',
'       , a.cdgo_prdial			',
'       , a.prptrio				',
'       , a.drccion			',
'       , a.area		 	',
'       , a.area_objto		',
'       , a.cmna			',
'       , a.hcho_gnrdor     ',
'       , trim(to_char(a.vlor_p1, :F_FRMTO_MNDA)) v_p1',
'       , trim(to_char(a.vlor_p2, :F_FRMTO_MNDA)) v_p2',
'       , case when a.vlor_p2 > a.vlor_p1 then',
'                 trim(to_char(( a.vlor_p2 - a.vlor_p1 ), :F_FRMTO_MNDA)) ',
'            else  ',
'                 trim(to_char(( a.vlor_p1 - a.vlor_p2 ), :F_FRMTO_MNDA))   ',
'         end myor_vlor_mt2		',
'       , case when vlor_p2 > vlor_p1 then',
'                  trim(to_char(( a.vlor_p2 - a.vlor_p1 )*0.35, :F_FRMTO_MNDA))  ',
'            else  ',
'                  trim(to_char(( a.vlor_p1 - a.vlor_p2 )*0.35, :F_FRMTO_MNDA)) ',
'         end mnto_prtcpcion_mt2			',
'       , trim(to_char(a.vlor_ttal_plsvlia, :F_FRMTO_MNDA))    vlor_plsvlia 	',
'       , trim(to_char(a.vlor_plsvlia_actlzda, :F_FRMTO_MNDA)) vlor_actlzdo ',
'       , a.id_dcmnto',
'       , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => d.file_blob ) as lgo_slgan',
'       , c.nmro_idntfccion',
'       , ( select ( select LISTAGG(nmbre_bnco, '','') WITHIN GROUP (ORDER BY nmbre_bnco)',
'                      from df_c_bancos where id_bnco in ( select cdna ',
'                                                            from table ( pkg_gn_generalidades.fnc_ca_split_table ( p_cdna => c.bnco_rcddor, ',
'                                                                                                                   p_crcter_dlmtdor => '':''  ) ) )  )',
'             from gi_d_plusvalia_configurcion c )  as bncos_rcddres',
'       , to_char(systimestamp, ''DD/MM/YYYY'') HOY',
'       , :F_IP as ipaddr',
'       , nvl((:F_NMBRE_USRIO),''PORTAL WEB'')  as Usuario',
'       , to_char(sysdate, ''YYYY'') fcha_plsvlia_actlzda',
'       , upper(c.nmbre_clnte) nmbre_clnte',
'       , (select trim(APEX_WEB_SERVICE.BLOB2CLOBBASE64(f_bmp2jpg',
'    (zt_qr.f_qr_as_bmp(''https://monteria.taxationsmart.co/ords/f?p=150000:2025034:::NO::P2025034_ID_ORGEN:''||a.id_dcmnto, ''M'', ''N'')',
'                                 )))',
'                                     as QR ',
'from dual where pkg_gn_generalidades.fnc_vl_pago_pse(b.cdgo_clnte,b.id_impsto,b.id_impsto_sbmpsto)  = ''S'') as QR',
' from gi_g_plusvalia_procso_dtlle a',
' join gi_g_plusvalia_proceso      b on a.id_prcso_plsvlia  = b.id_prcso_plsvlia',
' join df_c_imagenes_cliente       d on b.cdgo_clnte        = d.cdgo_clnte',
'                                       and d.cdgo_imgen_clnte          = ''L_E''   ',
' join df_s_clientes               c on b.cdgo_clnte        = c.cdgo_clnte ',
'where a.id_plsvlia_dtlle            = :P2_PRMTRO_1'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(128350619295917238)
,p_shared_query_id=>wwv_flow_api.id(90968820294311197)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select trunc(a.fcha_vncmnto) fcha_vncmnto_dcmnto',
'    , a.nmro_dcmnto',
'    , to_char(a.vlor_ttal_dcmnto, :F_FRMTO_MNDA) vlor_ttal_dcmnto',
'    , pkgbarcode.funcadfac(null,null, null, a.nmro_dcmnto, a.vlor_ttal_dcmnto, a.fcha_vncmnto, b.cdgo_ean, ''S'') txto_cdgo_brra',
'    , pkgbarcode.fungencod(''EANUCC128'',pkgbarcode.funcadfac(null,null, null, a.nmro_dcmnto, a.vlor_ttal_dcmnto, a.fcha_vncmnto, b.cdgo_ean, ''N'' ) )cdgo_brra',
'    , c.txto_trfa',
'    , to_char(c.vlor_plsvlia_ipc, :F_FRMTO_MNDA) vlor_plsvlia_ipc',
'from re_g_documentos a',
'join df_i_impuestos_subimpuesto b on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto',
'join gi_g_plusvalia_procso_dtlle c on a.id_dcmnto = c.id_dcmnto',
'--join gi_g_liquidaciones_concepto g on c.id_lqdcion = g.id_lqdcion',
'where a.nmro_dcmnto in   (select nmro_dcmnto from re_g_documentos where id_dcmnto = :P2_PRMTRO_2);',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(128350895212917238)
,p_shared_query_id=>wwv_flow_api.id(90968820294311197)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3. Logo Valledupar en orden',
'select pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_vlle_ordn',
'from df_c_imagenes_cliente a ',
'where a.cdgo_clnte = :F_CDGO_CLNTE and a.cdgo_imgen_clnte = ''ES2'' --''ESL''',
';'))
);
end;
/
