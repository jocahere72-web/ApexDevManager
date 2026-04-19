prompt --application/pages/page_00166
begin
wwv_flow_api.create_page(
 p_id=>166
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Reversi\00F3n Acuerdo de Pago')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Reversi\00F3n Acuerdo de Pago')
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177320258117050591)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'60%'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20191101165025'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(337740477635049273)
,p_plug_name=>unistr('Aplicaci\00F3n Reversi\00F3n Acuerdo')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(101453145868613289)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(337740477635049273)
,p_button_name=>'BTN_APLICAR_RVRSION'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Aplicar Reversi\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Revertir Acuerdo(s) de Pago?'',''BTN_APLICAR_RVRSION'')'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(101446125379607704)
,p_branch_action=>'f?p=&APP_ID.:161:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101453536429613293)
,p_name=>'P166_ID_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(337740477635049273)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101453974843613297)
,p_name=>'P166_ID_RPRTE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(337740477635049273)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101454380235613297)
,p_name=>'P166_RSPSTA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(337740477635049273)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101454785946613297)
,p_name=>'P166_ID_PLNTLLA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(337740477635049273)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.dscrpcion, ',
'       a.id_plntlla',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.id_prcso in (select id_prcso',
'                        from df_s_procesos ',
'                       where id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente (:F_CDGO_CLNTE, ''ACP'',''RVR''))'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(101455163171613298)
,p_name=>'P166_BRANCH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(337740477635049273)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(101445956598607702)
,p_validation_name=>'Plantilla no nula'
,p_validation_sequence=>10
,p_validation=>'P166_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione La pLantilla del Acto'
,p_when_button_pressed=>wwv_flow_api.id(101453145868613289)
,p_associated_item=>wwv_flow_api.id(101454785946613297)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(101446070700607703)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Aplicar Reversi\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  declare',
'  ',
'      v_cdgo_rspsta     number;',
'',
'  begin',
'    pkg_gf_convenios.prc_ap_rvrsion_acrdo_pgo_msvo( p_cdgo_clnte              =>    :F_CDGO_CLNTE,',
'                                                    p_cdna_cnvnio            =>    :P147_ID_CNVNIO,',
'                                                    p_id_usrio               =>    :F_ID_USRIO,',
'                                                    p_id_plntlla             =>    :P166_ID_PLNTLLA,',
'                                                    o_cdgo_rspsta            =>    v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta           =>    :P166_RSPSTA);    ',
'  end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(101453145868613289)
,p_process_success_message=>'&P166_RSPSTA.'
);
end;
/
