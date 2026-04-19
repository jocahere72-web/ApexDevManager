prompt --application/pages/page_00136
begin
wwv_flow_api.create_page(
 p_id=>136
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>'Plantilla Actos Acuerdos de Pago'
,p_step_title=>unistr('Generaci\00F3n Actos Acuerdo de Pago')
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P136_DCMNTO_DISPLAY{',
'    width: 99% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(174236599978189339)
,p_plug_name=>'Acuerdo Documento'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(175261862631606894)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(175459559565361241)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
'</h5>',
'<i>',
'    <p align="justify">Funcionalidad que permite<br><br>',
unistr('        <b>1. </b>Crear o editar respuesta din\00E1mica a trav\00E9s de la generaci\00F3n de acto de aplicaci\00F3n o rechazo de solicitud de acuerdo de pago.<br><br>'),
unistr('        <b>2. </b>Visualizar o descargar el acto de aplicaci\00F3n o rechazo de solicitud de acuerdo de pago.'),
'    </p>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i>',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92907353496978199)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(175261862631606894)
,p_button_name=>'REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92907707668978199)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(175261862631606894)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P136_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92906532853978198)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(175261862631606894)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P136_ID_CNVNIO_DCMNTO IS NOT NULL and :P136_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(94405881321448102)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(175261862631606894)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P136_ID_CNVNIO_DCMNTO IS NOT NULL and :P136_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93299152293039904)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(175261862631606894)
,p_button_name=>'BTN_APLICAR_ACUERDO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Acuerdo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Aplicar el Acuerdo de Pago?'',''BTN_APLICAR_ACUERDO'')'
,p_button_execute_validations=>'N'
,p_button_condition=>':P136_ID_CNVNIO_DCMNTO IS NOT NULL and :P136_ID_ACTO is null and :P136_CDGO_ACCION_TPO = ''APL'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(93299212965039905)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(175261862631606894)
,p_button_name=>'BTN_RECHAZAR_ACUERDO'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rechazar Acuerdo'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Rechazar el Acuerdo de Pago?'',''BTN_RECHAZAR_ACUERDO'')'
,p_button_condition=>':P136_ID_CNVNIO_DCMNTO is not null and :P136_ID_ACTO is null and :P136_CDGO_ACCION_TPO = ''RCH'''
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(117761822795479242)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(175261862631606894)
,p_button_name=>'BTN_VER_ACTO'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P136_ID_ACTO.,file_name'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'exists(select 1',
'  from gf_g_convenios',
' where id_cnvnio = :P54_ID_CNVNIO',
'   and cdgo_cnvnio_estdo in (''APL'', ''RCH'')) and :P136_ID_ACTO is not null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(92858244254678443)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(174236599978189339)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar'
,p_button_position=>'BODY'
,p_button_condition=>'P136_ID_CNVNIO_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94406282143448106)
,p_branch_name=>unistr('Ir a P\00E1gina Anterior')
,p_branch_action=>'P136_BRANCH'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE,REGRESAR'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(94406564387448109)
,p_branch_name=>'Ir a la pagina Anterior'
,p_branch_action=>'P136_BRANCH'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'BRANCH_TO_PAGE_IDENT_BY_ITEM'
,p_branch_sequence=>10
,p_branch_condition_type=>'SQL_EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(select a.id_plntlla',
'      from gf_g_convenios_documentos a',
'      where a.cdgo_clnte        = :F_CDGO_CLNTE',
'        and a.id_cnvnio         = :P54_ID_CNVNIO',
'        and a.id_acto_rqrdo    is null',
'        and a.id_plntlla       is not null',
'        and a.id_cnvnio_dcmnto is not null ) <> (select a.id_plntlla',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.id_prcso in (select id_prcso',
'                        from df_s_procesos ',
'                       where id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente (:F_CDGO_CLNTE, ''ACP'', :P136_CDGO_ACCION_TPO)))'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17215234180719114)
,p_name=>'P136_MTVO_RCHZO_SLCTUD'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_prompt=>'Motivo de Rechazo'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>75
,p_cMaxlength=>300
,p_cHeight=>2
,p_tag_attributes=>'onkeyup="campoMayuscula(this)"'
,p_display_when=>':P136_CDGO_ACCION_TPO = ''RCH'' and :P136_ID_ACTO is null'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_read_only_when=>'P136_ID_CNVNIO_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Ingrese el motivo por el cual rechaza la solicitud de acuerdo de pago.'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92859068378678447)
,p_name=>'P136_ID_INSTNCIA_FLJO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92859808669678448)
,p_name=>'P136_ID_ACTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92860264520678448)
,p_name=>'P136_ID_PLNTLLA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d, ',
'       a.id_plntlla r',
'from gn_d_plantillas a',
'join df_s_procesos b on a.id_prcso = b.id_prcso',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and b.id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                => a.cdgo_clnte,',
'                                                                    p_cdgo_dfncion_clnte_ctgria => ''ACP'',',
'                                                                    p_cdgo_dfncion_clnte        => :P136_CDGO_ACCION_TPO);'))
,p_lov_display_null=>'YES'
,p_colspan=>8
,p_display_when=>'P136_ID_ACTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione la plantilla de acto a generar en la solicitud de acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(92860695777678449)
,p_name=>'P136_DCMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_prompt=>' '
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
 p_id=>wwv_flow_api.id(93212876360334906)
