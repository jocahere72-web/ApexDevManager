prompt --application/pages/page_00265
begin
wwv_flow_api.create_page(
 p_id=>265
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'prueba'
,p_step_title=>'prueba'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P265_EDITOR_DISPLAY{',
'    width:90% !important;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16546135610335102)
,p_plug_name=>'Nuevo'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16546617056335107)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(16546135610335102)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'GENERAR'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(16546785732335108)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(16546135610335102)
,p_button_name=>'BTN_APLICAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(177355758530050632)
,p_button_image_alt=>'Aplicar'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(16546993607335110)
,p_branch_name=>'Ir a pagina 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP,2:P2_XML,P2_ID_RPRTE:''<data><id_acto>''||:P136_ID_ACTO||''</id_acto><id_cnvnio>''||76||''</id_cnvnio><cod_clnte>''||6||''</cod_clnte><p_id_rprte>''||216||''</p_id_rprte><id_plntlla>''||:P265_ID_PLNTLLA||''</id_plntlla></data>'',216&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(16546785732335108)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16546288414335103)
,p_name=>'ID_PLNTLLA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16546135610335102)
,p_prompt=>'Nuevo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d, ',
'       a.id_plntlla r',
'from gn_d_plantillas a',
'join df_s_procesos b on a.id_prcso = b.id_prcso',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and b.id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                => a.cdgo_clnte,',
'                                                                    p_cdgo_dfncion_clnte_ctgria => ''ACP'',',
'                                                                    p_cdgo_dfncion_clnte        => ''APL'');'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(16546373584335104)
,p_name=>'P265_EDITOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16546135610335102)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
'    opt.width = ''100%'';',
'    opt.height = 400;',
'    opt.resize_enabled = false; ',
'    opt.enterMode = 2;	opt.removePlugins = ''contextmenu,liststyle,tabletools'';	return opt;',
'}'))
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16546837057335109)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Nuevo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_cnvnio_dcmnto',
'           , dcmnto',
'           , id_plntlla',
'           , id_acto',
'      into :P136_ID_CNVNIO_DCMNTO',
'           , :P136_DCMNTO',
'           , :P136_ID_PLNTLLA',
'           , :P136_ID_ACTO',
'      from gf_g_convenios_documentos ',
'     where cdgo_clnte = :F_CDGO_CLNTE',
'       and id_cnvnio = 76;',
'exception ',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
