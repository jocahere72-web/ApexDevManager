prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Download Zip'
,p_step_title=>'Download Zip'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'NARDILA'
,p_last_upd_yyyymmddhh24miss=>'20190506191833'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98232560139217101)
,p_plug_name=>'Parametros'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(98232687146217102)
,p_name=>'P12_VGNCIA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(98232560139217101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106881165513937401)
,p_name=>'P12_ARCHIVO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(98232560139217101)
,p_prompt=>'Nuevo'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(173605516837271299)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Download Zip'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_zip_file blob;',
'    v_source_blob bfile;',
'    v_destino_blob blob := empty_blob();',
'begin',
'',
'    for q in (',
'                    select dscrpcion_dfncion_clnte nombre,',
'                           vlor query',
'                      from df_c_definiciones_cliente',
'                     where cdgo_clnte = :f_cdgo_clnte',
'                       and cdgo_dfncion_clnte in (''A01'',''A02'',''A2A'',''A2B'',''A2C'',''A04'',''A05'',''A06'',''A07'',''A08'',''A91'')',
'              )',
'    loop',
'            ',
'        q.query := replace( q.query, ''!VGNCIA!''  , :P12_VGNCIA);',
'        q.query := replace( q.query, ''!CLNTE!''   , :F_CDGO_CLNTE);',
'        q.query := replace( q.query, ''!ARCHIVO!'' , :P12_ARCHIVO);',
'',
'',
'        as_xlsx.query2sheet( q.query );',
'        as_xlsx.save( ''LOGS'', q.nombre||''.xlsx'' );',
'        dbms_lob.createtemporary(v_destino_blob, true);',
'        ',
'        v_source_blob := bfilename(''LOGS'', q.nombre||''.xlsx'');',
'        ',
'        dbms_lob.open(v_source_blob, dbms_lob.lob_readonly);',
'        dbms_lob.loadfromfile( dest_lob => v_destino_blob,',
'                               src_lob  => v_source_blob,',
'                               amount   => dbms_lob.getlength(v_source_blob));',
'',
'        dbms_lob.close(v_source_blob);',
'',
'        --Comprime los Archivos Encontrados',
'        apex_zip.add_file (',
'                             p_zipped_blob => l_zip_file,',
'                             p_file_name   => q.nombre||''.xlsx'',',
'                             p_content     => v_destino_blob ',
'                           );',
'',
'        dbms_lob.freetemporary(v_destino_blob);',
'            ',
'    end loop;',
'    ',
unistr('      --una vez que los \00FAltimos archivos se hayan comprimido, termina el archivo zip'),
'      apex_zip.finish( p_zipped_blob =>  l_zip_file);',
'      owa_util.mime_header(''application/octet'', false); ',
'      htp.p(''Content-length: ''|| dbms_lob.getlength(l_zip_file));',
'      htp.p(''Content-Disposition: attachment; filename="Anexos.zip"'');',
'      owa_util.http_header_close;',
'      wpg_docload.download_file(l_zip_file);',
'',
'exception',
'     when others then',
'          raise_application_error( -20326 ,''No existen las definiciones del cliente para exportar los anexos.'' );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
