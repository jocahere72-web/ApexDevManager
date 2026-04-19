prompt --application/pages/page_00196
begin
wwv_flow_api.create_page(
 p_id=>196
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Liquidacion Masiva Arrendamientos'
,p_page_mode=>'MODAL'
,p_step_title=>'Liquidacion Masiva Arrendamientos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'auto'
,p_dialog_width=>'50%'
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20210212170116'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(257523363033743949)
,p_plug_name=>unistr('Liquidaci\00F3n Masiva')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(106156032842460672)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(257523363033743949)
,p_button_name=>'Btn_Procesar'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Procesar'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de liquidar masivo?'',''Btn_Procesar'');'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(106158107473460677)
,p_branch_name=>'Ir al inicio'
,p_branch_action=>'f?p=&APP_ID.:154:&SESSION.::&DEBUG.:RP,161::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(106156032842460672)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106156424787460673)
,p_name=>'P196_VGNCIA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(257523363033743949)
,p_prompt=>'Vigencia a Liquidar:'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.vgncia r, p.vgncia d',
'  from gi_g_plusvalia_proceso p',
'group by p.vgncia ;'))
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>2
,p_display_when=>'P196_VGNCIA'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(164103392707707754)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'85%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106156887276460675)
,p_name=>'P196_BRANCH_APP'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(257523363033743949)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(106157291187460675)
,p_name=>'P196_BRANCH_PAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(257523363033743949)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(106157689959460676)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Liquidar plusval\00EDa')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'     v_cdgo_rspsta   number;',
'     v_mnsje_rspsta  varchar2(4000);',
'begin',
'     pkg_gi_plusvalia.prc_rg_liquidacion_masiva( p_cdgo_clnte	    => :F_CDGO_CLNTE',
'                                               , p_vgncia		    => :P196_VGNCIA',
'                                               , p_id_usrio	        => :F_ID_USRIO',
'                                               , o_cdgo_rspsta      => v_cdgo_rspsta',
'                                               , o_mnsje_rspsta     => v_mnsje_rspsta);        ',
'   if (v_cdgo_rspsta <> 0) then',
'       raise_application_error( -20001 , v_mnsje_rspsta );',
'   end if;   ',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(106156032842460672)
,p_process_when_type=>'NEVER'
,p_process_success_message=>unistr('Proceso Realizado con \00C9xito.')
);
end;
/
