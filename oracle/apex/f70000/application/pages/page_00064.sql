prompt --application/pages/page_00064
begin
wwv_flow_api.create_page(
 p_id=>64
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Generar archivo impresor'
,p_step_title=>'Generar archivo'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200325162331'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12711481506453701)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(1000);',
'    v_id_dcmnto_lte      number;',
'',
'begin',
'    pkg_gi_determinacion.prc_gn_dtrmncion_archvo_plno (p_cdgo_clnte 	  => :F_CDGO_CLNTE, ',
'                                                       p_id_dcmnto_lte    => :P103_ID_DCMNTO_LTE,',
'                                                       o_cdgo_rspsta      => v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta     => v_mnsje_rspsta);',
'    ',
'                                                      ',
'    if v_cdgo_rspsta = 0 then',
unistr('        :P104_RSPSTA := ''Generaci\00F3n del archivo exitosa''; '),
'    else ',
'        :P104_RSPSTA := ''Error al generar los documentos. ''|| v_mnsje_rspsta; ',
'    end if;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
