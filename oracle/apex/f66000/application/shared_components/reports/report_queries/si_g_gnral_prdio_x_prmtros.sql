prompt --application/shared_components/reports/report_queries/si_g_gnral_prdio_x_prmtros
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(40082534492780410)
,p_name=>'si_g_gnral_prdio_x_prmtros'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--prueba_predios',
'select b.idntfccion_sjto_frmtda',
'     , b.idntfccion_sjto',
'     , b.drccion',
'     , a.mtrcla_inmblria',
'     , a.dscrpcion_prdio_clsfccion',
'     , a.avluo_ctstral',
'     , a.area_trrno',
'     , a.area_cnstrda ',
'     , a.dscrpcion_prdo_dstno',
'     , a.dscrpcion_estrto',
'     , a.cdgo_estrto',
'  from v_si_i_predios              a',
'  join v_si_i_sujetos_impuesto     b',
'    on a.id_sjto_impsto            = b.id_sjto_impsto',
' where a.dscrpcion_prdio_clsfccion =nvl(:P14_DSCRPCION_PRDIO_CLSFCCION,a.dscrpcion_prdio_clsfccion)',
'   and a.id_prdio_dstno            = nvl(:P14_PRDIO_DSTNO,a.id_prdio_dstno)',
'   and a.avluo_ctstral             between nvl(:P14_AVLUO_DSD,a.avluo_ctstral) and nvl(:P14_AVLUO_HSTA,a.avluo_ctstral)',
'   and a.cdgo_estrto               = nvl(:P14_ESTRTO,a.cdgo_estrto)',
'   and a.id_impsto                 = :P14_IMPSTO',
'    or (substr( b.idntfccion_sjto , 1 , 4 ) || substr( b.idntfccion_sjto , 9 , 4 ) = :P14_MNZNA  ',
'         or  substr( b.idntfccion_sjto , 1 , 4 ) = :P14_SCTOR);',
''))
,p_format=>'PDF'
,p_output_file_name=>'si_g_gnral_prdio_x_prmtros'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22816547606583037)
,p_shared_query_id=>wwv_flow_api.id(40082534492780410)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'select b.idntfccion_sjto_frmtda',
'              , b.idntfccion_sjto',
'              , b.drccion',
'              , a.mtrcla_inmblria',
'              , e.dscrpcion_prdio_clsfccion',
'              , to_char(a.avluo_ctstral, :F_FRMTO_MNDA) as avluo_ctstral',
'              , a.area_trrno',
'              , a.area_cnstrda ',
'              , c.dscrpcion as dscrpcion_prdo_dstno',
'              , d.dscrpcion_estrto',
'              , a.cdgo_estrto',
'              , upper(json_value(:P37_JSON, ''$.nmbre_rprte'')) as nombre_reporte',
'           from si_i_predios                a',
'           join v_si_i_sujetos_impuesto     b on a.id_sjto_impsto       = b.id_sjto_impsto',
'           join df_i_predios_destino        c on a.id_prdio_dstno       = c.id_prdio_dstno',
'           join df_s_estratos		        d on a.cdgo_estrto          = d.cdgo_estrto',
'           join df_s_predios_clasificacion	e on a.cdgo_prdio_clsfccion = e.cdgo_prdio_clsfccion',
'          where b.cdgo_clnte           = :F_CDGO_CLNTE ',
'            and b.id_impsto            = json_value( :P37_JSON, ''$.id_impsto'')',
'            and b.id_sjto_estdo        = nvl(json_value( :P37_JSON , ''$.estdo'' ),b.id_sjto_estdo )',
'            and a.cdgo_prdio_clsfccion = nvl( json_value( :P37_JSON , ''$.dscrpcion_prdio_clsfccion'' ), a.cdgo_prdio_clsfccion )',
'            and a.id_prdio_dstno       = nvl( json_value( :P37_JSON , ''$.prdio_dstno''),a.id_prdio_dstno)',
'            and a.avluo_ctstral        between json_value( :P37_JSON , ''$.avluo_dsde'' )  and json_value( :P37_JSON , ''$.avluo_hsta'' )',
'            and a.cdgo_estrto          = nvl( json_value(:P37_JSON, ''$.estrto'' ) , a.cdgo_estrto )',
'            and substr( b.idntfccion_sjto , 1 , 4 ) || substr( b.idntfccion_sjto , 9 , 4 ) = nvl( json_value(:P37_JSON, ''$.mnzna'') , substr( b.idntfccion_sjto , 1 , 4 ) || substr( b.idntfccion_sjto , 9 , 4 ))',
'            and substr( b.idntfccion_sjto , 1 , 4 )                                        = nvl( json_value(:P37_JSON, ''$.sctor'') , substr( b.idntfccion_sjto , 1 , 4 ))',
'            ',
'   '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22816783675583037)
,p_shared_query_id=>wwv_flow_api.id(40082534492780410)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'----------Encabezado y Pie de Pagina-----------------',
'select upper(b.nmbre_clnte) as nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,        ',
'       (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE) as nmbre_rpte',
'from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
end;
/
