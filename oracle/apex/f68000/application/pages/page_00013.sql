prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(71889596252951620)
,p_name=>'Scanner'
,p_step_title=>'Scanner'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var fileStorage = ''11111'';'
,p_css_file_urls=>'https://use.fontawesome.com/releases/v5.7.0/css/all.css'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191206083048'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37002511190072143)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<div class="container">',
'        <br>',
'        <div class="card" style="width:90rem">',
'            <div class="card-header">',
'                <span id="arrows-alt">',
'                    <i class="fas fa-arrows-alt"></i>',
'                </span>',
'                <span id="cog">',
'                    <i class="fas fa-cog"></i>',
'                </span>',
'                <span id="trash">',
'                    <i class="fas fa-trash-alt"></i>',
'                </span>',
'                <span id="plus-circle">',
'                    <i class="fas fa-plus-circle"></i>',
'                </span>',
'            </div>',
'            <div class="card-body">',
'                <div class="container"></div>',
'            </div>',
'        </div>',
'    </div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(37002665464072144)
,p_plug_name=>'New'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(71815592755951563)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(92066379014987303)
,p_branch_name=>unistr('Ir a P\00E1gina 18')
,p_branch_action=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP,18:P18_APP_ID,P18_APP_PAGE_ID:&APP_ID.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78180900940384908)
,p_validation_name=>'validar correo'
,p_validation_sequence=>10
,p_validation=>'P13_EMAIL'
,p_validation2=>'^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Debe escribir un correo valido'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(77186150598636303)
,p_name=>'al cerrar la ventana modal'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7578393403079338)
,p_event_id=>wwv_flow_api.id(77186150598636303)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var d = $(''[src*="f?p=68000"]'')[0].contentWindow.file_blob;',
'console.log(d);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7578165647079336)
,p_name=>'New'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7578236339079337)
,p_event_id=>wwv_flow_api.id(7578165647079336)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'console.log(ddd);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78181151142384910)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'PLUGIN_PROCESO_WORKFLOW'
,p_process_name=>'Ejecutar WorkFlow'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(85594305703167002)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'v_mime  varchar2(48);',
'v_length  number;',
'v_file_name varchar2(2000);',
'lob_loc  blob;',
'begin',
'',
'',
'select a.file_mimetype ',
'     , a.file_blob ',
'     , a.file_name ',
'     , dbms_lob.getlength(a.file_blob)',
'  into v_mime',
'     , lob_loc',
'     , v_file_name',
'     , v_length',
'  from pq_g_documentos a ',
'  join pq_g_solicitudes    b   on  b.id_slctud     =   a.id_slctud',
'  where       b.id_instncia_fljo  =   438',
'  and         a.id_dcmnto         =   33;',
'',
'--',
'-- set up http header',
'--',
'   -- use an nvl around the mime type and',
'   -- if it is a null set it to application/octect',
'   -- application/octect may launch a download window from windows',
'owa_util.mime_header( nvl(v_mime,''application/octet''), false );',
'',
'-- set the size so the browser knows how much to download',
'htp.p(''content-length: '' || v_length);',
'-- the filename will be used by the browser if the users does a save as',
'htp.p(''content-disposition:  attachment; filename="''||replace(replace(substr(v_file_name,instr(v_file_name,''/'')+1),chr(10),null),chr(13),null)|| ''"'');',
'-- close the headers',
'owa_util.http_header_close;',
'-- download the blob',
'wpg_docload.download_file( lob_loc );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'PRUEBA'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110434199612320002)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_html      clob    :=  pkg_gn_generalidades.fnc_ge_dcmnto(''{"ID_PRSCRPCION" : 98, "CDGO_CLNTE" : 6}'', 77);',
'    v_tam       number  := length(v_html);',
'    v_max       number  := 1;',
'    v_partition varchar2(4000);',
'    v_count     number := 0;',
'    ',
'begin',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''msg'', ''Documento generado exitosamente !!'');',
'    apex_json.write(''doc'', v_html);',
'    apex_json.close_object;',
'exception',
'    when others then',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'', sqlerrm);',
'        apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110737143292199701)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'save_documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_clob     clob ;',
'    v_count    number;',
'begin',
'    for i in 1..apex_application.g_f01.count',
'    loop',
'        v_clob := v_clob || apex_application.g_f01(i);',
'        v_count := i;',
'    end loop;',
'    delete muerto;',
'    insert into muerto(x) values ('' count '' || v_count || '' v_clob => '' || v_clob);',
'    apex_json.open_object;',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''msg'', ''Todo ok'');',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(120985134179098402)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargarArchivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_blob blob;',
'  l_filename varchar2(200);',
'  l_mime_type varchar2(200);',
'  l_token varchar2(32000);',
'begin ',
'  l_filename := apex_application.g_x01;',
'  l_mime_type := nvl(apex_application.g_x02, ''application/octet-stream'');',
'  /*delete from muerto;',
'  commit;*/',
'  -- build BLOB from f01 30k array (base64 encoded)',
'  --dbms_lob.createtemporary(l_blob, false, dbms_lob.session);',
'  for i in 1 .. apex_application.g_f01.count loop',
'    --l_token := wwv_flow.g_f01(i);',
'    insert into muerto (numero,x) values (i, ''Llego => '' || systimestamp);',
'    --commit;',
'    /*if length(l_token) > 0 then',
'      dbms_lob.append(',
'        dest_lob => l_blob,',
'        src_lob => to_blob(utl_encode.base64_decode(utl_raw.cast_to_raw(l_token)))',
'      );',
'    end if;*/',
'  end loop;',
' /*',
'  -- add collection member (only if BLOB is not null)',
'  if dbms_lob.getlength(l_blob) is not null then    ',
'    insert into muerto (x,archivo) values (''subido'' , l_blob );',
'  end if;',
' */',
'  apex_json.open_object;',
'  apex_json.write(',
'    p_name => ''result'',',
'    p_value => ''success''',
'  );',
'  apex_json.close_object;',
'exception',
'  when others then',
'    apex_json.open_object;',
'    apex_json.write(',
'      p_name => ''result'',',
'      p_value => ''fail''',
'    );',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(121889915845102304)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargarArchivo1'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_blob             blob             := empty_blob();',
'    p_apex_file_name   varchar2(4000)   := apex_application.g_f01(1);',
'begin',
'    begin',
'        select blob_content',
'          into l_blob',
'          from apex_application_files',
'         where name = p_apex_file_name;',
'    ',
'    exception ',
'        when others then ',
'            apex_json.open_object;',
'            apex_json.write( p_name => ''result''',
'                           , p_value => ''fail''',
'                           );',
'            apex_json.close_object;',
'    end;',
'     ',
'    delete from apex_application_files where name = p_apex_file_name;',
'     ',
'    delete from muerto;',
'    insert into muerto (x,archivo) values (''subido ''  || p_apex_file_name , l_blob );',
'    apex_json.open_object;',
'    apex_json.write( p_name => ''result''',
'                   , p_value => ''success''',
'                   );',
'    apex_json.close_object;',
'',
' exception ',
'    when others then ',
'        apex_json.open_object;',
'        apex_json.write( p_name => ''result''',
'                       , p_value => ''fail''',
'                       );',
'        apex_json.close_object;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14533793160096303)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_array;',
'apex_json.open_object;',
'apex_json.write(''d'',''dos'');',
'apex_json.write(''v'',''2'');',
'apex_json.close_object;',
'apex_json.open_object;',
'apex_json.write(''d'',''tres'');',
'apex_json.write(''v'',''3'');',
'apex_json.close_object;',
'apex_json.open_object;',
'apex_json.write(''d'',''cuatro'');',
'apex_json.write(''v'',''4'');',
'apex_json.close_object;',
'apex_json.open_object;',
'apex_json.write(''d'',''cinco'');',
'apex_json.write(''v'',''5'');',
'apex_json.close_object;',
'apex_json.open_object;',
'apex_json.write(''d'',''seis'');',
'apex_json.write(''v'',''6'');',
'apex_json.close_object;',
'apex_json.close_all;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
