prompt --application/pages/page_00208
begin
wwv_flow_api.create_page(
 p_id=>208
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Reliquidaci\00F3n Predial - Aprobar')
,p_step_title=>unistr('Reliquidaci\00F3n Predial - Aprobar')
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20210519113230'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108640468913347244)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br>',
'<h5>',
'    <div style="text-align: center;">',
'        <b>',
'            <i>Opciones <i class="fa fa-gears" aria-hidden="true"></i>',
'			</i>',
'        </b>',
'    </div>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108640721456347247)
,p_plug_name=>'Flujo'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.WORKFLOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'F_ID_INSTNCIA_FLJO'
,p_attribute_01=>'&F_CDGO_CLNTE.'
,p_attribute_02=>'&F_ID_INSTNCIA_FLJO.'
,p_attribute_03=>'&F_ID_FLJO_TREA.'
,p_attribute_04=>'true'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(111270858659614206)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <div style="text-align: center; padding: 10px 0 px 0px 10px;">',
'        <b>',
'            <i>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i>',
'            </i>',
'        </b>',
'    </div>',
'</h5>',
'',
'<i>',
'    Funcionalidad que permite: <br/><br/>',
'    <b>1.</b> Registrar una tarifa para reliquidar un Referencia Catastral.<br/><br/>',
'    <b>2.</b> Aprobar o Rechazar la tarifa para reliquidar.<br/><br/>  ',
'    ',
unistr('    Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(222478307173856750)
,p_plug_name=>'Reliquidar Predial - Aprobar'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'GI_G_PREDIOS_LIQUIDA'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(112035368208282901)
,p_plug_name=>'Datos Sujeto'
,p_parent_plug_id=>wwv_flow_api.id(222478307173856750)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'P208_ID_SJTO_IMPSTO'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108640521489347245)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(108640468913347244)
,p_button_name=>'BTN_APROBAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.id_prdio_lqda',
' from v_gi_g_predios_liquida        a',
' join wf_g_instancias_transicion    b on a.id_instncia_fljo    = b.id_instncia_fljo and a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
' join wf_d_flujos_tarea             c on b.id_fljo_trea_orgen = c.id_fljo_trea ',
'  and b.id_estdo_trnscion           in (1,2)',
'  and b.id_usrio                    = :F_ID_USRIO',
'where cdgo_clnte                    = :F_CDGO_CLNTE',
'  and a.estdo                       = ''RGS'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111244555841968354)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(222478307173856750)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111243790234968353)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(222478307173856750)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:208:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111244919250968356)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(222478307173856750)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P208_ID_PRDIO_LQDA'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_grid=>false
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(111244168558968354)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(222478307173856750)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108640194027347241)
,p_name=>'P208_ID_LQDCION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_prompt=>unistr('Id. Liquidaci\00F3n')
,p_source=>'ID_LQDCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P208_ID_LQDCION'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108640225109347242)
,p_name=>'P208_ID_USRIO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_source=>'ID_USRIO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108640394471347243)
,p_name=>'P208_FCHA_PRCSO'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_source=>'FCHA_PRCSO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111245366060968360)
,p_name=>'P208_ID_PRDIO_LQDA'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_source=>'ID_PRDIO_LQDA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111245712134968361)
,p_name=>'P208_RFRNCIA_IGAC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_prompt=>unistr('Identificaci\00F3n Sujeto')
,p_source=>'RFRNCIA_IGAC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111246154001968361)
,p_name=>'P208_TRFA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_prompt=>'Tarifa'
,p_source=>'TRFA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111270354556614201)
,p_name=>'P208_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_prompt=>'Estado'
,p_source=>'ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select descrpcion_estdo d, cdgo_estdo r',
'from  gi_d_estados_predios_liquida'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'20%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111270568034614203)
,p_name=>'P208_ID_INSNTCIA_FLJO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_source=>'ID_INSTNCIA_FLJO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111270607583614204)
,p_name=>'P208_ID_FLJO_TREA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_item_source_plug_id=>wwv_flow_api.id(222478307173856750)
,p_source=>'ID_FLJO_TREA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(111270796080614205)
,p_name=>'P208_MNSJE_RSPSTA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(112035508077282903)
,p_name=>'P208_ID_SJTO_IMPSTO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(222478307173856750)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108640680390347246)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aprobar Reliquidacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  p_id_usrio 		    number;',
'  p_cdgo_clnte 		    number;',
'  p_id_impsto           number;',
'  p_id_impsto_sbmpsto   number;',
'  p_rfrncia_igac        varchar2(25);',
'  o_cdgo_rspsta         number;',
'  o_mnsje_rspsta        varchar2(200);',
'begin',
'',
'    p_id_usrio 	    := :F_ID_USRIO;',
'    p_cdgo_clnte 	:= :F_CDGO_CLNTE;',
'    ',
'    begin',
'        ',
'        /*if ( :P208_ESTDO = ''RGS'' ) then',
unistr('             raise_application_error(-20001, ''1. Error p\00E1gina: El estado debe ser Rechazado o Aprobado'');'),
'        end if;*/',
'        ',
'        select 	id_impsto,   id_impsto_sbmpsto',
'        into	p_id_impsto, p_id_impsto_sbmpsto',
'        from	df_i_impuestos_subimpuesto',
'        where	cdgo_clnte  = p_cdgo_clnte',
'        and 	cdgo_impsto_sbmpsto = ''IPU'';',
'',
'        pkg_gi_liquidacion_predio_2.prc_ge_rlqdcion_pntual_prdial(',
'                                                                p_id_usrio 		    => p_id_usrio,',
'                                                                p_cdgo_clnte 	    => p_cdgo_clnte,',
'                                                                p_id_impsto 	    => p_id_impsto,',
'                                                                p_id_impsto_sbmpsto => p_id_impsto_sbmpsto,',
'                                                                p_rfrncia_igac 	    => :P208_RFRNCIA_IGAC,',
'                                                                p_id_prdio_lqda     => :P208_ID_PRDIO_LQDA,',
'                                                                p_estdo             => :P208_ESTDO,',
'                                                                o_cdgo_rspsta 	    => o_cdgo_rspsta,',
'                                                                o_mnsje_rspsta 	    => o_mnsje_rspsta',
'                                                              );',
'        :P208_MNSJE_RSPSTA := o_mnsje_rspsta;',
'        if (o_cdgo_rspsta <> 0) then',
unistr('             raise_application_error(-20001, ''5. Error p\00E1gina: '' || o_mnsje_rspsta);'),
'        end if;',
'            ',
'     exception',
'        when others then ',
'            rollback;',
unistr('            raise_application_error(-20001, ''10. Error p\00E1gina: '' ||o_mnsje_rspsta);'),
'    end; ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(108640521489347245)
,p_process_success_message=>'&P208_MNSJE_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111313673587001701)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Al Finalizar Flujo'
,p_process_sql_clob=>'null;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'FINISH_WORKFLOW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Ok'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(112035492185282902)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Consulta Sujeto Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_sjto_impsto   varchar2(25);',
'    v_id_impsto        number;',
'    v_idntfccion       varchar2(25);',
'begin',
'    ',
'    select id_impsto',
'    into   v_id_impsto',
'    from   df_c_impuestos',
'    where  cdgo_clnte = :F_CDGO_CLNTE',
'    and    cdgo_impsto = ''IPU'';',
'    ',
'    select rfrncia_igac',
'    into   v_idntfccion',
'    from   gi_g_predios_liquida',
'    where  id_prdio_lqda = :P208_ID_PRDIO_LQDA;    ',
'    ',
'    select id_sjto_impsto',
'      into v_id_sjto_impsto',
'      from v_si_i_sujetos_impuesto',
'     where cdgo_clnte    = :F_CDGO_CLNTE',
'       and id_impsto     = v_id_impsto',
'       and (idntfccion_sjto = v_idntfccion or idntfccion_antrior = v_idntfccion);      ',
'    ',
'    --:P207_RSPSTA := '''';',
'    :P208_ID_SJTO_IMPSTO := v_id_sjto_impsto;',
'exception',
'    when no_data_found then ',
'    :P208_ID_SJTO_IMPSTO := null;',
'    --:P207_RSPSTA := ''No Existe el Sujeto Impuesto'';',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(111246517717968363)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_api.id(222478307173856750)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Create Form'
);
end;
/
