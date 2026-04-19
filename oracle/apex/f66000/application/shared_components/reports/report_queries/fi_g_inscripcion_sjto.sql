prompt --application/shared_components/reports/report_queries/fi_g_inscripcion_sjto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(88292798510544880)
,p_name=>'fi_g_inscripcion_sjto'
,p_query_text=>'select upper(b.nmbre_clnte)nmbre_clnte, upper(b.slgan)slgan, pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan, to_char(systimestamp, ''DD/MON/YYYY'') HOY, :F_IP as ipaddr, :F_NMBRE_USRIO as Usuario, a.file_mimet'
||'ype from df_c_imagenes_cliente a join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) where a.cdgo_clnte = :F_CDGO_CLNTE and a.cdgo_imgen_clnte = ''L_E'' '
,p_format=>'PDF'
,p_output_file_name=>'fi_g_inscripcion_sjto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(118595836567660555)
,p_shared_query_id=>wwv_flow_api.id(88292798510544880)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte, ',
'       upper(b.slgan)slgan, ',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan, ',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY, ',
'       :F_IP as ipaddr, ',
'       :F_NMBRE_USRIO as Usuario,',
'       a.file_mimetype ',
'from df_c_imagenes_cliente a join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'where a.cdgo_clnte = :F_CDGO_CLNTE and a.cdgo_imgen_clnte = ''L_E'' '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(118596043981660555)
,p_shared_query_id=>wwv_flow_api.id(88292798510544880)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre,',
'        identificacion,',
'        direccion,',
'        departamento,',
'        municipio,',
'        telefono,',
'        celular,',
'        email,',
'        nombre_representante,',
'        id_representante,',
'        celular_representante,',
'        fcha_inicio,',
'        decode(tipo_regimen,''S'',''Si'',''N'',''No'') tipo_regimen,',
'        dscrpcion,',
'        cdgo_ciiu,',
'        registro_mercantil,',
'        fcha_rgstro_mrcntil,',
'        decode(actvdad_ocsnal,''S'',''Si'',''N'',''No'') actvdad_ocsnal',
'    from ',
'    json_table (:P37_JSON,''$''',
'            columns (nombre                  varchar2 (400) PATH ''$.nombre'',',
'                    identificacion           varchar2 (400) PATH ''$.identificacion'',',
'                    direccion                varchar2 (400) PATH ''$.direccion'',',
'                    departamento             varchar2 (400) PATH ''$.departamento'',',
'                    municipio                varchar2 (400) PATH ''$.municipio'',',
'                    telefono                 varchar2 (400) PATH ''$.telefono'',',
'                    celular                  varchar2 (400) PATH ''$.celular'',',
'                    email                    varchar2 (400) PATH ''$.email'',',
'                    nombre_representante     varchar2 (400) PATH ''$.nombre_representante'',',
'                    id_representante         varchar2 (400) PATH ''$.id_representante'',',
'                    celular_representante    varchar2 (400) PATH ''$.celular_representante'',',
'                    fcha_inicio              varchar2 (400) PATH ''$.fcha_inicio'',',
'                    tipo_regimen             varchar2 (400) PATH ''$.tipo_regimen'',',
'                    dscrpcion                varchar2 (400) PATH ''$.dscrpcion'', ',
'                    cdgo_ciiu                varchar2 (400) PATH ''$.cdgo_ciiu'',',
'                    registro_mercantil       varchar2 (400) PATH ''$.registro_mercantil'',',
'                    fcha_rgstro_mrcntil      varchar2 (400) PATH ''$.fcha_rgstro_mrcntil'',',
'                    actvdad_ocsnal           varchar2 (400) PATH ''$.actvdad_ocsnal''',
'                    ))'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(118596218503660555)
,p_shared_query_id=>wwv_flow_api.id(88292798510544880)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nombre_establecimiento,',
'        cdgo_establecimiento,',
'        direccion_establecimiento,',
'        email_establecimiento,',
'        telefono_establecimiento',
'        from ',
'        json_table (:P37_JSON_2,''$[*]''',
'                                columns (nombre_establecimiento varchar2 (400) PATH ''$.nombre_establecimiento'',',
'                                         cdgo_establecimiento varchar2 (400) PATH ''$.cdgo_establecimiento'',',
'                                         direccion_establecimiento varchar2 (400) PATH ''$.direccion_establecimiento'',',
'                                         email_establecimiento varchar2 (400) PATH ''$.email_establecimiento'',',
'                                         telefono_establecimiento varchar2 (400) PATH ''$.telefono_establecimiento''',
'                                ))'))
);
end;
/
