prompt --application/shared_components/reports/report_queries/gi_g_crtfcdo_cntrbynte_ica
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(41175656081946173)
,p_name=>'gi_g_crtfcdo_cntrbynte_ica'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmbre_rzon_scial as nmbre_rzon_scial',
'      , case when a.cdgo_idntfccion_tpo = ''N'' then',
unistr('                ''Raz\00F3n Social'''),
'             else',
'                ''Nombre ''',
'        end as tpo     ',
'      , a.cdgo_idntfccion_tpo',
'      , initcap(a.dscrpcion_idntfccion_tpo) as dscrpcion_idntfccion_tpo',
'      , a.idntfccion_sjto                   as idntfccion              ',
'      , b.cdgo_sjto_estdo',
'      , upper(b.dscrpcion_sjto_estdo)       as stdo',
'      , extract( year from sysdate)         as ano',
'      , trim(to_char(to_date(sysdate),''Month''))   as mes',
'      , extract( day from sysdate)          as dia',
'      , initcap(b.nmbre_impsto)             as nmbre_impsto',
'      , json_value(:P37_JSON, ''$.cnsctvo'')  as cnsctvo',
'   from v_si_i_sujetos_responsable a',
'   join v_si_i_sujetos_impuesto  b on a.id_sjto_impsto = b.id_sjto_impsto',
'   join v_si_i_personas          c on a.id_sjto_impsto = c.id_sjto_impsto',
'  where b.id_sjto_impsto = json_value(:P37_JSON, ''$.id_sjto_impsto'');'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_crtfcdo_cntrbynte_ica'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(41191264814391420)
,p_shared_query_id=>wwv_flow_api.id(41175656081946173)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.nmbre_rzon_scial as nmbre_rzon_scial',
'      , case when a.cdgo_idntfccion_tpo = ''N'' then',
unistr('                ''Raz\00F3n Social'''),
'             else',
'                ''Nombre ''',
'        end as tpo     ',
'      , a.cdgo_idntfccion_tpo',
'      , initcap(a.dscrpcion_idntfccion_tpo) as dscrpcion_idntfccion_tpo',
'      , a.idntfccion_sjto                   as idntfccion              ',
'      , b.cdgo_sjto_estdo',
'      , upper(b.dscrpcion_sjto_estdo)       as stdo',
'      , extract( year from sysdate)         as ano',
'      , trim(to_char(to_date(sysdate),''Month''))   as mes',
'      , extract( day from sysdate)          as dia',
'      , initcap(b.nmbre_impsto)             as nmbre_impsto',
'      , json_value(:P37_JSON, ''$.cnsctvo'')  as cnsctvo',
'   from v_si_i_sujetos_responsable a',
'   join v_si_i_sujetos_impuesto  b on a.id_sjto_impsto = b.id_sjto_impsto',
'   join v_si_i_personas          c on a.id_sjto_impsto = c.id_sjto_impsto',
'  where b.id_sjto_impsto = json_value(:P37_JSON, ''$.id_sjto_impsto'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(41191401790391420)
,p_shared_query_id=>wwv_flow_api.id(41175656081946173)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
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
end;
/
