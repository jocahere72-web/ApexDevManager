prompt --application/pages/page_00112
begin
wwv_flow_api.create_page(
 p_id=>112
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Documentos_Embargo'
,p_step_title=>'Documentos_Embargo'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49235256114882261)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br/>',
'<h5>',
'    <b>',
'        <center>Opciones ',
'            <i class="fa fa-gears" aria-hidden="true"></i>',
'        </center>',
'    </b>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49237971899882288)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b>',
'        <i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i> ',
'    </b>',
'</h5>',
'',
'<p>Esta funcionalidad permite gestionar los documentos de cada una de las etpas del proceso juridico de cobro.</p>',
'<p> </p>',
'<p> </p>',
'<p><b>Nota:</b> Solo se visualizara la opcion de seleccionar la plantilla cuando no exista el documento.</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49280780402631435)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6741738535230218)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(49235256114882261)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6742132307230234)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(49235256114882261)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar o Aplicar <br> Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P112_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6742447654230236)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(49235256114882261)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6742851275230236)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(49235256114882261)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6743205867230237)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(49235256114882261)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P112_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6743650757230237)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(49235256114882261)
,p_button_name=>'BTN_OBSVCION_RVRSA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Observaciones al <br>reversar estados'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP,43:P43_ID_PRCSOS_JRDCO_DCMNTO:&P112_ID_PRCSOS_JRDCO_DCMNTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (',
'select a.fcha_rgstro,e.dscrpcion,a.obsrvcion',
'from cb_g_prcsos_jrdc_dcmnt_estd a',
'left join wf_d_flujos_tarea_estado e on a.id_fljo_trea_estdo = e.id_fljo_trea_estdo',
'where a.obsrvcion is not null',
'and a.id_prcsos_jrdco_dcmnto = :p112_id_prcsos_jrdco_dcmnto',
'order by a.id_prcsos_jrdco_dcmnto_estdo desc) a;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-clipboard-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6744692488230244)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_api.id(49280780402631435)
,p_button_name=>'BTN_GNRAR_DCMNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>'P112_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6750759553230293)
,p_branch_name=>'Go To Page 112'
,p_branch_action=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:RP,112:P112_BRANCH,P112_NOMBRE_ETPA,P112_IDNTFCCION,P112_CDGO_EMBRGO,P112_ID_EMBRGOS_RSLCION,P112_ID_SLCTD_OFCIO,P112_ID_TPOS_MDDA_CTLAR,P112_TIPO_DCMNTO,P112_ID_EMBRGOS_CRTRA:&P112_BRANCH.,&P112_NOMBRE_ETPA.,&P112_IDNTFCCION.,&P112_CDGO_EMBRGO.,&P112_ID_EMBRGOS_RSLCION.,&P112_ID_SLCTD_OFCIO.,&P112_ID_TPOS_MDDA_CTLAR.,&P112_TIPO_DCMNTO.,&P112_ID_EMBRGOS_CRTRA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6743205867230237)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(6751112771230300)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP,2:P2_ID_RPRTE,P2_XML:19,<data> 	<id_prcsos_jrdco_dcmnto>&P112_ID_PRCSOS_JRDCO_DCMNTO.</id_prcsos_jrdco_dcmnto> 	<id_prcsos_jrdco>&P112_ID_PRCSOS_JRDCO.</id_prcsos_jrdco> 	<funcion>pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => Â¡file_blob ! p_id_acto => &P112_ID_ACTO.)</funcion> </data>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(6742851275230236)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6072456505867312)
,p_name=>'P112_TIPO_DCMNTO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6072588708867313)
,p_name=>'P112_ID_TPOS_MDDA_CTLAR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6072876897867316)
,p_name=>'P112_ID_EMBRGOS_CRTRA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6745030036230247)
,p_name=>'P112_NOMBRE_ETPA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_prompt=>'<b>Etapa</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6745407701230259)
,p_name=>'P112_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_prompt=>'<b>Sujeto:</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6745844783230261)
,p_name=>'P112_CDGO_EMBRGO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6746232215230261)
,p_name=>'P112_ID_EMBRGOS_RSLCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6746694795230262)
,p_name=>'P112_ID_SLCTD_OFCIO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6747066448230262)
,p_name=>'P112_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion,a.id_plntlla',
'from gn_d_plantillas a',
'inner join mc_d_tipos_mdda_ctlr_dcmnto b on b.id_plntlla = a.id_plntlla',
'inner join mc_d_tipos_mdda_ctlar c on c.id_tpos_mdda_ctlar = b.id_tpos_mdda_ctlar',
'and c.id_tpos_mdda_ctlar = :P112_ID_TPOS_MDDA_CTLAR',
'where /*a.tpo_plntlla = :P67_TPO_PLNTLLA',
'and*/ a.actvo = ''S''',
'and a.id_prcso = 23',
'and b.tpo_dcmnto = :P112_TIPO_DCMNTO --''R''',
'and b.clse_dcmnto = ''P'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_read_only_when=>'P112_DCMNTO'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6747445160230262)
,p_name=>'P112_DCMNTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_prompt=>'Documento'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(17408723634919398)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (opt) {',
'    opt.skin = ''office2013,skins/office2013/'';',
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
 p_id=>wwv_flow_api.id(6748262321230263)
