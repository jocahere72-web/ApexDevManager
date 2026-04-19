prompt --application/pages/page_00037
begin
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(35816487856290456)
,p_name=>unistr('Pagina de Impresi\00F3n con JSON')
,p_step_title=>unistr('Pagina de Impresi\00F3n con JSON')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_browser_cache=>'N'
,p_last_updated_by=>'JBADRAN'
,p_last_upd_yyyymmddhh24miss=>'20251013190811'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(102538186078180971)
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
 p_id=>wwv_flow_api.id(13379736129858837)
,p_name=>'P37_ID_RPRTE_AUDTRIA_TRZA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66115011835163799)
,p_name=>'P37_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>unistr('Item Opcional : Id de la Aplicaci\00F3n - Por defecto 66000 ')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66115497865163867)
,p_name=>'P37_ID_RPRTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
,p_item_default=>'199'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Item Requerido : Llave Primario del Reporte.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66115744759163874)
,p_name=>'P37_NMBRE_RPRTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Item Opcional : Nombre del Reporte - Por Defecto el Nombre Almacenado.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66116160157163874)
,p_name=>'P37_CONTENT_DISPOSITION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>unistr('Item Opcional : Modo de Impresi\00F3n del Reporte por Defecto attachment.')
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66116582006163875)
,p_name=>'P37_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
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
 p_id=>wwv_flow_api.id(66116900221163875)
