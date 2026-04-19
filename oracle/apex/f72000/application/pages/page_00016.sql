prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(72999165452094574)
,p_name=>'Documento'
,p_step_title=>'Documento'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(72894757230094465)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'BVILLEGAS'
,p_last_upd_yyyymmddhh24miss=>'20231129012918'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33325036642861801)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
unistr('<i>Funcionalidad que permite la generaci\00F3n de actos.'),
'    <br/>',
'    <br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'',
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(93475995118719901)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(72925202139094501)
,p_plug_display_sequence=>20
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
 p_id=>wwv_flow_api.id(202879319757643974)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(72903782990094472)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93607461630540001)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(93475995118719901)
,p_button_name=>'GENERAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Plantilla'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'(:P16_ID_RCRSO_DCMNTO IS NULL AND :P16_ID_ACTO IS NULL AND NVL(:P16_INDC_LECTURA,''N'') = ''N'' AND :P16_DCMNTO IS NULL)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(133472859828007601)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(93475995118719901)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'(:P16_ID_RCRSO_DCMNTO IS NULL AND :P16_ID_ACTO IS NULL AND NVL(:P16_INDC_LECTURA,''N'') = ''N'' AND :P16_DCMNTO IS NOT NULL)'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93476135430719903)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(93475995118719901)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'(:P16_ID_RCRSO_DCMNTO IS NOT NULL AND :P16_ID_ACTO IS NULL AND NVL(:P16_INDC_LECTURA,''N'') = ''N'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93476213747719904)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(93475995118719901)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''¿Está seguro de eliminar el documento?'', ''DELETE'');'
,p_button_condition=>'(:P16_ID_RCRSO_DCMNTO IS NOT NULL AND :P16_ID_ACTO IS NULL AND NVL(:P16_INDC_LECTURA,''N'') = ''N'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93508162005840301)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(93475995118719901)
,p_button_name=>'REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(72977478175094544)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(144147069701857601)
,p_branch_name=>'Regresar'
,p_branch_action=>'f?p=&APP_ID.:&P16_PGNA_ORGN.:&SESSION.::&DEBUG.:RP,&P16_PGNA_ORGN.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(93508162005840301)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83415379034005512)
,p_name=>'P16_DCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.height = 400;',
'    opt.resize_enabled = false;',
'    if($v(P16_INDC_LECTURA) == ''S''){',
'        opt.readOnly = true; ',
'    }',
'    return opt;',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83415727897005513)
,p_name=>'P16_BRANCH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83846213737381734)
,p_name=>'P16_ID_RCRSO_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83846346920381735)
,p_name=>'P16_XML'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83846531083381737)
,p_name=>'P16_ID_ACTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(86886875500328201)
,p_name=>'P16_ID_ACTO_RQRDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93632873317686001)
,p_name=>'P16_PGNA_ORGN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93638316841702602)
,p_name=>'P16_ID_PLNTLLA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       a.id_plntlla',
'from gn_d_plantillas a',
'inner join gn_d_actos_tipo_tarea b on a.id_acto_tpo     = b.id_acto_tpo and',
'                                      b.id_fljo_trea    = :F_ID_FLJO_TREA',
'where a.cdgo_clnte     = :F_CDGO_CLNTE     and',
'      b.id_acto_tpo    = :P16_ID_ACTO_TPO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d, ',
'       a.id_plntlla r',
'from gn_d_plantillas a',
'inner join gn_d_actos_tipo_tarea b on a.id_acto_tpo     = b.id_acto_tpo and',
'                                      b.id_fljo_trea    = :F_ID_FLJO_TREA',
'where a.cdgo_clnte     = :F_CDGO_CLNTE     and',
'      b.id_acto_tpo    = :P16_ID_ACTO_TPO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Seleccionar--'
,p_display_when=>'P16_INDC_LECTURA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_read_only_when=>'P16_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(72977081091094543)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'30%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95103818134660601)
,p_name=>'P16_INDC_LECTURA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96547576139913303)
,p_name=>'P16_ID_ACTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117487709590896301)
,p_name=>'P16_ID_INSTNCIA_FLJO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117487829090896302)
,p_name=>'P16_ID_FLJO_TREA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117586129192808601)
,p_name=>'P16_ID_INSTNCIA_FLJO_HJO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(202879319757643974)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(119300424891598201)
,p_computation_sequence=>10
,p_computation_item=>'P16_ID_INSTNCIA_FLJO'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_INSTNCIA_FLJO'
,p_compute_when=>'P16_ID_INSTNCIA_FLJO'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(119300546413598202)
,p_computation_sequence=>20
,p_computation_item=>'P16_ID_FLJO_TREA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'F_ID_FLJO_TREA'
,p_compute_when=>'P16_ID_FLJO_TREA'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(93688024760807001)
,p_validation_name=>'Valida plantilla al generar'
,p_validation_sequence=>10
,p_validation=>'P16_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe escoger una #LABEL#, por favor verifique!'
,p_validation_condition=>'GENERAR,CREATE,SAVE,DELETE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(93638316841702602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93594247468407301)
,p_process_sequence=>40
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select a.txto_dcmnto,',
'           a.id_plntlla,',
'           a.id_acto,',
'           a.id_rcrso_dcmnto',
'    into :P16_DCMNTO,',
'         :P16_ID_PLNTLLA,',
'         :P16_ID_ACTO,',
'         :P16_ID_RCRSO_DCMNTO',
'    from gj_g_recursos_documento  a',
'    inner join  gj_g_recursos     b   on  b.id_rcrso  =   a.id_rcrso',
'    where b.id_instncia_fljo_hjo = :P16_ID_INSTNCIA_FLJO   and',
'          a.id_acto_tpo          = :P16_ID_ACTO_TPO        and ',
'          a.id_rcrso_dcmnto      = :P16_ID_RCRSO_DCMNTO;',
'exception',
'    when others then',
'        raise_application_error(-20001, ''Problemas al consultar documento'');',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P16_ID_RCRSO_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93616200939558401)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    :P16_DCMNTO    :=    pkg_gn_generalidades.fnc_ge_dcmnto(p_xml           =>    :P16_XML',
'                                                           ,p_id_plntlla    =>    :P16_ID_PLNTLLA',
'                                                           );',
'    exception',
'        when others then',
'            RAISE_APPLICATION_ERROR (-20000,''Problemas generando plantilla, ''||sqlerrm); ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(93607461630540001)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93508385306840303)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_instncia_fljo_hjo    number;',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'begin',
'    if :P16_DCMNTO is null then',
'        RAISE_APPLICATION_ERROR (-20000,''Debe Generar plantilla antes de Insertar.''); ',
'    end if;',
'    begin',
'        select   id_instncia_fljo_hjo',
'        into     v_id_instncia_fljo_hjo',
'        from     gj_g_recursos ',
'        where    id_instncia_fljo_gnrdo_rsl_acl = :P16_ID_INSTNCIA_FLJO_HJO;',
'    exception',
'	    when no_data_found then',
'		  v_id_instncia_fljo_hjo := :P16_ID_INSTNCIA_FLJO;',
'        when others then',
'	      RAISE_APPLICATION_ERROR (-20000,''No se encontro ningun dato.''); ',
'    end;',
'    ',
'    pkg_gj_recurso.prc_rg_gestion_plantilla (p_cdgo_clnte		    => :F_CDGO_CLNTE',
'								            ,p_id_instncia_fljo	    => v_id_instncia_fljo_hjo--:P16_ID_INSTNCIA_FLJO',
'                                            ,p_id_instncia_fljo_hjo => :P16_ID_INSTNCIA_FLJO_HJO',
'                                            ,p_id_fljo_trea		    => :P16_ID_FLJO_TREA',
'                                            ,p_request			    => :REQUEST',
'                                            ,p_id_plntlla		    => :P16_ID_PLNTLLA',
'                                            ,p_dcmnto			    => :P16_DCMNTO',
'                                            ,p_id_usrio			    => :F_ID_USRIO',
'                                            ,p_id_aplccion          => :APP_ID',
'                                            ,p_id_pgna              => :APP_PAGE_ID ',
'                                            ,o_cdgo_rspsta		    => v_cdgo_rspsta',
'                                            ,o_mnsje_rspsta		    => v_mnsje_rspsta',
'                                            ,o_id_rcrso_dcmnto      => :P16_ID_RCRSO_DCMNTO',
'                                            );',
'    if (v_cdgo_rspsta <> 0) then',
'		RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('\00A1Actos generados!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(142560787046997701)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Al eliminar plantilla'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P16_ID_RCRSO_DCMNTO,P16_ID_PLNTLLA,P16_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(93476213747719904)
);
end;
/
