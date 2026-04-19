prompt --application/pages/page_00018
begin
wwv_flow_api.create_page(
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Visor de Actos'
,p_page_mode=>'MODAL'
,p_step_title=>'Visor de Actos'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function visor(file) {',
'    var container = document.getElementById(''visor'');',
'    if (container.childElementCount > 0)',
'        container.children[0].remove();',
'    if (file) {',
'        var v_url = window.URL.createObjectURL(file);',
'        var visor = document.createElement(''embed'');',
'        var obj = document.createElement(''object'');',
'        obj.setAttribute(''data'', v_url);',
'        obj.setAttribute(''width'', ''100%'');',
'        obj.setAttribute(''height'', ''100%'');',
'        obj.setAttribute(''type'', file.type);',
'        obj.append(visor);',
'        visor.setAttribute(''class'', ''pdfobject'');',
'        visor.setAttribute(''src'', v_url);',
'        visor.setAttribute(''type'', file.type);',
'        visor.setAttribute(''style'', ''overflow: auto; width: 100%; height: 100%;'');',
'        visor.setAttribute(''internalinstanceid'', ''29'');',
'        container.append(obj);',
'    }',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function ver() {',
'    var $waitPopup = apex.widget.waitPopup();',
'    try {',
'        var docUrl = ''f?p=&APP_ID.:18:&APP_SESSION.:APPLICATION_PROCESS=DOWNLOADFILE:::'';',
'        await fetch(docUrl, {',
'            method: ''GET'',',
'            cache: ''default''',
'        }).then(resp => {',
'            return resp.blob()',
'        }).then(resp => {',
'            visor(resp);',
'        });',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'ver();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'95%'
,p_dialog_chained=>'N'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20221219135754'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(159949253790405937)
,p_plug_name=>'Viewer'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="visor" class="pdfobject-container" ></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73424496851687153)
,p_name=>'P18_CONSULTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73424856163687167)
,p_name=>'P18_VALOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73425225555687173)
,p_name=>'P18_NOMBRE_TABLA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73425664006687175)
,p_name=>'P18_COLUMNA_FILENAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73426005488687175)
,p_name=>'P18_COLUMNA_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73426401317687176)
,p_name=>'P18_COLUMNA_MIME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73426827437687176)
,p_name=>'P18_COLUMNA_CLAVE_PRIMARIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73427276763687176)
,p_name=>'P18_COLUMNA_CLAVE_SECUNDARIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(73427607948687179)
,p_name=>'P18_VALOR_SECUNDARIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128472767246988307)
,p_name=>'P18_FILE_BFILE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(159949253790405937)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(73428122895687189)
,p_computation_sequence=>10
,p_computation_item=>'P18_CONSULTA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_sql varchar2(3000);',
'begin',
'    /*Consulta Base*/',
'    if :P18_FILE_BFILE is null then ',
'        :P18_FILE_BFILE := ''FILE_BFILE'' ;',
'     end if;',
'    ',
'    insert into muerto (n_001, v_001) values (55, ''entro a armar la consulta''); commit;',
'    v_sql :=',
'        ''select ''||:P18_COLUMNA_FILENAME||'',''',
'                 ||:P18_COLUMNA_BLOB||'',''',
'                 ||:P18_COLUMNA_MIME||'',''',
'                 ||:P18_FILE_BFILE||',
'        '' from ''||:P18_NOMBRE_TABLA||',
'        '' where ''||:P18_COLUMNA_CLAVE_PRIMARIA||''=''||:P18_VALOR;',
'    /*Consulta con clave secundaria*/',
'    if(:P18_COLUMNA_CLAVE_SECUNDARIA is not null)then',
'        v_sql := v_sql ||'' and ''||:P18_COLUMNA_CLAVE_SECUNDARIA||''=''||:P18_VALOR_SECUNDARIO;',
'    end if;',
'     insert into muerto (n_001, v_001) values (55, ''v_sql : ''||v_sql); commit;',
'        return v_sql;',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(73428491658687189)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOADFILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    file_name         varchar2(2000);',
'    file_blob         blob;',
'    file_mimetype     varchar2(1000);',
'    v_id_dcmnto       number;',
'    o_cdgo_rspsta     number;',
'    o_mnsje_rspsta    varchar2(4000);',
'    file_bfile      bfile; ',
'    ',
'begin',
'    execute immediate :P18_CONSULTA into  file_name, file_blob, file_mimetype,file_bfile ;',
'    ',
'    ',
'    if(file_blob is not null and file_name is not null and file_mimetype is not null) then',
'        htp.init;',
'        owa_util.mime_header(file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(file_blob);',
'        apex_application.stop_apex_engine;',
'        ',
'    elsif file_bfile is not null then',
'',
'        pkg_gd_utilidades.prc_co_archco_dsco(p_bfile        => file_bfile',
'                                            ,o_archvo_blob  => file_blob ',
'                                            ,o_cdgo_rspsta  => o_cdgo_rspsta ',
'                                            ,o_mnsje_rspsta => o_mnsje_rspsta) ;',
'',
'          htp.init;',
'            owa_util.mime_header(file_mimetype, FALSE );',
'            htp.p(''Content-length: '' ||dbms_lob.getlength(file_blob));',
'            htp.p(''Content-Disposition: attachment; filename="'' ||file_name || ''"'' );',
'            htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'            owa_util.http_header_close;',
'            wpg_docload.download_file(file_blob);',
'            apex_application.stop_apex_engine;',
'    end if; ',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