,p_name=>'P136_ID_CNVNIO_DCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'    select a.id_cnvnio_dcmnto',
'      from gf_g_convenios_documentos a',
'      where a.cdgo_clnte        = :F_CDGO_CLNTE',
'        and a.id_cnvnio         = :P54_ID_CNVNIO',
'        and a.id_acto_rqrdo    is null',
'        and a.id_plntlla       is not null',
'        and a.id_cnvnio_dcmnto is not null'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93298935155039902)
,p_name=>'P136_CDGO_ACCION_TPO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93299307677039906)
,p_name=>'P136_BRANCH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(93599450809435001)
,p_name=>'P136_RSPSTA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95267295140573815)
,p_name=>'P136_ID_RPRTE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119964409599445401)
,p_name=>'P136_ID_ACTO_TPO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(174236599978189339)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(95267591860573818)
,p_computation_sequence=>10
,p_computation_item=>'P136_ID_RPRTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select b.id_rprte ',
'      from gn_d_plantillas a',
'      join gn_d_reportes b',
'        on a.id_rprte = b.id_rprte',
'      where a.cdgo_clnte = :F_CDGO_CLNTE',
'        and a.id_plntlla = :P136_ID_PLNTLLA'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(122100580030713303)
,p_computation_sequence=>10
,p_computation_item=>'F_ID_FLJO_TREA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_fljo_trea_orgen ',
'  from wf_g_instancias_transicion a',
' where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'   and a.id_estdo_trnscion in (1,2);'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(54242610100546801)
,p_computation_sequence=>20
,p_computation_item=>'P136_ID_PLNTLLA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_plntlla r',
'from gn_d_plantillas a',
'join df_s_procesos b on a.id_prcso = b.id_prcso',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and b.id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                => a.cdgo_clnte,',
'                                                                    p_cdgo_dfncion_clnte_ctgria => ''ACP'',',
'                                                                    p_cdgo_dfncion_clnte        => :P136_CDGO_ACCION_TPO);'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(94405749979448101)
,p_validation_name=>'Plantila no nula'
,p_validation_sequence=>10
,p_validation=>'P136_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una Plantilla'
,p_when_button_pressed=>wwv_flow_api.id(92858244254678443)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4120170341805301)
,p_validation_name=>'Validar si exite un funcionario parametrizado para firmar'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_fncnrio     number;',
'    v_ttal_cnvnio    number    := 0;',
'begin',
'    begin ',
'        select trunc(ttal_cnvnio) ',
'          into v_ttal_cnvnio',
'          from v_gf_g_convenios',
'         where id_cnvnio = :P54_ID_CNVNIO; ',
'     exception ',
'         when no_data_found then ',
'             v_ttal_cnvnio    := 0;',
'         when others then ',
'             return false;',
'     end;',
'    begin ',
'        select id_fncnrio ',
'          into v_id_fncnrio',
'          from gn_d_actos_funcionario_frma',
'         where id_acto_tpo                   = (select id_acto_tpo from gn_d_actos_tipo where cdgo_clnte = :F_CDGO_CLNTE and cdgo_acto_tpo = ''RCN'')',
'           and actvo                         = ''S''',
'           and trunc (sysdate)               between fcha_incio     and fcha_fin',
'           and v_ttal_cnvnio                 between rngo_dda_incio and rngo_dda_fin;',
'           ',
'        return true;',
'    exception',
'        when others then',
'            return false;',
'    end;',
'   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('No existe funcionario parametrizado para firmar el acto de rechazo. Por favor revise la parametrizaci\00F3n correspondiente en <i> "Param\00E9tricas >> Param\00E9tricas Actos >>  Funcionario Firmas de Actos"</i>.')
,p_when_button_pressed=>wwv_flow_api.id(93299212965039905)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(94406155633448105)
,p_validation_name=>'Documento no Nulo'
,p_validation_sequence=>30
,p_validation=>'P136_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El Documento no puede estar vac\00EDo')
,p_validation_condition=>'P136_DCMNTO'
,p_validation_condition_type=>'ITEM_IS_NULL'
,p_when_button_pressed=>wwv_flow_api.id(92907707668978199)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(94406794599448111)
,p_name=>'Al cargar la Pagina'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'SQL_EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(select a.id_plntlla',
'      from gf_g_convenios_documentos a',
'      where a.cdgo_clnte        = :F_CDGO_CLNTE',
'        and a.id_cnvnio         = :P54_ID_CNVNIO',
'        and a.id_acto_rqrdo    is null',
'        and a.id_plntlla       is not null',
'        and a.id_cnvnio_dcmnto is not null ) <> (select a.id_plntlla',
'  from gn_d_plantillas a',
'  join gn_d_reportes b',
'    on a.id_rprte = b.id_rprte',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and a.id_prcso in (select id_prcso',
'                        from df_s_procesos ',
'                       where id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente (:F_CDGO_CLNTE, ''ACP'', :P136_CDGO_ACCION_TPO)))'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94406893419448112)
,p_event_id=>wwv_flow_api.id(94406794599448111)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Ya existe una Plantilla generada de otro proceso, por favor elimine esa plantilla para poder continuar.'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(94406944156448113)
,p_event_id=>wwv_flow_api.id(94406794599448111)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(16297439248318702)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos Documento'
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
'       and id_cnvnio = :P54_ID_CNVNIO;',
'exception ',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(92862949619690305)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento Acuerdo de Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_acto_tpo        number;',
'begin',
'   ',
'    begin',
'        select id_acto_tpo',
'          into v_id_acto_tpo',
'          from gn_d_plantillas',
'         where cdgo_clnte = :F_CDGO_CLNTE',
'           and id_plntlla = :P136_ID_PLNTLLA;           ',
'    exception',
'        when no_data_found then',
unistr('        raise_application_error(-20000,''No se encontr\00F3 acto tipo''||sqlerrm);'),
'    end; ',
'    ',
'    :P136_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<COD_CLNTE>''|| :F_CDGO_CLNTE ||''</COD_CLNTE><ID_CNVNIO>''|| :P54_ID_CNVNIO ||''</ID_CNVNIO><ID_ACTO_TPO>''||v_id_acto_tpo||''</ID_ACTO_TPO><MTVO_RCHZO>''||:P136_MTVO_RCHZO_SLCTUD||''</MTVO_RCHZO>'', :P'
||'136_ID_PLNTLLA);',
'',
'exception',
'   when others then',
unistr('   RAISE_APPLICATION_ERROR(-20000, ''Seleccione la plantilla de aplicaci\00F3n'');    '),
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(92858244254678443)
,p_process_when=>'P136_ID_PLNTLLA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>unistr('\00A1Documento Generado Satisfactoriamente!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(93212590393334903)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Documento Acuerdo de pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(1000);',
'begin',
'    ',
'   pkg_gf_convenios.prc_rg_documento_acuerdo_pago ( p_cdgo_clnte    =>	:F_CDGO_CLNTE,',
'                                                    p_id_cnvnio     =>	:P54_ID_CNVNIO,',
'                                                    p_id_plntlla    =>	:P136_ID_PLNTLLA,',
'                                                    p_dcmnto        =>	:P136_DCMNTO,',
'                                                    p_request       =>	:REQUEST,',
'                                                    p_id_usrio		=>	:F_ID_USRIO,',
'                                                    o_cdgo_rspsta	=>	v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta	=>	v_mnsje_rspsta);',
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
 p_id=>wwv_flow_api.id(93490598909756501)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Solicitud Acuerdo Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'  v_cdgo_rspsta     number;',
