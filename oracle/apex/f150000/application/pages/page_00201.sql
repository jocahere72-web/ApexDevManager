prompt --application/pages/page_00201
begin
wwv_flow_api.create_page(
 p_id=>201
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Informaci\00F3n Relacionada - Liquidaci\00F3n Rentas')
,p_step_title=>unistr('Informaci\00F3n Relacionada - Liquidaci\00F3n Rentas')
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20200724091834'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15573701543174744)
,p_plug_name=>unistr('Informaci\00F3n Relacionada')
,p_region_template_options=>'#DEFAULT#:t-Wizard--hideStepsXSmall:t-Form--xlarge'
,p_component_template_options=>'#DEFAULT#:t-WizardSteps--displayLabels'
,p_plug_template=>wwv_flow_api.id(252183924525651399)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(4794665765814946)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(252197199379651439)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(15574137531174749)
,p_plug_name=>unistr('Informaci\00F3n Asociada')
,p_parent_plug_id=>wwv_flow_api.id(15573701543174744)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--xlarge'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5427534823586262)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(15573701543174744)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--warning:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ seguro de cancelar? Al cancelar se perderÃ¡ todos los cambios que no se han guardado'',''CANCEL'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-calendar-times-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5427994678586262)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(15573701543174744)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Siguiente'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-angle-right'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5428376743586263)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(15573701543174744)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(252201877336651464)
,p_button_image_alt=>'Anterior'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(78952670003533306)
,p_branch_name=>unistr('ir a la p\00E1gina de inicio')
,p_branch_action=>'P200_BRANCH'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'BRANCH_TO_STEP'
,p_branch_when_button_id=>wwv_flow_api.id(5427534823586262)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5430722788586269)
,p_branch_name=>unistr('Ir a Proyecci\00F3n')
,p_branch_action=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5427994678586262)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5429053765586263)
,p_name=>'P201_ID_SBMPSTO_ASCDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(15574137531174749)
,p_prompt=>'Asociada'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select --''['' || a.cdgo_ascda || ''] '' || a.dscrpcion d',
'          a.dscrpcion d',
'        , a.id_sbmpsto_ascda            r',
'     from gi_d_subimpuestos_asociada    a',
'    where cdgo_clnte                    = :F_CDGO_CLNTE',
'      and id_impsto_sbmpsto             = :P200_ID_IMPSTO_SBMPSTO',
'      and activo                        = ''S''',
' order by a.dscrpcion',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>3
,p_grid_label_column_span=>1
,p_display_when=>'P200_INDCDOR_RQRE_ASCDA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5429448461586267)
,p_name=>'P201_TXTO_ASCDA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(15574137531174749)
,p_prompt=>'Soporte Asociada'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>6
,p_display_when=>'P200_INDCDOR_RQRE_ASCDA'
,p_display_when2=>'S'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
