prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr(' Pagina Impresi\00F3n')
,p_step_title=>unistr(' Pagina Impresi\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200807114728'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(36423619276017313)
,p_plug_name=>unistr(' Pagina Impresi\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(35742496257290410)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36423736226017314)
,p_name=>'P2_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>unistr('Item Opcional : Id de la Aplicaci\00F3n - Por defecto 66000 ')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36423842184017315)
,p_name=>'P2_ID_RPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_item_default=>'199'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Item Requerido : Llave Primario del Reporte.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36423907058017316)
,p_name=>'P2_NMBRE_RPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Item Opcional : Nombre del Reporte - Por Defecto el Nombre Almacenado.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36424040235017317)
,p_name=>'P2_CONTENT_DISPOSITION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>unistr('Item Opcional : Modo de Impresi\00F3n del Reporte por Defecto attachment.')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36424127595017318)
,p_name=>'P2_XML'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Item Requerido',
unistr('Ejemplo: <data><nombrecampo>valor</nombrecampo></data> \00F3 '),
unistr('         <nombrecampo>valor</nombrecampo> \00F3 '),
unistr('         <data><nombrecampo value="valor"/></data> \00F3 '),
'         <nombrecampo value="valor"/>'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46295451421443203)
,p_name=>'P2_NMBRE_ZIP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_display_as=>'NATIVE_HIDDEN'
,p_inline_help_text=>'Item Opcional : Nombre del archivo zip.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62908839872620732)
,p_name=>'P2_PRMTRO_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79886567966484549)
,p_name=>'P2_PRMTRO_2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106868026086746401)
,p_name=>'P2_ID_RPRTE_PRMTRO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(36423619276017313)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(36423525730017312)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_gn_d_reportes       gn_d_reportes%rowtype;',
'    v_app_id              number        := nvl( :P2_APP_ID , :APP_ID );',
'    v_content_disposition varchar2(50)  := nvl( lower(:P2_CONTENT_DISPOSITION) , ''attachment'' );',
'    v_file_name           varchar2(100);  ',
'    v_nivel               number;',
'    v_nmbre_up            sg_d_configuraciones_log.nmbre_up%type := ''pkg_gn_generalidades.fnc_ge_xml_prmtro'';',
'    v_mnsje               varchar2(4000);',
'    l_start               number;',
'    l_end                 number;',
'    v_blob                blob := empty_blob();',
'    v_fncion              clob := pkg_gn_generalidades.fnc_ca_extract_value( :P2_XML , ''fncion'' );',
'begin',
'        ',
'    v_fncion := replace( v_fncion , ''!'' , '','' );',
unistr('    v_fncion := replace( v_fncion , ''\00A1'' , '':'' );'),
'    ',
'    --Tiempo Inicial',
'    l_start := dbms_utility.get_time;',
'        ',
'    --Determinamos el Nivel del Log de la UP',
'    v_nivel := pkg_sg_log.fnc_ca_nivel_log( :F_CDGO_CLNTE , null , v_nmbre_up );',
'    ',
'    v_mnsje := ''Inicio del Proceso Imprimir APP:'' || :APP_ID  || '' PAG: '' || :APP_PAGE_ID;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 1 );',
'    ',
'        ',
'    begin',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = :P2_ID_RPRTE;',
'    exception when no_data_found then',
'              raise_application_error( -20001 , ''El reporte no existe en el sistema.'' );',
'    end; ',
'                         ',
'    v_file_name := nvl( :P2_NMBRE_RPRTE , v_gn_d_reportes.nmbre_rprte ); ',
'    ',
'    v_mnsje := ''Reporte #Id: '' || v_gn_d_reportes.id_rprte || '' Nombre: '' || v_file_name; --v_gn_d_reportes.nmbre_rprte;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'                         ',
'    ',
'    v_mnsje := ''XML: '' || :P2_XML;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'    ',
'    v_mnsje := ''Parametros -> P2_APP_ID:'' || v_app_id || '' P2_CONTENT_DISPOSITION:'' || v_content_disposition || '' P2_NMBRE_RPRTE:'' || v_file_name;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'    ',
'    if( v_fncion is not null ) then',
'            ',
'            begin',
'                v_blob := apex_util.get_print_document (',
'                                                            p_application_id     => v_app_id',
'                                                          , p_report_query_name  => v_gn_d_reportes.nmbre_cnslta',
'                                                          , p_report_layout_name => v_gn_d_reportes.nmbre_plntlla ',
'                                                          , p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla',
'                                                          , p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo ',
'                                                       );',
'                                                       ',
'                execute immediate ''begin '' || v_fncion || ''; end;'' using v_blob;',
'                ',
'            exception ',
'                 when others then',
'                      v_mnsje := ''Error Funcion invalida ('' || v_fncion || '') msg -> '' || sqlerrm;',
'                      pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                                           , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'                      commit;',
'                      raise_application_error( -20001 , v_mnsje );',
'            end;',
'    end if;',
'    ',
'    ',
'    begin',
'',
'        apex_util.download_print_document ( ',
'                                                p_file_name           => v_file_name',
'                                              , p_content_disposition => v_content_disposition',
'                                              , p_application_id      => v_app_id',
'                                              , p_report_query_name   => v_gn_d_reportes.nmbre_cnslta ',
'                                              , p_report_layout_name  => v_gn_d_reportes.nmbre_plntlla ',
'                                              , p_report_layout_type  => v_gn_d_reportes.cdgo_frmto_plntlla',
'                                              , p_document_format     => v_gn_d_reportes.cdgo_frmto_tpo ',
'                                          );',
'   exception',
'         when others then',
'              --v_mnsje := ''Error no Existe la Consulta del Informe ['' || v_file_name || '']  #Id '' || v_gn_d_reportes.id_rprte ||'' Nombre Consulta : '' || v_gn_d_reportes.nmbre_cnslta  || '' en la Aplicacion:'' || :APP_ID;',
'              v_mnsje := ''Error: '' || sqlerrm || '' Code: '' || sqlcode;',
'              pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                                   , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'',
'              pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                                   , p_nvel_log   => v_nivel       , p_txto_log  => sqlerrm , p_nvel_txto  => 3 );',
'',
'              raise_application_error( -20002 , v_mnsje );',
'    end;',
'    ',
'    l_end := (( dbms_utility.get_time - l_start ) / 100 );',
'    v_mnsje := ''Fin del Proceso Imprimir APP:'' || :APP_ID  || '' PAG: '' || :APP_PAGE_ID  || '' TIME: '' || l_end || ''s.'';',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 1 );',
'',
'/*exception ',
'     when others then ',
'          pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                               , p_nvel_log   => v_nivel       , p_txto_log  => sqlerrm , p_nvel_txto  => 3 );      ',
'          ',
'          raise_application_error( -20001 , sqlerrm );*/',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'masivoZip'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_comment=>'Proceso que Imprime los Reportes.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(44108306997046713)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Zip'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_gn_d_reportes       gn_d_reportes%rowtype;',
'    v_app_id              number        := nvl( :P2_APP_ID , :APP_ID );',
'    v_content_disposition varchar2(50)  := nvl( lower(:P2_CONTENT_DISPOSITION) , ''attachment'' );',
'    v_file_name           varchar2(100);   ',
'    v_nivel               number;',
'    v_nmbre_up            sg_d_configuraciones_log.nmbre_up%type := ''pkg_gn_generalidades.fnc_ge_xml_prmtro'';',
'    v_mnsje               varchar2(4000);',
'    l_start               number;',
'    l_end                 number;',
'    v_blob                blob := empty_blob();',
'    v_fncion              clob;',
'    l_zip_file            blob;',
'begin',
'    ',
'    --Tiempo Inicial',
'    l_start := dbms_utility.get_time;',
'        ',
'    --Determinamos el Nivel del Log de la UP',
'    v_nivel := pkg_sg_log.fnc_ca_nivel_log( :F_CDGO_CLNTE , null , v_nmbre_up );',
'    ',
'    v_mnsje := ''Inicio del Proceso Imprimir APP:'' || :APP_ID  || '' PAG: '' || :APP_PAGE_ID;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 1 );',
'    ',
'    --Verifica si Existe el Reporte    ',
'    begin',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = :P2_ID_RPRTE;',
'    exception when no_data_found then',
'              raise_application_error( -20001 , ''El reporte no existe en el sistema.'' );',
'    end; ',
'                         ',
'    v_file_name := nvl( :P2_NMBRE_RPRTE , v_gn_d_reportes.nmbre_rprte ); ',
'    ',
'    v_mnsje := ''Reporte Parametro #Id: '' || :P2_ID_RPRTE_PRMTRO;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'                         ',
'    v_mnsje := ''Reporte #Id: '' || v_gn_d_reportes.id_rprte || '' Nombre: '' || v_gn_d_reportes.nmbre_rprte;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'                         ',
'    v_mnsje := ''XML: '' || :P2_XML;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'    ',
'    v_mnsje := ''Parametros -> P2_APP_ID:'' || v_app_id || '' P2_CONTENT_DISPOSITION:'' || v_content_disposition || '' P2_NMBRE_RPRTE:'' || v_file_name;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'      ',
'    for c_xml in (',
'                     select a.xml.getclobval() as xml',
'                          , rownum as nmro',
'                       from xmltable( ''//data''',
'                                        passing xmltype( ''<datas>'' || :P2_XML || ''</datas>'' )',
'                                        columns xml xmltype  path ''node()''',
'                                    ) a',
'                     union all ',
'                     select dta as xml ',
'                          , rownum as nmro',
'                       from gn_t_reportes_parametro',
'                      where id_rprte_prmtro = :P2_ID_RPRTE_PRMTRO ',
'                 ) loop',
'     ',
'         ',
'         v_mnsje := ''XML: '' || c_xml.xml;',
'         pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                              , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'    ',
'    ',
'         v_fncion    := pkg_gn_generalidades.fnc_ca_extract_value( c_xml.xml , ''fncion'' );',
'         v_file_name := nvl( pkg_gn_generalidades.fnc_ca_extract_value( c_xml.xml , ''nmbre_rprte'' ) , v_gn_d_reportes.nmbre_rprte || c_xml.nmro );',
'         v_fncion    := replace( v_fncion , ''!'' , '','' );',
unistr('         v_fncion    := replace( v_fncion , ''\00A1'' , '':'' );'),
'                 ',
'         apex_util.set_session_state( ''P2_XML'' , c_xml.xml );',
'         ',
'         v_blob := apex_util.get_print_document (',
'                                                    p_application_id     => v_app_id',
'                                                  , p_report_query_name  => v_gn_d_reportes.nmbre_cnslta',
'                                                  , p_report_layout_name => v_gn_d_reportes.nmbre_plntlla ',
'                                                  , p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla',
'                                                  , p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo ',
'                                                );',
'                                                       ',
'         apex_zip.add_file ( p_zipped_blob => l_zip_file,',
'                             p_file_name   => v_file_name || ''.'' || lower( v_gn_d_reportes.cdgo_frmto_tpo ) ,',
'                             p_content     => v_blob );',
'      ',
'      ',
'         if( v_fncion is not null ) then ',
'             ',
'             begin',
'                execute immediate ''begin '' || v_fncion || ''; end;'' using v_blob;',
'            exception ',
'                 when others then',
'                      v_mnsje := ''Error Funcion invalida ('' || v_fncion || '') msg -> '' || sqlerrm;',
'                      pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                                           , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'                      ',
'                      pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                                           , p_nvel_log   => v_nivel       , p_txto_log  => sqlerrm , p_nvel_txto  => 3 );',
'                                   ',
'                      raise_application_error( -20001 , v_mnsje );',
'            end;',
'         ',
'         end if;',
'',
'     end loop;',
'                          ',
'    apex_zip.finish( p_zipped_blob =>  l_zip_file );',
'    owa_util.mime_header(''application/zip'', FALSE); ',
'    htp.p(''Content-length: ''|| dbms_lob.getlength(l_zip_file));',
'    htp.p(''Content-Disposition: attachment; filename="'' || nvl( :P2_NMBRE_ZIP , v_gn_d_reportes.nmbre_rprte ) || ''.zip"'');',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(l_zip_file);',
'                ',
'    l_end := (( dbms_utility.get_time - l_start ) / 100 );',
'    v_mnsje := ''Fin del Proceso Imprimir APP:'' || :APP_ID  || '' PAG: '' || :APP_PAGE_ID  || '' TIME: '' || l_end || ''s'';',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 1 );',
'                         ',
'exception ',
'     when others then ',
'          pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                               , p_nvel_log   => v_nivel       , p_txto_log  => sqlerrm , p_nvel_txto  => 3 );      ',
'          ',
'          v_mnsje := ''Error: '' || sqlerrm || '' Code: '' || sqlcode;',
'          raise_application_error( -20001 , v_mnsje );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'masivoZip'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<data>',
'    <xml>',
'     <column>valor</column>	',
'    </xml>',
'</data>',
'<data>',
'    <xml>',
'     <column>valor</column>	',
'    </xml>',
'</data>...'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(37117713509793807)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
