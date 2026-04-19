prompt --application/pages/page_00071
begin
wwv_flow_api.create_page(
 p_id=>71
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>'Pagina Impresion (Colecciones)'
,p_step_title=>'Pagina Impresion (Colecciones)'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const fnImprimirMasivo = () => {',
'    ',
'    let v_orgen = $v(''P71_ORGEN'');',
'    let v_json_data = window.localStorage.getItem(v_orgen);',
'    ',
'    //v_json_actos = JSON.parse(v_json_actos);',
'    ',
'    apex.server.process(',
'        "ImprimirMasivo",',
'        {    ',
'            f01: v_json_data,',
'            pageItems: ''#P71_ID_RPRTE,#P71_NMBRE_ZIP,#P71_CDGO_IMPRSION''',
'        },',
'        {',
'            //dataType: ''text'',',
'            success: function( pData ){',
'                ',
'                if (pData.o_cdgo_rspsta != 0){ ',
'                    apex.message.clearErrors();',
'                    apex.message.alert(  pData.o_mnsje_rspsta );',
'',
'                }else{',
'                    //console.log(pData.o_url);',
'                    //window.open(pData.o_url, ''_blank'');',
'                    apex.submit({request: ''masivoZipProcesar''});',
'                }',
'            }',
'        }',
'    );',
'    ',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20211104110924'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(179373970385104216)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5518331913658742)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(179373970385104216)
,p_button_name=>'New'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(35794538727290432)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5517723320658736)
,p_name=>'P71_CDGO_IMPRSION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Item Opcional : Nombre del Reporte - Por Defecto el Nombre Almacenado.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5518043027658739)
,p_name=>'P71_ORGEN'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5518636087658745)
,p_name=>'P71_JSON'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142950916452086920)
,p_name=>'P71_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>unistr('Item Opcional : Id de la Aplicaci\00F3n - Por defecto 66000 ')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142951385824086925)
,p_name=>'P71_ID_RPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_item_default=>'199'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Item Requerido : Llave Primario del Reporte.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142951774614086928)
,p_name=>'P71_NMBRE_RPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Item Opcional : Nombre del Reporte - Por Defecto el Nombre Almacenado.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142952116564086928)
,p_name=>'P71_CONTENT_DISPOSITION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>unistr('Item Opcional : Modo de Impresi\00F3n del Reporte por Defecto attachment.')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142952978056086930)
,p_name=>'P71_NMBRE_ZIP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_inline_help_text=>'Item Opcional : Nombre del archivo zip.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142953334275086931)
,p_name=>'P71_ID_RPRTE_PRMTRO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142953707845086931)
,p_name=>'P71_PRMTRO_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(142954118953086931)
,p_name=>'P71_PRMTRO_2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(179373970385104216)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142954562993086940)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_gn_d_reportes       gn_d_reportes%rowtype;',
'    v_app_id              number        := nvl( :P71_APP_ID , :APP_ID );',
'    v_content_disposition varchar2(50)  := nvl( lower(:P71_CONTENT_DISPOSITION) , ''attachment'' );',
'    v_file_name           varchar2(100);  ',
'    v_nivel               number;',
'    v_nmbre_up            sg_d_configuraciones_log.nmbre_up%type := ''pkg_gn_generalidades.fnc_ge_xml_prmtro'';',
'    v_mnsje               varchar2(4000);',
'    l_start               number;',
'    l_end                 number;',
'    v_blob                blob := empty_blob();',
'    v_fncion              clob; -- := pkg_gn_generalidades.fnc_ca_extract_value( :P71_XML , ''fncion'' );',
'    v_id_rprte_imprsion   number;',
'    v_nmbre_rprte         varchar2(100);',
'    v_prmtros_rprte_cnslta clob;',
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
'                         ',
'    begin',
'        SELECT id_rprte_imprsion,',
'          json_value(prmtros_rprte_cnslta,''$.NMBRE_RPRTE'') as nmbre_rprte,',
'          json_value(prmtros_rprte_cnslta,''$.FNCION'') as fncion,',
'          prmtros_rprte_cnslta',
'        into v_id_rprte_imprsion, v_nmbre_rprte, v_fncion, v_prmtros_rprte_cnslta',
'        FROM gn_g_reportes_impresion',
'       WHERE cdgo_imprsion = :P71_CDGO_IMPRSION',
'         and id_usrio = :F_ID_USRIO',
'         and id_session = :APP_SESSION;',
'    exception',
'        when others then',
'            raise_application_error( -20001 , ''No se encontro documento a generar.'' );',
'    end;',
'    ',
'    v_fncion := replace( v_fncion , ''!'' , '','' );',
unistr('    v_fncion := replace( v_fncion , ''\00A1'' , '':'' );'),
'    ',
'    :P71_JSON := v_prmtros_rprte_cnslta;',
'    apex_util.set_session_state( ''P71_JSON'' , v_prmtros_rprte_cnslta );',
'        ',
'    begin',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = :P71_ID_RPRTE;',
'    exception when no_data_found then',
'              raise_application_error( -20001 , ''El reporte no existe en el sistema.'' );',
'    end; ',
'                         ',
'    v_file_name := nvl( :P71_NMBRE_RPRTE , v_gn_d_reportes.nmbre_rprte ); ',
'    ',
'    v_mnsje := ''Reporte #Id: '' || v_gn_d_reportes.id_rprte || '' Nombre: '' || v_file_name; --v_gn_d_reportes.nmbre_rprte;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'                         ',
'    ',
'    v_mnsje := ''XML: '' || :P71_XML;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'    ',
'    v_mnsje := ''Parametros -> P71_APP_ID:'' || v_app_id || '' P71_CONTENT_DISPOSITION:'' || v_content_disposition || '' P71_NMBRE_RPRTE:'' || v_file_name;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'    ',
'    ',
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
 p_id=>wwv_flow_api.id(142955306266086943)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar Zip'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_gn_d_reportes       gn_d_reportes%rowtype;',
