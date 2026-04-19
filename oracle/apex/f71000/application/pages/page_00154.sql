prompt --application/pages/page_00154
begin
wwv_flow_api.create_page(
 p_id=>154
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'plantilla anulacion acuerdo'
,p_step_title=>'plantilla anulacion acuerdo'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(273572210576848610)
,p_plug_name=>'Acuerdo Documento'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(274601798688267570)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99340685116660677)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(274601798688267570)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99341099280660677)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(274601798688267570)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P154_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99340215718660677)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(274601798688267570)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P154_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99342239256660678)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(274601798688267570)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P154_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99341475594660678)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(274601798688267570)
,p_button_name=>'BTN_ANLAR_ACRDO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Anular Acuerdo'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-clipboard-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99335996734659275)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(273572210576848610)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>'P154_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(99531789808950327)
,p_branch_name=>unistr('Ir a P\00E1gina anterior')
,p_branch_action=>'P154_BRANCH'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'REGRESAR,DELETE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(99531469397950324)
,p_branch_name=>unistr('Ir a P\00E1gina 2')
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP:P2_ID_RPRTE,P2_XML:&P154_ID_RPRTE.,<data><id_acto>&P154_ID_ACTO.</id_acto><id_cnvnio>&P147_ID_CNVNIO.</id_cnvnio><cod_clnte>&F_CDGO_CLNTE.</cod_clnte><funcion>pkg_gn_generalidades.prc_ac_acto(p_file_blob =>Â¡v_blob! p_id_acto =>&P154_ID_ACTO.!p_ntfccion_atmtca=>''N'')</funcion></data>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99336311508659277)
,p_name=>'P154_ID_INSTNCIA_FLJO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99336777383659278)
,p_name=>'P154_ID_CNVNIO_DCMNTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio_dcmnto',
'      from gf_g_convenios_documentos a',
'      where a.cdgo_clnte        = :F_CDGO_CLNTE',
'        and a.id_cnvnio         = :P147_ID_CNVNIO',
'        and a.id_acto_rqrdo    is null',
'        and a.id_plntlla       is not null',
'        and a.id_cnvnio_dcmnto is not null;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99337173300659279)
,p_name=>'P154_ID_ACTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99337563185659279)
,p_name=>'P154_ID_PLNTLLA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion, ',
'       a.id_plntlla',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'  /*and a.id_prcso in (select id_prcso',
'                        from df_s_procesos ',
'                       where id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente (:F_CDGO_CLNTE, ''ACP'', ''RCH''))*/'))
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>1
,p_read_only_when=>'P154_ID_CNVNIO_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99337946703659280)
,p_name=>'P154_CDGO_ACCION_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99338348457659280)
,p_name=>'P154_BRANCH'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99338790768659280)
,p_name=>'P154_DCMNTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_prompt=>' '
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dcmnto',
'      from gf_g_convenios_documentos a',
'      where a.cdgo_clnte        = :F_CDGO_CLNTE',
'        and a.id_cnvnio         = :P54_ID_CNVNIO',
'        and a.id_acto_rqrdo    is null',
'        and a.id_plntlla       is not null',
'        and a.id_cnvnio_dcmnto is not null'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.width = ''100%'';',
'    opt.height = 400;',
'    opt.resize_enabled = false; ',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'}'))
,p_attribute_02=>'Full'
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99339151870659281)
,p_name=>'P154_RSPSTA'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99339551146659281)
,p_name=>'P154_ID_RPRTE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(273572210576848610)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(99531610265950326)
,p_computation_sequence=>10
,p_computation_item=>'P154_ID_RPRTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select b.id_rprte ',
'      from gn_d_plantillas a',
'      join gn_d_reportes b',
'        on a.id_rprte = b.id_rprte',
'      where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_plntlla = :P154_ID_PLNTLLA'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99417225003817506)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Generar Documento Anulaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P154_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<COD_CLNTE>''|| :F_CDGO_CLNTE ||''</COD_CLNTE><ID_CNVNIO>''|| :P147_ID_CNVNIO ||''</ID_CNVNIO>'', :P154_ID_PLNTLLA);',
''))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99335996734659275)
,p_process_when=>'P154_ID_PLNTLLA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('Se gener\00F3 el documento')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99417307397817507)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Gestionar Documento Anulaci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'begin',
'    ',
'   pkg_gf_convenios.prc_rg_documento_acuerdo_pago (   p_cdgo_clnte    =>	:F_CDGO_CLNTE,',
'                                                        p_id_cnvnio     =>	:P147_ID_CNVNIO,',
'                                                        p_id_plntlla    =>	:P154_ID_PLNTLLA,',
'                                                        p_dcmnto        =>	:P154_DCMNTO,',
'                                                        p_request       =>	:REQUEST,',
'                                                        p_id_usrio		=>	:F_ID_USRIO,',
'                                                        o_cdgo_rspsta	=>	v_cdgo_rspsta,',
'                                                        o_mnsje_rspsta	=>	v_mnsje_rspsta);',
'                                    ',
'    if (v_cdgo_rspsta <> 0) then',
'		RAISE_APPLICATION_ERROR (-20000,v_mnsje_rspsta); ',
'	end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('\00A1Petici\00F3n Procesada!.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99417108986817505)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Anular Acuerdo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_gf_convenios.prc_an_acuerdo_pago ( p_cdgo_clnte       =>	:F_CDGO_CLNTE			,',
'                                           p_id_cnvnio        =>	:P147_ID_CNVNIO			,',
'                                           p_id_usrio         =>	:F_ID_USRIO				,',
'                                           p_obsrvcion        =>	:P149_OBSRVCION			,',
'                                           p_id_mtvo_anlcn    =>	:P149_ID_MTVO_ANLCION	,',
'                                           p_id_plntlla       =>	:P154_ID_PLNTLLA		,',
'                                           o_id_acto          =>	:P154_ID_ACTO			,',
'                                           o_mnsje_rspsta     =>	:P154_RSPSTA			,',
'                                           o_cdgo_rspsta      =>	:v_cdgo_rspsta			);',
'end;                                         '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99341475594660678)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99531841923950328)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Editor Texto'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P154_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99342239256660678)
);
end;
/
