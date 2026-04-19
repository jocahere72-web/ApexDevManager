prompt --application/shared_components/reports/report_queries/re_g_plantilla_proceso_cobro
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(44101884341962279)
,p_name=>'re_g_plantilla_proceso_cobro'
,p_query_text=>'select * from dual'
,p_format=>'PDF'
,p_output_file_name=>'re_g_plantilla_proceso_cobro'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(114710464298208539)
,p_shared_query_id=>wwv_flow_api.id(44101884341962279)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte)    ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(114710659232208539)
,p_shared_query_id=>wwv_flow_api.id(44101884341962279)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dcmnto, ',
'        c.indcdor_ntfccion,',
'        c.nmro_acto_dsplay,',
'        c.nmro_acto,',
'        c.id_acto,',
'        upper(to_char(c.fcha, ''FMMonth DD "de" YYYY'',''nls_date_language=spanish'')) fcha_acto,',
'        to_char(c.fcha, ''DD/MM/YYYY'') fcha_acto_c',
'   from cb_g_prcsos_jrdc_dcmnt_plnt a',
'   join cb_g_procesos_jrdco_dcmnto b',
'     on b.id_prcsos_jrdco_dcmnto = a.id_prcsos_jrdco_dcmnto',
'   join gn_g_actos c',
'     on c.id_acto = b.id_acto',
'  where json_value(:P71_JSON, ''$.ID_PRCSOS_JRDCO_DCMNTO'') = b.id_prcsos_jrdco_dcmnto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(114710829521208539)
,p_shared_query_id=>wwv_flow_api.id(44101884341962279)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmbre_trcro',
'     , d.nmbre_ofcna',
'     , e.nmbre_crgo',
'     , b.dscrpcion as tpo_acto',
'     , case when a.frma_tpo = ''MNL'' then',
'			null',
'		else',
'			pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => c.firma_file_blob)',
'		end as frma',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo             b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios         c on a.id_fncnrio  = c.id_fncnrio',
'  join df_c_oficinas               d on c.id_ofcna    = d.id_ofcna',
'  join df_c_cargos                 e on c.id_crgo     = e.id_crgo',
'  join CB_G_PROCESOS_JRDCO_DCMNTO  f on f.ID_ACTO_TPO = b.ID_ACTO_TPO',
' where b.cdgo_clnte             = :F_CDGO_CLNTE',
'   and f.ID_PRCSOS_JRDCO_DCMNTO = json_value(:P71_JSON, ''$.ID_PRCSOS_JRDCO_DCMNTO'')'))
);
end;
/
