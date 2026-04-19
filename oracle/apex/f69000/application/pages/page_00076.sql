prompt --application/pages/page_00076
begin
wwv_flow_api.create_page(
 p_id=>76
,p_user_interface_id=>wwv_flow_api.id(88610577823834736)
,p_name=>unistr('Novedades N\00FAmero Predial')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Novedades N\00FAmero Predial')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_dialog_width=>'80%'
,p_last_updated_by=>'NCARRASQUILLA'
,p_last_upd_yyyymmddhh24miss=>'20231220135159'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(273836411397640977)
,p_plug_name=>unistr('Novedades N\00FAmero Predial')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(88536556043834667)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(215429655892479402)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(273836411397640977)
,p_button_name=>'Btn_Procesar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(88588793103834707)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(215433230260479432)
,p_branch_name=>'Branch'
,p_branch_action=>'f?p=&P76_BRANCH_APP.:&P76_BRANCH_PAGE.:&SESSION.::&DEBUG.:RP,123::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(215429655892479402)
,p_branch_sequence=>10
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P76_BRANCH_PAGE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(215433658907479436)
,p_branch_name=>'Branch'
,p_branch_action=>'f?p=&APP_ID.:76:&SESSION.::&DEBUG.:RP,76::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(215429655892479402)
,p_branch_sequence=>20
,p_branch_condition_type=>'ITEM_IS_NULL'
,p_branch_condition=>'P76_BRANCH_PAGE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(215430082955479408)
,p_name=>'P76_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(273836411397640977)
,p_prompt=>'Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTO_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_impsto || '' ['' || b.cdgo_impsto || '']'' d,',
'        a.id_impsto r',
'  from sg_g_usuarios_impuesto a ',
'  join df_c_impuestos b on a.id_impsto = b.id_impsto',
'where a.id_usrio = :F_ID_USRIO',
'  and b.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.actvo = ''S''',
'  and b.actvo = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_display_when=>'P76_IMPSTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(215430443729479413)
,p_name=>'P76_IMPUESTO_SUBIMPUESTO'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(273836411397640977)
,p_prompt=>'Sub Tributo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto  as d,',
'       id_impsto_sbmpsto as r',
'  from df_i_impuestos_subimpuesto',
' where cdgo_clnte = :F_CDGO_CLNTE ',
'   and id_impsto = :P76_IMPSTO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P76_IMPSTO'
,p_ajax_items_to_submit=>'P76_IMPSTO,P76_IMPUESTO_SUBIMPUESTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_display_when=>'P76_IMPUESTO_SUBIMPUESTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(215430875057479414)
,p_name=>'P76_VGNCIA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(273836411397640977)
,p_prompt=>'Vigencia:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_display_when=>'P76_VGNCIA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(215431217804479414)
,p_name=>'P76_PRDO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(273836411397640977)
,p_prompt=>'Periodo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select prdo    as d',
'     , id_prdo as r  ',
'  from df_i_periodos',
' where id_impsto         = :P76_IMPSTO',
'   and id_impsto_sbmpsto = :P76_IMPUESTO_SUBIMPUESTO',
'   and vgncia            = :P76_VGNCIA;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P76_IMPSTO,P76_IMPUESTO_SUBIMPUESTO,P76_VGNCIA'
,p_ajax_items_to_submit=>'P76_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_display_when=>'P76_PRDO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'25%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(215431687843479414)
,p_name=>'P76_ARCHIVO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(273836411397640977)
,p_prompt=>'Archivo:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.file_name || ''  |  '' || to_char( a.fcha_rgstro , ''DD/MM/YYYY HH:MI:SS AM'' )  || ''  |  '' || a.nmbre_trcro as d',
'        , a.id_prcso_crga as r',
'from    v_et_g_procesos_carga a',
'where   a.cdgo_clnte        = :F_CDGO_CLNTE',
'and     a.id_impsto         = :P76_IMPSTO',
'and     a.id_impsto_sbmpsto = :P76_IMPUESTO_SUBIMPUESTO',
'and     a.vgncia            = :P76_VGNCIA  ',
'and     a.id_prdo           = :P76_PRDO',
'and     a.indcdor_prcsdo    = ''N''',
'and     exists(',
'                select  1',
'                from    si_g_novedades_predial_t5 c',
'                where   c.id_prcso_crga = a.id_prcso_crga',
'                group by a.id_prcso_crga',
'              );'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P76_IMPSTO,P76_IMPUESTO_SUBIMPUESTO,P76_VGNCIA,P76_PRDO'
,p_ajax_items_to_submit=>'P76_IMPSTO,P76_IMPUESTO_SUBIMPUESTO,P76_ARCHIVO,P76_VGNCIA,P76_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>8
,p_field_template=>wwv_flow_api.id(88588230753834705)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(215432072070479415)
,p_name=>'P76_BRANCH_APP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(273836411397640977)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(215432430098479416)
,p_name=>'P76_BRANCH_PAGE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(273836411397640977)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(215432842506479428)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Referencias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_cdgo_rspsta   number;',
'     v_mnsje_rspsta  varchar2(4000);',
'begin',
'',
'    pkg_si_novedades_predio.prc_ap_novedad_numero_predial ( p_cdgo_clnte	    => :F_CDGO_CLNTE',
'                                                          , p_id_prcso_crga     => :P76_ARCHIVO',
'                                                          , p_id_usrio		    => :F_ID_USRIO',
'                                                          , p_id_impsto		    => :P76_IMPSTO',
'                                                          , o_cdgo_rspsta       => v_cdgo_rspsta',
'                                                          , o_mnsje_rspsta      => v_mnsje_rspsta);        ',
'    ',
'    if (v_cdgo_rspsta <> 0) then',
'        raise_application_error( -20001 , v_mnsje_rspsta );',
'    end if;   ',
'    ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(215429655892479402)
,p_process_success_message=>unistr('Proceso Realizado con \00C9xito.')
);
end;
/