'  v_id_acto         gn_g_actos.id_acto%type;',
'',
'begin',
'    pkg_gf_convenios.prc_ap_aplicar_acuerdo_pago (p_cdgo_clnte      =>  :F_CDGO_CLNTE,',
'                                                  p_id_cnvnio       =>  :P54_ID_CNVNIO,',
'                                                  p_id_usrio        =>  :F_ID_USRIO,                                       ',
'                                                  p_id_plntlla      =>  :P136_ID_PLNTLLA,',
'                                                  o_id_acto         =>  :P136_ID_ACTO,',
'                                                  o_mnsje_rspsta    =>  :P136_RSPSTA,',
'                                                  o_cdgo_rspsta     =>  v_cdgo_rspsta);',
'    if(v_cdgo_rspsta != 0)then',
'        raise_application_error(-20000, :P136_RSPSTA);',
'    end if;',
'exception',
'    when others then',
'        raise_application_error(-20001, sqlerrm);',
'end;'))
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(93299152293039904)
,p_process_success_message=>'&P136_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94407020644448114)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rechazo de Acuerdo de Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspta    number;',
'begin',
'    pkg_gf_convenios.prc_re_acuerdo_pago(p_cdgo_clnte          => :F_CDGO_CLNTE,',
'                                         p_id_cnvnio           => :P54_ID_CNVNIO,',
'                                         p_mtvo_rchazo_slctud  => :P136_MTVO_RCHZO_SLCTUD,',
'                                         p_id_usrio            => :F_ID_USRIO,',
'                                         p_id_plntlla          => :P136_ID_PLNTLLA,',
'                                         o_id_acto             => :P136_ID_ACTO,',
'                                         o_cdgo_rspsta         => v_cdgo_rspta,',
'                                         o_mnsje_rspsta        => :P136_RSPSTA);',
'                    ',
'    if v_cdgo_rspta = 0 then ',
unistr('        :P136_RSPSTA := ''\00A1Acuerdo de Pago Rechazado!'';'),
'    end if;',
'end;                    '))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(93299212965039905)
,p_process_success_message=>'&P136_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(94405987583448103)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Edittor'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P136_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(94405881321448102)
);
end;
/