'    v_app_id              number        := nvl( :P71_APP_ID , :APP_ID );',
'    v_content_disposition varchar2(50)  := nvl( lower(:P71_CONTENT_DISPOSITION) , ''attachment'' );',
'    v_file_name           varchar2(100);   ',
'    v_nivel               number;',
'    v_nmbre_up            sg_d_configuraciones_log.nmbre_up%type := ''pkg_gn_generalidades.fnc_ge_xml_prmtro'';',
'    v_mnsje               varchar2(4000);',
'    l_start               number;',
'    l_end                 number;',
'    v_blob                blob := empty_blob();',
'    v_fncion              clob;',
'    l_zip_file            blob;',
'    v_id_dcmnto           gd_g_documentos.id_dcmnto%type;',
'begin',
'',
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
'         where r.id_rprte = :P71_ID_RPRTE;',
'    exception when no_data_found then',
'              raise_application_error( -20001 , ''El reporte no existe en el sistema.'' );',
'    end; ',
'                         ',
'    v_file_name := nvl( :P71_NMBRE_RPRTE , v_gn_d_reportes.nmbre_rprte ); ',
'    ',
'    v_mnsje := ''Reporte Parametro #Id: '' || :P71_ID_RPRTE_PRMTRO;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'                         ',
'    v_mnsje := ''Reporte #Id: '' || v_gn_d_reportes.id_rprte || '' Nombre: '' || v_gn_d_reportes.nmbre_rprte;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'                         ',
'    ',
'    v_mnsje := ''Parametros -> P71_APP_ID:'' || v_app_id || '' P71_CONTENT_DISPOSITION:'' || v_content_disposition || '' P71_NMBRE_RPRTE:'' || v_file_name;',
'    pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                         , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'   ',
'   v_fncion    := null;',
'   v_file_name := null;',
'   ',
'   for c_datos in (SELECT id_rprte_imprsion,',
'                          json_value(prmtros_rprte_cnslta,''$.NMBRE_RPRTE'') as nmbre_rprte,',
'                          json_value(prmtros_rprte_cnslta,''$.FNCION'') as fncion,',
'                          prmtros_rprte_cnslta,',
'                          json_value(prmtros_rprte_cnslta,''$.ID_PRCSOS_JRDCO_DCMNTO'') as id_prcsos_jrdo_dcmnto',
'                        FROM gn_g_reportes_impresion',
'                       WHERE cdgo_imprsion = :P71_CDGO_IMPRSION',
'                         and id_usrio = :F_ID_USRIO',
'                         and id_session = :APP_SESSION',
'                     )',
'    loop',
'         ',
'         :P71_JSON := c_datos.prmtros_rprte_cnslta;',
'         apex_util.set_session_state( ''P71_JSON'' , c_datos.prmtros_rprte_cnslta );',
'         ',
'         ',
'         v_fncion    := c_datos.fncion;',
'         v_file_name := c_datos.nmbre_rprte;',
'         v_fncion    := replace( v_fncion , ''!'' , '','' );',
unistr('         v_fncion    := replace( v_fncion , ''\00A1'' , '':'' );'),
'                 ',
'         --apex_util.set_session_state( ''P71_XML'' , c_xml.xml );',
'         ',
'         select c.id_dcmnto,c.file_blob',
'         into v_id_dcmnto,v_blob',
'         from cb_g_procesos_jrdco_dcmnto a',
'         join gn_g_actos b on b.id_acto = a.id_acto',
'         left join gd_g_documentos c on c.id_dcmnto = b.id_dcmnto',
'         where a.id_prcsos_jrdco_dcmnto = c_datos.id_prcsos_jrdo_dcmnto;',
'          ',
'          if v_id_dcmnto is not null then',
'               apex_zip.add_file ( p_zipped_blob => l_zip_file,',
'                             p_file_name   => v_file_name || ''.'' || lower( v_gn_d_reportes.cdgo_frmto_tpo ) ,',
'                             p_content     => v_blob );',
'          else ',
'            ',
'             v_blob := apex_util.get_print_document (',
'                                                        p_application_id     => v_app_id',
'                                                      , p_report_query_name  => v_gn_d_reportes.nmbre_cnslta',
'                                                      , p_report_layout_name => v_gn_d_reportes.nmbre_plntlla ',
'                                                      , p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla',
'                                                      , p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo ',
'                                                    );',
'',
'             apex_zip.add_file ( p_zipped_blob => l_zip_file,',
'                                 p_file_name   => v_file_name || ''.'' || lower( v_gn_d_reportes.cdgo_frmto_tpo ) ,',
'                                 p_content     => v_blob );',
'',
'',
'             if( v_fncion is not null ) then ',
'',
'                 begin',
'                    execute immediate ''begin '' || v_fncion || ''; end;'' using v_blob;',
'                exception ',
'                     when others then',
'                          v_mnsje := ''Error Funcion invalida ('' || v_fncion || '') msg -> '' || sqlerrm;',
'                          pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                                               , p_nvel_log   => v_nivel       , p_txto_log  => v_mnsje , p_nvel_txto  => 3 );',
'',
'                          pkg_sg_log.prc_rg_log( p_cdgo_clnte => :F_CDGO_CLNTE , p_id_impsto => null    , p_nmbre_up   => v_nmbre_up ',
'                                               , p_nvel_log   => v_nivel       , p_txto_log  => sqlerrm , p_nvel_txto  => 3 );',
'',
'                          raise_application_error( -20001 , v_mnsje );',
'                end;',
'',
'             end if;',
'         end if;',
'     end loop;',
'                          ',
'    apex_zip.finish( p_zipped_blob =>  l_zip_file );',
'    owa_util.mime_header(''application/zip'', FALSE); ',
'    htp.p(''Content-length: ''|| dbms_lob.getlength(l_zip_file));',
'    htp.p(''Content-Disposition: attachment; filename="'' || nvl( :P71_NMBRE_ZIP , v_gn_d_reportes.nmbre_rprte ) || ''.zip"'');',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(l_zip_file);',
'    ',
'    delete gn_g_reportes_impresion',
'     where cdgo_imprsion = :P71_CDGO_IMPRSION',
'       and id_usrio = :F_ID_USRIO',
'       and id_session = :APP_SESSION;',
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
 p_id=>wwv_flow_api.id(142954944563086943)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
