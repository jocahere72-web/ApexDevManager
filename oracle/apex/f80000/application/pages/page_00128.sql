prompt --application/pages/page_00128
begin
wwv_flow_api.create_page(
 p_id=>128
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Registro de Sujetos Inexistentes'
,p_step_title=>'Registro de Sujetos Inexistentes'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_css_file_urls=>'#IMAGE_PREFIX#css/infortributos/utilidades.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.col-3>.rel-col .col-1{',
'  padding: 0;',
'}',
'',
'.t-Form-inputContainer span.display_only {',
'    font-weight: 400;',
'    font-style: oblique;',
'}',
'',
'.t-Form-label{',
'  font-weight: 700;',
'}',
'',
'.t-Wizard{',
'  max-width: none;',
'}'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DSERRANO'
,p_last_upd_yyyymmddhh24miss=>'20210716172230'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248980586833057914)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Opciones <i class="fa fa-gears" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248983186610066781)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>50
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
'  Funcionalidad que permite procesar y registrar los recaudos por archivo asobancaria.<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(352167123850942009)
,p_plug_name=>'<b>Procesar Archivo</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_read_only_when_type=>'EXISTS'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from et_g_procesos_carga',
' where id_prcso_crga  = :P128_ID_PRCSO_CRGA',
'   and indcdor_prcsdo = ''S'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138956561317741736)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(248980586833057914)
,p_button_name=>'Btn_Regresar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:&P128_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138956953764741737)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(248980586833057914)
,p_button_name=>'Btn_Procesar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select 1',
'    from et_g_procesos_carga',
'   where id_prcso_crga  = :P128_ID_PRCSO_CRGA',
'     and indcdor_prcsdo = ''S''',
'  having count(*) = 0'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138957308338741737)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(248980586833057914)
,p_button_name=>'Btn_Eliminar_Archivo'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar Archivo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de eliminar el archivo asobancaria?'',''Btn_Eliminar_Archivo'')'
,p_button_condition=>'&P128_ID_PRCSO_CRGA.'
,p_button_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138956187398741732)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(248980586833057914)
,p_button_name=>'Btn_Eliminar_Proceso'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar Proceso'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿Esta seguro de eliminar el proceso?'',''Btn_Eliminar_Proceso'')'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from re_g_recaudos a',
'    where a.id_rcdo_cntrol  = :P128_ID_RCDO_CNTROL',
'      and a.cdgo_rcdo_estdo <> ''IN''',
'   having count(*) = 0 ',
'      and :P128_ID_RCDO_CNTROL is not null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(138960082851741773)
,p_branch_name=>'Go To Page 263'
,p_branch_action=>'f?p=&APP_ID.:263:&SESSION.::&DEBUG.:RP:P263_ID_RCDO_CNTROL:&P221_ID_RCDO_CNTROL.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(15955248551916988)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(138960439868741773)
,p_branch_name=>'Go To Page 155'
,p_branch_action=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'Btn_Eliminar_Archivo,Btn_Eliminar_Proceso'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(138960883100741774)
,p_branch_name=>'Go To Page 221'
,p_branch_action=>'f?p=&APP_ID.:221:&SESSION.:&P221_ID_PRCSO_CRGA.:&DEBUG.:221:P221_ID_PRCSO_CRGA,P221_BRANCH,P221_CDGO_TPO_ASBNCRIA:&P221_ID_PRCSO_CRGA.,155,&P221_CDGO_TPO_ASBNCRIA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(138956953764741737)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'   from re_g_recaudos_asobancaria  a',
'  where a.id_prcso_crga = :P128_ID_PRCSO_CRGA',
'    and a.tpo_rgstro    = ''06''',
'    and a.indcdor_rlzdo = ''S''',
' having count(*) = 0 ',
'    and :P128_ID_PRCSO_CRGA is not null'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137165522857738930)
,p_name=>'P128_NMRO_LTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(352167123850942009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137165686745738931)
,p_name=>'P128_OBSRVCION_LTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(352167123850942009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137165727343738932)
,p_name=>'P128_ID_CDGO_ORGEN_SJTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(352167123850942009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(137165801829738933)
,p_name=>'P128_ID_PRCSO_TPO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(352167123850942009)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138951548793741692)
,p_name=>'P128_ID_PRCSO_CRGA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(352167123850942009)
,p_prompt=>'Archivo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'       , a.id_prcso_crga as r',
'    from v_et_g_procesos_carga a',
'   where id_crga in (select c.id_crga ',
'                       from et_g_carga c ',
'                      where c.nmbre_crga like ''%Sujetos Inexistentes%''',
'                   group by c.id_crga',
'                          )',
'     and ( indcdor_prcsdo = ''N'' or :P128_ID_PRCSO_CRGA is not null)',
'     and a.cdgo_clnte = :F_CDGO_CLNTE',
'order by a.id_prcso_crga;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione Archivo'
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_help_text=>'Archivo Asobancaria cargado por el modulo de etl.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138952453454741703)
,p_name=>'P128_CDGO_TPO_ASBNCRIA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(352167123850942009)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_tpo_asbncria varchar2(30);',
'begin',
'    ',
'    v_cdgo_tpo_asbncria := pkg_gn_generalidades.fnc_cl_defniciones_cliente ( p_cdgo_clnte 				 => :F_CDGO_CLNTE',
'                                                                           , p_cdgo_dfncion_clnte_ctgria => pkg_re_recaudos.c_cdgo_dfncion_clnte_ctgria',
'                                                                           , p_cdgo_dfncion_clnte		 => ''AXD'' );',
'',
'    ',
'    v_cdgo_tpo_asbncria := nvl( v_cdgo_tpo_asbncria , ''-1'' );',
'    ',
'    if( v_cdgo_tpo_asbncria = ''-1'' ) then ',
'        return null;',
'    end if;',
'    ',
'    return v_cdgo_tpo_asbncria;',
'    ',
'end;'))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_prompt=>'Tipo Asobancaria'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select dscrpcion as l',
'         , cdgo_tpo_asbncria as k',
'      from re_d_tipos_asobancaria',
'  order by 2'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_tpo_asbncria varchar2(30);',
'begin',
'    ',
'    v_cdgo_tpo_asbncria := pkg_gn_generalidades.fnc_cl_defniciones_cliente ( p_cdgo_clnte 				 => :F_CDGO_CLNTE',
'                                                                           , p_cdgo_dfncion_clnte_ctgria => pkg_re_recaudos.c_cdgo_dfncion_clnte_ctgria',
'                                                                           , p_cdgo_dfncion_clnte		 => ''AXD'' );',
'',
'    ',
'    v_cdgo_tpo_asbncria := nvl( v_cdgo_tpo_asbncria , ''-1'' );',
'    ',
'    if( v_cdgo_tpo_asbncria = ''-1'' ) then ',
'        return false;',
'    else',
'        return true;',
'    end if;',
'    ',
'end;'))
,p_read_only_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Tipo de Asobancaria'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'50%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138955422795741723)
,p_name=>'P128_BRANCH'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(352167123850942009)
,p_item_default=>'125'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(138958128536741762)
,p_validation_name=>'Validar Recaudo Control'
,p_validation_sequence=>10
,p_validation=>'P128_ID_RCDO_CNTROL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Se debe procesar el archivo para poder continuar.'
,p_when_button_pressed=>wwv_flow_api.id(15955248551916988)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138959505285741772)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_lte_nvo      number;',
'begin',
'    --Registro Sujetos Inexistentes',
' /*   pkg_cb_proceso_juridico.prc_rg_slcion_proceso_juridico (p_cdgo_clnte        => :F_CDGO_CLNTE,',
'                                                            p_lte_simu          => :P128_NMRO_LTE,',
'                                                            p_sjto_id           => null,',
'                                                            p_id_usuario        => :F_ID_USRIO,',
'                                                            p_json_movimientos  => null,',
'                                                            p_obsrvcion_lte     => :P128_OBSRVCION_LTE,',
'                                                            p_id_prcso_tpo      => :P128_ID_PRCSO_TPO,',
'                                                            p_cdgo_orgen_sjto   => :P128_ID_CDGO_ORGEN_SJTO,',
'                                                            p_id_prcso_crga     => :P128_ID_PRCSO_CRGA,',
'                                                            p_lte_nvo           => v_lte_nvo);   */                                         ',
'    ',
'    if( v_cdgo_rspsta <> 0 ) then',
'       raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;                       ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(138956953764741737)
,p_process_success_message=>unistr('Archivo procesado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138958781624741772)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Archivo Asobancaria'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'   /* delete re_g_recaudos_asobancaria ',
'     where id_prcso_crga = :P128_ID_PRCSO_CRGA;*/',
'    ',
'    delete et_g_procesos_carga_error ',
'     where id_prcso_crga = :P128_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_carga_traza ',
'     where id_prcso_crga = :P128_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_intermedia ',
'     where id_prcso_crga = :P128_ID_PRCSO_CRGA;',
'    ',
'    delete et_g_procesos_carga',
'     where id_prcso_crga = :P128_ID_PRCSO_CRGA;',
'',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(138957308338741737)
,p_process_success_message=>unistr('Archivo eliminado con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138959136698741772)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Proceso'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     ',
'    update et_g_procesos_carga',
'       set indcdor_prcsdo = ''N''',
'     where id_prcso_crga  = :P128_ID_PRCSO_CRGA; ',
'       ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(138956187398741732)
,p_process_success_message=>unistr('Proceso eliminado con \00E9xito.')
);
end;
/
