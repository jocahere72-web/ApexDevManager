prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>'Constructor'
,p_page_mode=>'MODAL'
,p_step_title=>'Constructor'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'80%'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20211020110506'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(47465141629509602)
,p_plug_name=>'Consulta General'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(58531762414761102)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(47465141629509602)
,p_button_name=>'BTN_NVA_RGLA'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Nueva Regla'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_redirect_url=>'f?p=50000:907:&SESSION.::&DEBUG.:RP,907:P907_APP_ID,P907_PAGE_ID,P907_COD_PROCESO:&P10_APP_ID.,&P10_APP_PAGE_ID.,FISCA'
,p_icon_css_classes=>'fa-file-sql'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47465344067509604)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(47465141629509602)
,p_button_name=>'BTN_PRCSAR_SQL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Regla'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(141026731090374219)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(47465141629509602)
,p_button_name=>'BTN_PRCSAR_SQL_DES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar Regla desconocido'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_icon_css_classes=>'fa-gears'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(47465488176509605)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(47465141629509602)
,p_button_name=>'CANCEL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(49142215618313005)
,p_branch_name=>'Ir a la pagina 8'
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47465200956509603)
,p_name=>'P10_ID_CNSLTA_MSTRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(47465141629509602)
,p_prompt=>unistr('Regla de selecci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.nmbre_cnslta,',
'            a.id_cnslta_mstro',
'from        cs_g_consultas_maestro  a',
'inner join  cs_d_procesos_sql       b on b.id_prcso_sql   =   a.id_prcso_sql',
'where       b.cdgo_clnte            =   :F_CDGO_CLNTE',
'and         b.cdgo_prcso_sql        =   ''FISCA''',
'and         a.tpo_cndcion           is  null',
'and         a.id_cnslta_mstro_gnral is not  null'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36555174524968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47880910335164701)
,p_name=>'P10_ID_CNDDTO_LTE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(47465141629509602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58557596626086301)
,p_name=>'P10_APP_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(47465141629509602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58557670424086302)
,p_name=>'P10_APP_PAGE_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(47465141629509602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141111121100670802)
,p_name=>'P10_RSPSTA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(47465141629509602)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(140798937349517635)
,p_name=>'Al cambiar Archivo'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140799074572517636)
,p_event_id=>wwv_flow_api.id(140798937349517635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function Restringir_Archivo_Tipo($this) {',
'',
'    var file = $this.triggeringElement.files[0];',
'    ',
'    if (file !== undefined ) {',
'        vTipo = new String( file.type );',
'',
'        //alert(vTipo);',
'',
'        if( vTipo != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" ) {',
'      //  if( vTipo != "text/plain") { //vTipo != "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" && ',
'            //alert(''Diferente'');',
'',
unistr('            // Si la extensi\00F3n no es de archivo de Excel o txt --> Presentar mensaje de Error'),
'            Swal.fire({',
'                icon: ''error'',',
'                title:  ''<H2 >Carga de Archivo</H2>'',',
'                html: ''El archivo debe ser de tipo Excel.''// Excel o',
'            });',
'',
'            apex.item(''P14_FILE_BLOB'').setValue("");',
'',
'        }',
'    }',
'}',
'',
'',
'Restringir_Archivo_Tipo(this);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(140800224709517648)
,p_name=>'Al cambiar tipo de proceso'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_SLCCION_TIPO_PRCSO'
,p_condition_element=>'P10_SLCCION_TIPO_PRCSO'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(140800354059517649)
,p_event_id=>wwv_flow_api.id(140800224709517648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(47465141629509602)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141025015937374202)
,p_event_id=>wwv_flow_api.id(140800224709517648)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(47465141629509602)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141025285966374204)
,p_name=>'ocultar regiones cuando esta nulo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_SLCCION_TIPO_PRCSO'
,p_condition_element=>'P10_SLCCION_TIPO_PRCSO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141025406344374206)
,p_event_id=>wwv_flow_api.id(141025285966374204)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(47465141629509602)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(47465691381509607)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Obtener Poblaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar(1000); ',
'',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_msva(p_cdgo_clnte       =>  :F_CDGO_CLNTE,',
'                                                       p_id_usrio         =>  :F_ID_USRIO,',
'                                                       p_id_cnslta_mstro  =>  :P10_ID_CNSLTA_MSTRO,',
'                                                       p_id_fsclzcion_lte =>  :P10_ID_CNDDTO_LTE,',
'                                                       o_cdgo_rspsta      =>  v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta     =>  v_mnsje_rspsta);',
'                                                       ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20000, v_cdgo_rspsta || '' - '' || v_mnsje_rspsta);',
'    end if;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(47465344067509604)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141026810742374220)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Obtener Poblaci\00F3n_Des')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar(1000); ',
'',
'begin',
'',
'    pkg_fi_fiscalizacion.prc_rg_fsclzcion_pblcion_desc(p_cdgo_clnte       =>  :F_CDGO_CLNTE,',
'                                                       p_id_usrio         =>  :F_ID_USRIO,',
'                                                       p_id_cnslta_mstro  =>  :P10_ID_CNSLTA_MSTRO,',
'                                                       p_id_fsclzcion_lte =>  :P10_ID_CNDDTO_LTE,',
'                                                       o_cdgo_rspsta      =>  v_cdgo_rspsta,',
'                                                       o_mnsje_rspsta     =>  v_mnsje_rspsta);',
'                                                       ',
'    if v_cdgo_rspsta > 0 then',
'        raise_application_error(-20000, v_cdgo_rspsta || '' - '' || v_mnsje_rspsta);',
'    end if;',
'',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(141026731090374219)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141111002449670801)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta              number;',
'    v_id_carga                 number;',
'    v_mnsje_rspsta             varchar2(500);',
'    v_id_archvo_cnddto         number ;',
'begin',
'    ',
'    SELECT  a.id_crga,',
'            a.id_archvo_cnddto',
'    into    v_id_carga,',
'            v_id_archvo_cnddto',
'    FROM fi_g_archivos_candidato a ',
'    where a.id_archvo_cnddto = :P10_ID_CNSLTA_ARCHIVO;',
'    ',
'   -- insert into muerto(v_001, v_002, t_001, n_001) values(''examinarExogena'', ''v_id_archvo_cnddto ->''||v_id_archvo_cnddto,systimestamp, :F_CDGO_CLNTE); commit;',
'    ',
'      pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna_sjto( p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                    p_id_archvo_cnddto    => 122, --v_id_archvo_cnddto,',
'                                                    p_id_usrio             => :F_ID_USRIO,',
'                                                    p_id_carga            => 18, --v_id_carga,',
'                                                    p_id_fsclzcion_lte      => 1342, --:P10_ID_CNDDTO_LTE,',
'                                                    o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta         => v_mnsje_rspsta);                                                        ',
'                                                          ',
'       if(v_cdgo_rspsta <> 0) then',
'                 raise_application_error(-20001, ''1. Error: '' || v_mnsje_rspsta);',
'       else',
'         :P10_RSPSTA := v_mnsje_rspsta;',
'       end if;',
'    ',
'       ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P10_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141026620209374218)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ProcesarArchivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta              number;',
'    v_id_carga                 number;',
'    v_mnsje_rspsta             varchar2(500);',
'    v_id_archvo_cnddto         number ;',
'begin',
'    ',
'    SELECT a.id_crga,',
'            a.id_archvo_cnddto',
'    into v_id_carga,',
'        v_id_archvo_cnddto',
'    FROM fi_g_archivos_candidato a where a.id_archvo_cnddto = :P10_ID_CNSLTA_ARCHIVO;',
'    insert into muerto(v_001, v_002, t_001, n_001) values(''examinarExogena'', ''v_id_archvo_cnddto ->''||v_id_archvo_cnddto,systimestamp, :F_CDGO_CLNTE); commit;',
'    ',
'  pkg_fi_fiscalizacion.prc_rg_infrmcion_fntes_extrna( p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                    p_id_archvo_cnddto    => v_id_archvo_cnddto,',
'                                                    p_id_usrio             => :F_ID_USRIO,',
'                                                    p_id_carga            => v_id_carga,',
'                                                    o_cdgo_rspsta         => v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta         => v_mnsje_rspsta);                                                        ',
'                                                          ',
' ',
'   ',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'',v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'',v_mnsje_rspsta);',
'    apex_json.close_all();',
'exception ',
'    when others then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', 99 );',
'        apex_json.write(''o_mnsje_rspsta'', ''Error al procesar archivo.''||sqlerrm);',
'        apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