,p_name=>'P112_BRANCH'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(49280780402631435)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6750271990230292)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if :P112_TIPO_DCMNTO = ''R'' then',
'    ',
'        select a.id_plntlla,',
'               a.dcmnto_rslcion --,a.id_embrgos_rslcion',
'          into :P112_ID_PLNTLLA,',
'               :P112_DCMNTO',
'          from mc_g_embargos_resolucion a',
'         where a.id_embrgos_rslcion = :P112_ID_EMBRGOS_RSLCION',
'           and a.id_plntlla is not null',
'           and a.dcmnto_rslcion is not null;',
'           ',
'    elsif :P112_TIPO_DCMNTO = ''O'' then',
'',
'        select b.id_plntlla_ofcio,',
'               b.dcmnto_ofcio --, b.id_slctd_ofcio',
'          into :P112_ID_PLNTLLA,',
'               :P112_DCMNTO',
'          from mc_g_solicitudes_y_oficios b',
'         where b.id_slctd_ofcio = :P112_ID_SLCTD_OFCIO',
'           and b.id_plntlla_ofcio is not null',
'           and b.dcmnto_ofcio is not null;',
'           ',
'           --null;',
'           ',
'    end if;',
'      ',
'exception when others then ',
'           null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6749410227230285)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--:P112_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_prcsos_jrdco>''|| :P112_ID_PRCSOS_JRDCO ||''</id_prcsos_jrdco><id_prcsos_jrdco_dcmnto>''|| :P112_ID_PRCSOS_JRDCO_DCMNTO ||''</id_prcsos_jrdco_dcmnto>'', :P112_ID_PLNTLLA);',
'--''<id_embrgos_crtra>''|| embargos.id_embrgos_crtra ||''</id_embrgos_crtra><id_embrgos_rslcion>''|| embargos.id_embrgos_rslcion ||''</id_embrgos_rslcion><id_acto>''||v_id_acto||''</id_acto>''',
'if :P112_TIPO_DCMNTO = ''R'' then',
'    --:P112_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_embrgos_crtra" : "''||:P112_ID_EMBRGOS_CRTRA||''","id_embrgos_rslcion" : "''||:P112_ID_EMBRGOS_RSLCION||''"}'', :P112_ID_PLNTLLA);',
'    :P112_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_embrgos_crtra>''|| :P112_ID_EMBRGOS_CRTRA ||''</id_embrgos_crtra><id_embrgos_rslcion>''|| :P112_ID_EMBRGOS_RSLCION ||''</id_embrgos_rslcion><id_acto>''||NULL||''</id_acto>'', :P112_ID_PLNTLLA);',
'elsif :P112_TIPO_DCMNTO = ''O'' then',
'    --:P112_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_embrgos_crtra" : "''||:P112_ID_EMBRGOS_CRTRA||''","id_slctd_ofcio" : "''||:P112_ID_SLCTD_OFCIO||''"}'', :P112_ID_PLNTLLA);',
'    :P112_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_embrgos_crtra>''|| :P112_ID_EMBRGOS_CRTRA ||''</id_embrgos_crtra><id_slctd_ofcio>''|| :P112_ID_SLCTD_OFCIO ||''</id_slctd_ofcio><id_acto>''||NULL||''</id_acto>'', :P112_ID_PLNTLLA);',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(6744692488230244)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6749836314230292)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'                                              ',
'    PKG_CB_MEDIDAS_CAUTELARES.prc_rg_dcmntos_embrgo_pntual( p_id_embrgos_rslcion => :P112_ID_EMBRGOS_RSLCION,',
'                                                            p_id_slctd_ofcio     => :P112_ID_SLCTD_OFCIO,',
'                                                            p_id_plntlla         => :P112_ID_PLNTLLA,',
'                                                            p_dcmnto             => :P112_DCMNTO,',
'                                                            --p_id_usrio         => :F_ID_USRIO,',
'                                                            p_tpo_dcmnto         => :P112_TIPO_DCMNTO,',
'                                                            p_request            => :REQUEST);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Operaci\00F3n realizada de forma exitosa!!')
);
end;
/