,p_name=>'P37_NMBRE_ZIP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
,p_display_as=>'NATIVE_HIDDEN'
,p_inline_help_text=>'Item Opcional : Nombre del archivo zip.'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(66117310796163876)
,p_name=>'P37_ID_RPRTE_PRMTRO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(88305696645132903)
,p_name=>'P37_JSON_2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(102538186078180971)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Item Requerido',
unistr('Ejemplo: <data><nombrecampo>valor</nombrecampo></data> \00F3 '),
unistr('         <nombrecampo>valor</nombrecampo> \00F3 '),
unistr('         <data><nombrecampo value="valor"/></data> \00F3 '),
'         <nombrecampo value="valor"/>'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66118463158164077)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Limpiar Sesi\00F3n')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(66118148162164027)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_gn_d_reportes       	gn_d_reportes%rowtype;',
'    v_app_id              	number        := nvl( :P37_APP_ID , :APP_ID );',
'    v_content_disposition 	varchar2(50)  := nvl( lower(:P37_CONTENT_DISPOSITION) , ''attachment'' );',
'    v_file_name           	varchar2(100);  ',
'    v_nivel               	number;',
'    v_nmbre_up            	sg_d_configuraciones_log.nmbre_up%type := ''pkg_gn_generalidades.fnc_ge_xml_prmtro'';',
'    v_mnsje               	varchar2(4000);               ',
'',
'    -- Jbadran',
'    v_auditoria 		  	varchar2(4);   ',
'	v_blob                	blob;',
'    v_id_sjto_impsto_orgen  varchar2(200);',
'	v_id_rprte_audtria_trza gn_g_reportes_auditoria_traza.id_rprte_audtria_trza%type;',
'    v_id_sjto_impsto        gn_g_reportes_auditoria_traza.id_sjto_impsto%type;',
'    v_json                  clob;',
'	v_cdgo_rspsta			number;',
'	v_mnsje_rspsta			clob;',
'begin',
'    --Determinamos el Nivel del Log de la UP',
'    v_nivel := pkg_sg_log.fnc_ca_nivel_log( :F_CDGO_CLNTE , null , v_nmbre_up );',
'    ',
'    v_mnsje := ''Inicio del Proceso Imprimir APP:'' || :APP_ID  || '' PAG: '' || :APP_PAGE_ID;',
'    ',
'	pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, v_mnsje, 1);',
'       ',
'   begin',
'        select /*+ RESULT_CACHE */',
'               r.*',
'          into v_gn_d_reportes ',
'          from gn_d_reportes r',
'         where r.id_rprte = :P37_ID_RPRTE;',
'    exception when no_data_found then',
'              raise_application_error( -20001 , ''El reporte no existe en el sistema.'' );',
'    end; ',
'',
'    v_file_name := nvl( :P37_NMBRE_RPRTE , v_gn_d_reportes.nmbre_rprte ); ',
'    ',
'    v_mnsje := ''Reporte #Id: '' || v_gn_d_reportes.id_rprte || '' Nombre: '' || v_file_name; --v_gn_d_reportes.nmbre_rprte;',
'    ',
'	pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE , null, v_nmbre_up, v_nivel, v_mnsje, 3);',
'',
'    v_mnsje := ''P37_JSON: '' || :P37_JSON;',
'	',
'    pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, v_mnsje, 3);',
'                         ',
'    v_mnsje := ''P37_ID_RPRTE_PRMTRO: '' || :P37_ID_RPRTE_PRMTRO;',
'    ',
'	pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, v_mnsje, 3);',
'    ',
'    v_mnsje := ''Parametros -> P37_APP_ID:'' || v_app_id || '' P37_CONTENT_DISPOSITION:'' || v_content_disposition || '' P37_NMBRE_RPRTE:'' || v_file_name;',
'    ',
'	pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, v_mnsje, 3);',
'',
'    begin',
'        v_auditoria := pkg_gn_reportes_auditoria.fnc_vl_reporte_auditoria(v_gn_d_reportes.id_rprte);',
'    exception ',
'        when others then',
'            v_auditoria := ''N'';',
'    end;',
'	',
'	-- Validamos si el reporte requiere auditoria.',
'	if v_auditoria = ''S'' then',
'',
'--        v_id_rprte_audtria_trza := sq_gn_g_reportes_auditoria_traza.nextval;',
'',
'        -- Generamos el ID de la auditoria.',
'        select nvl(max(id_rprte_audtria_trza), 0) + 1 into v_id_rprte_audtria_trza',
'        from gn_g_reportes_auditoria_traza;',
'',
'		-- Validamos que el ID auditoria no sea nulo',
'		if v_id_rprte_audtria_trza is not null then',
'        ',
'            begin',
'				-- Consultamos el Json del report query si tiene sujeto impuesto.',
'                v_id_sjto_impsto_orgen := pkg_gn_reportes_auditoria.fnc_co_json_value(:P37_JSON, ''id_sjto_impsto'');',
'                ',
'				-- Convertimos el sujeto impuesto en number',
'                if v_id_sjto_impsto_orgen is not null then ',
'                    v_id_sjto_impsto := to_number(v_id_sjto_impsto_orgen);',
'                else',
'                    v_id_sjto_impsto := null;',
'                end if;',
'                ',
'				-- Agregamos el ID auditoria al json del report query para asociarlo al QR.',
'                v_json := pkg_gn_reportes_auditoria.fnc_gn_json_values(:P37_JSON, ''id_rprte_audtria_trza'', v_id_rprte_audtria_trza);',
'                ',
unistr('				-- Validamos que se all\00E1 agregado correctamente. Y lo actualizamos en la sessi\00F3n'),
'                if v_json is not null then',
'                    :P37_JSON := null;',
'					apex_util.set_session_state(''P37_JSON'', v_json);',
'					',
'					pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, ''P37_JSON: '' || v_json, p_nvel_txto => 3);				',
'				end if;',
'				-- Generamos el Blob',
'				begin',
'					v_blob := apex_util.get_print_document( p_application_id     => 66000,',
'															p_report_query_name  => v_gn_d_reportes.nmbre_cnslta,',
'															p_report_layout_name => v_gn_d_reportes.nmbre_plntlla,',
'															p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla,',
'															p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo);',
'				exception ',
'					when others then',
'						v_blob := null;',
'				end;',
'				-- Validamos que se alla registrado correctamente el blob',
'				if v_blob is not null then ',
'					begin',
'						pkg_gn_reportes_auditoria.prc_rg_dcmnto_reporte_auditoria(p_cdgo_clnte   			=> :F_CDGO_CLNTE',
'																				, p_id_rprte_audtria_trza	=> v_id_rprte_audtria_trza',
'																				, p_id_rprte				=> v_gn_d_reportes.id_rprte',
'																				, p_id_sjto_impsto			=> v_id_sjto_impsto',
'																				, p_id_usrio				=> :F_ID_USRIO',
'																				, p_file_name				=> v_file_name',
'																				, p_file_mimetype			=> ''application/pdf''',
'																				, p_file_blob				=> v_blob',
'																				, o_cdgo_rspsta   			=> v_cdgo_rspsta',
'																				, o_mnsje_rspsta  			=> v_mnsje_rspsta);',
'',
'						pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, ''Respuesta de prc_rg_dcmnto_reporte_auditoria: '' || ''o_cdgo_rspsta: '' || v_cdgo_rspsta || '' - '' || ''o_mnsje_rspsta: '' || v_mnsje_rspsta, 3);',
'					',
'					exception',
'						when others then',
'                            if sqlcode = -20876 then',
'                                -- descarga exitosa/stop esperado: ignorar',
'                                null;',
'                            else',
'                                pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, ''Error al registrar la auditoria: '' || sqlerrm, 3);',
'                            end if;',
'					end;',
'					-- Descargamos el blob',
'					begin',
'',
'						htp.init;',
'						owa_util.mime_header(''application/pdf'', FALSE);',
'						htp.p(''Content-length: '' || dbms_lob.getlength(v_blob));',
'						htp.p(''Content-Disposition: '' || v_content_disposition || ''; filename="'' || v_file_name || ''.pdf"'');',
'						owa_util.http_header_close;',
'						wpg_docload.download_file(v_blob);',
'						apex_application.stop_apex_engine;',
'						',
'					exception ',
'						when others then',
'							v_mnsje := ''Error: '' || sqlerrm || '' Code: '' || sqlcode;',
'							pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, v_mnsje, 3);',
'							pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, sqlerrm, 3);',
'							raise_application_error( -20002 , v_mnsje);',
'					end;',
'				end if;            ',
'            exception ',
'                when others then',
'                       pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, ''Error al llamar al procedimiento prc_rg_dcmnto_reporte_auditoria: '' || SQLCODE || '' '' || DBMS_UTILITY.FORMAT_ERROR_STACK || ''@'' || DBMS_UTILITY.FORMAT_CALL_STACK,'
||' 3);',
'            end;        ',
'        end if;',
'	else',
'		begin',
'			apex_util.download_print_document ( p_file_name           => v_file_name',
'											  , p_content_disposition => v_content_disposition',
'											  , p_application_id      => v_app_id',
'											  , p_report_query_name   => v_gn_d_reportes.nmbre_cnslta ',
'											  , p_report_layout_name  => v_gn_d_reportes.nmbre_plntlla ',
'											  , p_report_layout_type  => v_gn_d_reportes.cdgo_frmto_plntlla',
'											  , p_document_format     => v_gn_d_reportes.cdgo_frmto_tpo ',
'											  );',
'		exception',
'			 when others then',
'				v_mnsje := ''Error: '' || sqlerrm || '' Code: '' || sqlcode;',
'				pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, v_mnsje, 3);',
'				pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, sqlerrm, 3);',
'				raise_application_error( -20002 , v_mnsje);',
'		end;',
'	end if;',
'    v_mnsje := ''Fin del Proceso Imprimir APP:'' || :APP_ID  || '' PAG: '' || :APP_PAGE_ID;',
'	pkg_sg_log.prc_rg_log(:F_CDGO_CLNTE, null, v_nmbre_up, v_nivel, v_mnsje, 1);',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_comment=>'Proceso que Imprime los Reportes.'
);
end;
/
