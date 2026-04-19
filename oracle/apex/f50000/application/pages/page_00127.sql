prompt --application/pages/page_00127
begin
wwv_flow_api.create_page(
 p_id=>127
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Visor'
,p_page_mode=>'MODAL'
,p_step_title=>'Visor'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/tiff.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*function visor(file) {',
'    debugger;',
'    var container = document.getElementById(''visor'');',
'    if (container.childElementCount > 0)',
'        container.children[0].remove();',
'    if (file) {        ',
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
'*/',
'function visor(file) {',
'    debugger;',
'    var container = document.getElementById(''visor'');',
'    if (container.childElementCount > 0)',
'        container.children[0].remove();',
'    if (file) {',
'        var v_url = window.URL.createObjectURL(file);',
'        var visor;',
'        if (file.type == ''image/tiff'') {',
'            var xhr = new XMLHttpRequest();',
'            xhr.responseType = ''arraybuffer'';',
'            xhr.open(''GET'', v_url);',
'            xhr.onload = function(e) {',
'                var tiff = new Tiff({ buffer: xhr.response });',
'                var canvas = tiff.toCanvas();',
'                //canvas.setAttribute(''width'', ''100%'');',
'                //canvas.setAttribute(''height'', ''100%'');',
'                $(canvas).css({',
'                    "max-width": "1000000px",',
'                    "width": "100%",',
'                    "height": "auto",',
'                    "display": "block",',
'                    "padding-top": "10px"',
'                }).addClass("preview");',
'                container.append(canvas);',
'            };',
'            xhr.send();',
'        } else {',
'            if (file.type !== ''application/pdf'') {',
'                 // Establecer CSS usando jQuery',
'                $("#visor").css({',
'                    "display": "flex",',
'                    "justify-content": "center",',
'                    "align-items": "center",',
'                    "width": "100%",',
'                    "height": "100%",',
'                    "margin": "auto"',
'                });',
'            };',
'            visor = document.createElement(''embed'');',
'            var obj = document.createElement(''object'');',
'            obj.setAttribute(''data'', v_url);',
'            obj.setAttribute(''width'', ''100%'');',
'            obj.setAttribute(''height'', ''100%'');',
'            obj.setAttribute(''type'', file.type);',
'            obj.append(visor);',
'            visor.setAttribute(''class'', ''pdfobject'');',
'            visor.setAttribute(''src'', v_url);',
'            visor.setAttribute(''type'', file.type);',
'            visor.setAttribute(''style'', ''overflow: auto; width: 100%; height: 100%;'');',
'            visor.setAttribute(''internalinstanceid'', ''29'');',
'            container.append(obj);',
'        }',
'',
'    }',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function ver() {',
'    var $waitPopup = apex.widget.waitPopup();',
'    try {',
'        var docUrl = ''f?p=&APP_ID.:127:&APP_SESSION.:APPLICATION_PROCESS=DOWNLOADFILE:::'';',
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
'}',
''))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'95%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JADIES'
,p_last_upd_yyyymmddhh24miss=>'20240613120914'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(86525405237718801)
,p_plug_name=>'Viewer'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(29552524947068508)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="visor" class="pdfobject-container" ></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(36960163891869114)
,p_name=>'P127_COLUMNA_BFILE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(84984825738475137)
,p_name=>'P127_CONSULTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86100580318419838)
,p_name=>'P127_NOMBRE_TABLA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86100641213419839)
,p_name=>'P127_COLUMNA_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86100756355419840)
,p_name=>'P127_COLUMNA_MIME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86100837765419841)
,p_name=>'P127_COLUMNA_CLAVE_PRIMARIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86100985963419842)
,p_name=>'P127_COLUMNA_FILENAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86268296034343462)
,p_name=>'P127_VALOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122268139725567729)
,p_name=>'P127_COLUMNA_CLAVE_SECUNDARIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(122268244584567730)
,p_name=>'P127_VALOR_SECUNDARIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(86525405237718801)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(84985008191475139)
,p_computation_sequence=>10
,p_computation_item=>'P127_CONSULTA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_sql varchar2(3000);',
'begin',
'    /*Consulta Base*/',
'    v_sql :=',
'        ''select ''||:P127_COLUMNA_FILENAME||'',''',
'                 ||:P127_COLUMNA_BLOB||'',''',
'                 ||:P127_COLUMNA_MIME||'',''',
'                 ||nvl(:P127_COLUMNA_BFILE, ''FILE_BFILE'' ) || ',
'        '' from ''||:P127_NOMBRE_TABLA||',
'        '' where ''||:P127_COLUMNA_CLAVE_PRIMARIA||''=''||:P127_VALOR;  ',
'    /*Consulta con clave secundaria*/',
'    if(:P127_COLUMNA_CLAVE_SECUNDARIA is not null)then',
'        v_sql := v_sql ||'' and ''||:P127_COLUMNA_CLAVE_SECUNDARIA||''=''||:P127_VALOR_SECUNDARIO;',
'    end if;',
'     --apex_application.g_print_success_message := ''<span style="color:white">ITEM [''||v_sql||'']!'';',
'     return v_sql;',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(86268629487343475)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOADFILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    file_name         varchar2(2000);',
'    file_blob         blob;',
'    file_mimetype     varchar2(1000);',
'    file_bfile        BFILE; ',
'    o_cdgo_rspsta     number;',
'    o_mnsje_rspsta     varchar2(4000);',
'begin',
'',
'   execute immediate :P127_CONSULTA into  file_name, file_blob, file_mimetype , file_bfile;',
'    ',
'    if(file_blob is not null and file_name is not null and file_mimetype is not null)then',
'        htp.init;',
'        owa_util.mime_header(file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(file_blob);',
'        apex_application.stop_apex_engine;',
'',
'    elsif  (file_blob is null and file_bfile is not null) then',
'             pkg_gd_utilidades.prc_co_archco_dsco ( p_bfile          => file_bfile',
'                                                    , o_archvo_blob  => file_blob ',
'                                                    , o_cdgo_rspsta  => o_cdgo_rspsta ',
'                                                    , o_mnsje_rspsta => o_mnsje_rspsta) ; ',
'        ',
'       ',
'        htp.init;',
'        owa_util.mime_header(file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(file_blob);',
'        apex_application.stop_apex_engine;',
'',
'',
'    end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
