prompt --application/shared_components/reports/report_queries/gf_g_saldos_favor
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(93931424687490095)
,p_name=>'gf_g_saldos_favor'
,p_query_text=>'select 1 from dual'
,p_format=>'PDF'
,p_output_file_name=>'gf_g_saldos_favor'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134770915679249768)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''P_ID_IMPSTO'' ) )nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P37_ID_RPRTE ) nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134771179589249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Consulta que trae los datos de la proyecci\00F3n '),
'select b.nmbre_trcro as usuario_proyecto,',
'       c.nmbre_trcro as usuario_reviso,',
'       d.nmbre_trcro as usuario_firmo,',
'       a.id_acto,',
'       a.dcmnto',
'from gf_g_saldos_favor_documento a',
'join v_sg_g_usuarios b on  a.id_usrio_prycto  = b.id_usrio',
'join v_sg_g_usuarios c on  a.id_usrio_rvso    = c.id_usrio',
'join v_sg_g_usuarios d on  a.id_usrio_frma    = d.id_usrio',
'where a.id_sldo_fvor_dcmnto = json_value(:P37_JSON, ''$.id_dcmnto'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134771375165249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta que trae la fecha en el que se genero el acto',
'--Fecha del documento',
'select      a.nmro_acto_dsplay',
'           ,to_char(a.fcha, ''FM DD "DE" MONTH "DEL "YYYY'') fcha',
'from        gn_g_actos      a',
'where       a.id_acto       =  json_value(:P37_JSON, ''$.id_acto'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134771567502249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Resoluci\00F3n'),
'select f.cdgo_trd ||''-''|| c.cdgo_dcmnto_tpo  ||''-''|| e.cdgo_srie ||''-''|| (select b.nmro_acto ',
'                                                                          from gf_g_saldos_favor_documento    a',
'                                                                          join gn_g_actos                     b   on  a.id_acto   =   b.id_acto',
'                                                                          where a.id_sldo_fvor_slctud = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'')) as resolucion',
'from gn_d_actos_tipo   a',
'join gd_d_trd_serie_dcmnto_tpo  b   on  a.id_trd_srie_dcmnto_tpo    =   b.id_trd_srie_dcmnto_tpo',
'join gd_d_documentos_tipo       c   on  b.id_dcmnto_tpo             =   c.id_dcmnto_tpo',
'join gd_d_trd_serie             d   on  b.id_trd_srie               =   d.id_trd_srie',
'join gd_d_series                e   on  d.id_srie                   =   e.id_srie',
'join gd_d_trd                   f   on  d.id_trd                    =   f.id_trd',
'where a.cdgo_acto_tpo = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''cdgo_acto_tpo'') --''SAF''',
'and a.cdgo_clnte= pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''cdgo_clnte'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134771740259249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--\00C1rea'),
'select e.nmbre_area',
'from gn_d_actos_tipo            a',
'join gd_d_trd_serie_dcmnto_tpo  b   on  a.id_trd_srie_dcmnto_tpo    =   b.id_trd_srie_dcmnto_tpo',
'join gd_d_trd_serie             c   on  b.id_trd_srie               =   c.id_trd_srie',
'join gd_d_trd                   d   on  c.id_trd                    =   d.id_trd',
'join df_c_areas                 e   on  d.id_area                   =   e.id_area',
'where a.cdgo_acto_tpo = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''cdgo_acto_tpo'')',
'and a.cdgo_clnte= pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''cdgo_clnte'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134771987797249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Solicitante',
'select a.idntfccion,',
'       a.nmbre_slctnte,',
'       e.nmbre_impsto as nmbre_impsto_saf',
'from  v_pq_g_solicitantes         a',
'join gf_g_saldos_favor_solicitud  b   on  a.id_slctud       =   b.id_slctud',
'join pq_g_solicitudes_motivo      c   on  b.id_slctud       =   c.id_slctud',
'join pq_g_slctdes_mtvo_sjt_impst  d   on  c.id_slctud_mtvo  =   d.id_slctud_mtvo',
'join df_c_impuestos               e   on  d.id_impsto       =   e.id_impsto',
'where b.id_sldo_fvor_slctud = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134772191077249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Detalle de la compensaci\00F3n'),
'select  idntfccion_sjto,',
'        nmbre_impsto,',
'        vgncia,',
'        to_char(vlor_sldo_cptal, ''FM$999G999G999G999G999G999G990'') as vlor_sldo_cptal,',
'        to_char(vlor_intres, ''FM$999G999G999G999G999G999G990'') as vlor_intres, ',
'        to_char(vlor_sldo_cptal + vlor_intres, ''FM$999G999G999G999G999G999G990'') as total, ',
'        to_char(vlor_cmpnscion, ''FM$999G999G999G999G999G999G990'') as vlor_cmpnscion,',
'        to_char(vlor_sldo_cptal + vlor_intres - vlor_cmpnscion, ''FM$999G999G999G999G999G999G990'') as nvo_vlor_pgar',
'from json_table(pkg_gf_saldos_favor.fnc_cl_dtlle_cmpnscion(',
'                                                            pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'')',
'                                                          ), ''$[*]''',
'columns(idntfccion_sjto varchar2 path ''$.idntfccion_sjto'',',
'        nmbre_impsto    varchar2 path ''$.nmbre_impsto'',',
'        vgncia          varchar2 path ''$.vgncia'',',
'        vlor_sldo_cptal varchar2 path ''$.vlor_sldo_cptal'',',
'        vlor_intres     varchar2 path ''$.vlor_intres'',',
'        vlor_cmpnscion  varchar2 path ''$.vlor_cmpnscion''));'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134772362426249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>'select pkg_gf_saldos_favor.fnc_cl_obtener_articulos (pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'')) as articulos from dual ;'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134772545360249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Identificacion de los sujetos compensados',
'select listagg(b.idntfccion_sjto, '', '') within group (order by b.idntfccion_sjto) as idntfccion_sujeto',
'from (select c.idntfccion_sjto',
'      from gf_g_saldos_favor_cmpnscion a',
'      join gf_g_sldos_fvr_cmpnscn_dtll b on a.id_sld_fvr_cmpnscion = b.id_sld_fvr_cmpnscion',
'      join v_si_i_sujetos_impuesto     c on b.id_sjto_impsto       = c.id_sjto_impsto         ',
'      where a.id_sldo_fvor_slctud = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'')',
'      group by c.idntfccion_sjto) b;',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134772752574249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Vigencias',
'select listagg(vgncias , '', '') within group (order by vgncias) as vigencias  ',
'from    (',
'           select d.vgncia as vgncias  ',
'           from gf_g_saldos_favor_solicitud a',
'           join gf_g_sldos_fvor_slctud_dtll          b  on a.id_sldo_fvor_slctud = b.id_sldo_fvor_slctud',
'           join gf_g_saldos_favor                    c  on b.id_sldo_fvor = c.id_sldo_fvor',
'           join gf_g_saldos_favor_vigencia           d  on c.id_sldo_fvor = d.id_sldo_fvor',
'           where a.id_sldo_fvor_slctud = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'')',
'           group by d.vgncia',
'       ) '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134772998043249769)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--DEVOLUCI\00D3N BANCO CUENTA'),
'select b.nmbre_bnco,',
'       a.nmro_cnta',
'from gf_g_saldos_favor_devlucion a',
'join df_c_bancos                          b on a.id_bnco = b.id_bnco',
'where a.id_sldo_fvor_slctud= pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134773112855249770)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--TIPO DE SALDO A FAVOR',
'select listagg(tiposaf , '', '') within group (order by tiposaf) as tsaf ',
'from    (',
'            select d.nmbre as tiposaf ',
'            from gf_g_saldos_favor_solicitud a',
'            join gf_g_sldos_fvor_slctud_dtll b     on      a.id_sldo_fvor_slctud = b.id_sldo_fvor_slctud',
'            join gf_g_saldos_favor           c     on      b.id_sldo_fvor        = c.id_sldo_fvor',
'            join gf_d_saldos_favor_tipo      d     on      c.cdgo_sldo_fvor_tpo  = d.cdgo_sldo_fvor_tpo',
'            where a.id_sldo_fvor_slctud = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'')',
'            group by d.nmbre',
'            ',
'        );'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(134773396683249770)
,p_shared_query_id=>wwv_flow_api.id(93931424687490095)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--DEVOLUCI\00D3N'),
'select pkg_gf_saldos_favor.fnc_cl_obtener_devolucion(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_sldo_fvor_slctud'')) as saf',
'from dual;  '))
);
end;
/
