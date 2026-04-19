prompt --application/shared_components/reports/report_queries/si_g_nvddes_prsna_frmlrio
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(74690070114326996)
,p_name=>'si_g_nvddes_prsna_frmlrio'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Datos del Formulario de Novedad',
'select case when a.cdgo_nvdad_tpo = ''INS'' then',
unistr('                        ''<label>1. Inscripci\00F3n</label>'),
'                         <input type="radio" checked>',
unistr('                         <label>2. Actualizaci\00F3n</label>'),
'                         <input type="radio" >  ',
unistr('                         <label>3. Cancelaci\00F3n</label>'),
'                         <input type="radio">',
unistr('                         <label>4. Activaci\00F3n</label>'),
'                         <input type="radio">''',
'            when a.cdgo_nvdad_tpo = ''ACT'' then   ',
unistr('                        ''<label>1. Inscripci\00F3n</label>'),
'                         <input type="radio">',
unistr('                         <label>2. Actualizaci\00F3n</label>'),
'                         <input type="radio" checked>  ',
unistr('                         <label>3. Cancelaci\00F3n</label>'),
'                         <input type="radio">',
unistr('                         <label>4. Activaci\00F3n</label>'),
'                         <input type="radio">''',
'            when a.cdgo_nvdad_tpo = ''CNC'' then   ',
unistr('                        ''<label>1. Inscripci\00F3n</label>'),
'                         <input type="radio">',
unistr('                         <label>2. Actualizaci\00F3n</label>'),
'                         <input type="radio" >  ',
unistr('                         <label>3. Cancelaci\00F3n</label>'),
'                         <input type="radio" checked>',
unistr('                         <label>4. Activaci\00F3n</label>'),
'                         <input type="radio">''',
'            when a.cdgo_nvdad_tpo = ''ACV'' then   ',
unistr('                        ''<label>1. Inscripci\00F3n</label>'),
'                         <input type="radio">',
unistr('                         <label>2. Actualizaci\00F3n</label>'),
'                         <input type="radio" >  ',
unistr('                         <label>3. Cancelaci\00F3n</label>'),
'                         <input type="radio" >',
unistr('                         <label>4. Activaci\00F3n</label>'),
'                         <input type="radio" checked>'' ',
'       end as opcn_uso',
'     , b.cdgo_idntfccion_tpo',
'     , b.idntfccion',
'     , trim(b.prmer_nmbre||'' ''||b.sgndo_nmbre||'' ''||b.prmer_nmbre||'' ''||b.sgndo_aplldo) as rspnsble',
'     , a.nmbre_pais_ntfccion',
'     , a.nmbre_dprtmnto_ntfccion',
'     , a.nmbre_mncpio_ntfccion',
'     , a.drccion_ntfccion',
'     , a.tlfno',
'     , a.cllar     ',
'     , c.nmro_rgstro_cmra_cmrcio',
'     , c.fcha_rgstro_cmra_cmrcio',
'     , c.fcha_incio_actvddes',
'  from v_si_g_novedades_persona    a ',
'  join si_g_novddes_prsna_rspnsble b on a.id_nvdad_prsna      = b.id_nvdad_prsna',
'  --join df_s_identificaciones_tipo  c on b.cdgo_idntfccion_tpo = c.cdgo_idntfccion_tpo',
'  join si_g_novedades_persona_sjto c on a.id_nvdad_prsna      = c.id_nvdad_prsna',
'--  join df_s_responsables_tipo      d on b.cdgo_tpo_rspnsble   = d.cdgo_rspnsble_tpo;',
'where a.id_nvdad_prsna = 161;'))
,p_format=>'PDF'
,p_output_file_name=>'si_g_nvddes_prsna_frmlrio'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(74887065264240583)
,p_shared_query_id=>wwv_flow_api.id(74690070114326996)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 1. Datos basicos',
'select a.cdgo_nvdad_tpo',
'     , to_char(a.fcha_rgstro,''DD/MM/YYYY HH:MI:SS AM'') as fcha_rgstro',
'     , a.nmro_rdcdo_dsplay',
'     , upper(a.dscrpcion_nvdad_tpo) as dscrpcion_nvdad_tpo',
'     , ''PERSONA ''||b.dscrpcion_tpo_prsna as dscrpcion_tpo_prsna',
'     , b.dscrpcion_idntfccion_tpo',
'     , b.idntfccion',
'     , case when b.tpo_prsna = ''N'' then',
'                   b.nmbre',
'            else',
'                   b.nmbre_rzon_scial',
'        end as nmbre_o_rzn_scial     ',
'     , case when b.tpo_prsna = ''N'' then',
'                   null',
'            else',
'                   pkg_gi_declaraciones_funciones.fnc_ca_digito_verificacion(p_identificacion =>b.idntfccion) ',
'        end as dgto_vrfccion        ',
'     , a.tlfno',
'     , a.cllar         ',
'     , b.drccion   ',
'     , a.email',
'     , nmbre_sjto_tpo as rgmen',
'     , b.nmbre_pais',
'     , b.nmbre_dprtmnto',
'     , b.nmbre_mncpio',
'     , b.drccion_ntfccion',
'     , b.nmbre_pais_ntfccion',
'     , b.nmbre_dprtmnto_ntfccion',
'     , b.nmbre_mncpio_ntfccion     ',
'     , b.nmro_rgstro_cmra_cmrcio',
'     , to_char(b.fcha_rgstro_cmra_cmrcio,''DD/MM/YYYY'') as fcha_rgstro_cmra_cmrcio',
'     , to_char(b.fcha_incio_actvddes,''DD/MM/YYYY'') as fcha_incio_actvddes',
'  from v_si_g_novedades_persona           a ',
'  left join v_si_g_novedades_persona_sjto b on a.id_nvdad_prsna = b.id_nvdad_prsna',
' where a.id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'')',
' '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(74887278588240583)
,p_shared_query_id=>wwv_flow_api.id(74690070114326996)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- 2. Encabezado y Pie de Pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        to_char(sysdate,''FMMONTH YYYY'') AS fcha,',
'        b.nmbre_mncpio',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(74887469525240583)
,p_shared_query_id=>wwv_flow_api.id(74690070114326996)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' -- 3. Datos representantes',
'select c.dscrpcion_idntfccion_tpo      as cdgo_idntfccion_tpo',
'     , a.idntfccion',
'     , null as dv',
'     , upper(b.dscrpcion_rspnsble_tpo) as dscrpcion_rspnsble_tpo',
'  from si_g_novddes_prsna_rspnsble a',
'  join df_s_responsables_tipo      b on a.cdgo_tpo_rspnsble = b.cdgo_rspnsble_tpo',
'  join df_s_identificaciones_tipo  c on a.cdgo_idntfccion_tpo = c.cdgo_idntfccion_tpo',
' where a.id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(74887632805240583)
,p_shared_query_id=>wwv_flow_api.id(74690070114326996)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- 4. Datos Actividades Economicas',
'select a.cdgo_actvdad_ecnmca',
'     , to_char(a.fcha_incio_actvddes,''DD/MM/YYYY'') as fcha_incio_actvddes',
unistr('     , ''S\00ED'' as prncpal'),
'     , b.dscrpcion',
'  from v_si_g_novedades_persona_sjto a',
'  join gi_d_actividades_economica       b on a.id_actvdad_ecnmca = b.id_actvdad_ecnmca',
' where a.id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'')',
'UNION',
'select b.cdgo_actvdad_ecnmca',
'     , to_char(a.fcha_incio_actvdad,''DD/MM/YYYY'') as fcha_incio_actvdad',
'     , ''No'' as prncpal',
'     , b.dscrpcion',
'  from si_g_nvddes_prsna_actvd_eco      a',
'  join gi_d_actividades_economica       b on a.id_actvdad_ecnmca = b.id_actvdad_ecnmca',
' where a.id_nvdad_prsna = json_value(:P37_JSON,''$.id_nvdad_prsna'')'))
);
end;
/
