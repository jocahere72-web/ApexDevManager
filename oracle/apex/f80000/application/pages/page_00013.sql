prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>'Documentos'
,p_step_title=>'Documentos '
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_upd_yyyymmddhh24miss=>'20230911095352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42494071292652109)
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
 p_id=>wwv_flow_api.id(42496787077652136)
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
'<i>',
'<p>Esta funcionalidad permite gestionar los documentos de cada una de las etpas del proceso juridico de cobro.</p>',
'<p> </p>',
'<p> </p>',
'<p><b>Nota:</b> Solo se visualizara la opcion de seleccionar la plantilla cuando no exista el documento.</p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(42539595580401283)
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
 p_id=>wwv_flow_api.id(42540269892401284)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(42494071292652109)
,p_button_name=>'BTN_RGRSAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42540060459401284)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(42494071292652109)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id_prcsos_jrdc_dcmnt_plnt',
'  from cb_g_prcsos_jrdc_dcmnt_plnt p',
'  join cb_g_procesos_jrdco_dcmnto d on d.id_prcsos_jrdco_dcmnto = p.id_prcsos_jrdco_dcmnto',
' where p.id_prcsos_jrdco_dcmnto = :P13_ID_PRCSOS_JRDCO_DCMNTO',
' and d.id_acto is null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42539941550401284)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(42494071292652109)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prcsos_jrdc_dcmnt_plnt',
'  from cb_g_prcsos_jrdc_dcmnt_plnt ',
' where id_prcsos_jrdco_dcmnto = :P13_ID_PRCSOS_JRDCO_DCMNTO'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(49517516507059101)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(42494071292652109)
,p_button_name=>'BTN_IMPRMIR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Imprimir'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_P13_DCMNTO clob;',
'v_P13_ID_PLNTLLA number;',
'v_P13_ID_PRCSOS_JRDC_DCMNT_PLNT number;',
'begin',
'',
'select id_plntlla, ',
'       dcmnto,',
'       id_prcsos_jrdc_dcmnt_plnt',
'  into v_P13_ID_PLNTLLA,',
'       v_P13_DCMNTO,',
'       v_P13_ID_PRCSOS_JRDC_DCMNT_PLNT',
'  from cb_g_prcsos_jrdc_dcmnt_plnt ',
' where id_prcsos_jrdco_dcmnto = :P13_ID_PRCSOS_JRDCO_DCMNTO;',
'     ',
'   if :P13_ID_ACTO is not null and v_p13_dcmnto is not null then',
'       return true;',
'   else',
'       return false;',
'   end if;',
'exception when others then',
'    return false;',
'end;'))
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42496971275652138)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(42494071292652109)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id_prcsos_jrdc_dcmnt_plnt',
'  from cb_g_prcsos_jrdc_dcmnt_plnt p',
'  join cb_g_procesos_jrdco_dcmnto d on d.id_prcsos_jrdco_dcmnto = p.id_prcsos_jrdco_dcmnto',
' where p.id_prcsos_jrdco_dcmnto = :P13_ID_PRCSOS_JRDCO_DCMNTO',
' and d.id_acto is null'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(84982645579475115)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(42494071292652109)
,p_button_name=>'BTN_OBSVCION_RVRSA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Observaciones al <br>reversar estados'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP,43:P43_ID_PRCSOS_JRDCO_DCMNTO:&P13_ID_PRCSOS_JRDCO_DCMNTO.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from (',
'select a.fcha_rgstro,e.dscrpcion,a.obsrvcion',
'from cb_g_prcsos_jrdc_dcmnt_estd a',
'left join wf_d_flujos_tarea_estado e on a.id_fljo_trea_estdo = e.id_fljo_trea_estdo',
'where a.obsrvcion is not null',
'and a.id_prcsos_jrdco_dcmnto = :p13_id_prcsos_jrdco_dcmnto',
'order by a.id_prcsos_jrdco_dcmnto_estdo desc) a;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-clipboard-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(42494367543652112)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(42539595580401283)
,p_button_name=>'BTN_GNRAR_DCMNTO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prcsos_jrdc_dcmnt_plnt',
'  from cb_g_prcsos_jrdc_dcmnt_plnt ',
' where id_prcsos_jrdco_dcmnto = :P13_ID_PRCSOS_JRDCO_DCMNTO'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(42497151637652140)
,p_branch_name=>'Go To Page 13'
,p_branch_action=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13:P13_ID_ACTO_TPO,P13_BRANCH,P13_ID_PRCSOS_JRDCO,P13_ID_PRCSOS_JRDCO_DCMNTO,P13_NOMBRE_ETPA,P13_IDNTFCCION,P13_NMRO_PRCSO_JRDCO,P13_ID_ACTO,P13_ID_RPRTE,P13_FLJO_TREA:&P13_ID_ACTO_TPO.,&P13_BRANCH.,&P13_ID_PRCSOS_JRDCO.,&P13_ID_PRCSOS_JRDCO_DCMNTO.,&P13_NOMBRE_ETPA.,&P13_IDNTFCCION.,&P13_NMRO_PRCSO_JRDCO.,&P13_ID_ACTO.,&P13_ID_RPRTE.,&P13_FLJO_TREA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(42496971275652138)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(49517626117059102)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP,2:P2_ID_RPRTE,P2_XML:&P13_ID_RPRTE.,<data> 	<id_prcsos_jrdco_dcmnto>&P13_ID_PRCSOS_JRDCO_DCMNTO.</id_prcsos_jrdco_dcmnto> 	<id_prcsos_jrdco>&P13_ID_PRCSOS_JRDCO.</id_prcsos_jrdco> 	<funcion>pkg_cb_proceso_juridico.prc_ac_acto(p_file_blob => Â¡file_blob ! p_id_acto => &P13_ID_ACTO.)</funcion> </data>&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(49517516507059101)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42494165490652110)
,p_name=>'P13_ID_ACTO_TPO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42494418277652113)
,p_name=>'P13_BRANCH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42494534818652114)
,p_name=>'P13_ID_PRCSOS_JRDCO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42542220461401287)
,p_name=>'P13_ID_PRCSOS_JRDC_DCMNT_PLNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42542643511401298)
,p_name=>'P13_ID_PRCSOS_JRDCO_DCMNTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42543094397401298)
,p_name=>'P13_ID_PLNTLLA'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_prompt=>'Plantilla'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion,',
'       id_plntlla',
'  from gn_d_plantillas',
' where id_acto_tpo = :P13_ID_ACTO_TPO'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prcsos_jrdc_dcmnt_plnt',
'  from cb_g_prcsos_jrdc_dcmnt_plnt ',
' where id_prcsos_jrdco_dcmnto = :P13_ID_PRCSOS_JRDCO_DCMNTO'))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(17408658834919398)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Plantilla de documento de acuerdo a la etapa. '
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(42543415761401299)
,p_name=>'P13_DCMNTO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
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
 p_id=>wwv_flow_api.id(49517751732059103)
,p_name=>'P13_ID_ACTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62816536886590318)
,p_name=>'P13_ID_RPRTE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(62816762575590320)
,p_name=>'P13_FLJO_TREA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83919520962975501)
,p_name=>'P13_NMRO_PRCSO_JRDCO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_prompt=>'<b>Proceso Juridico:</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>8
,p_grid_label_column_span=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Numero del proceso jur\00EDdico seleccionado.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83919629774975502)
,p_name=>'P13_IDNTFCCION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_prompt=>'<b>Sujeto:</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identificaci\00F3n asociada al proceso jur\00EDdico.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83919703697975503)
,p_name=>'P13_NOMBRE_ETPA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(42539595580401283)
,p_prompt=>'<b>Etapa</b>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_label_column_span=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(17408383121919397)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Etapa actual del proceso jur\00EDdico.')
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(62816612631590319)
,p_computation_sequence=>10
,p_computation_item=>'P13_ID_RPRTE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.id_rprte',
'from gn_d_plantillas a',
'join gn_d_actos_tipo_tarea c on C.id_acto_tpo = A.id_acto_tpo ',
'where C.id_fljo_trea = :P13_FLJO_TREA',
'group by A.id_rprte;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(42496819955652137)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Datos del Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select id_plntlla, ',
'           dcmnto,',
'           id_prcsos_jrdc_dcmnt_plnt',
'      into :P13_ID_PLNTLLA,',
'           :P13_DCMNTO,',
'           :P13_ID_PRCSOS_JRDC_DCMNT_PLNT',
'      from cb_g_prcsos_jrdc_dcmnt_plnt ',
'     where id_prcsos_jrdco_dcmnto = :P13_ID_PRCSOS_JRDCO_DCMNTO;',
'      ',
'exception when others then ',
'           null; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(42494215994652111)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--:P13_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<id_prcsos_jrdco>''|| :P13_ID_PRCSOS_JRDCO ||''</id_prcsos_jrdco><id_prcsos_jrdco_dcmnto>''|| :P13_ID_PRCSOS_JRDCO_DCMNTO ||''</id_prcsos_jrdco_dcmnto>'', :P13_ID_PLNTLLA);',
'',
':P13_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_prcsos_jrdco" : "''||:P13_ID_PRCSOS_JRDCO||''","id_prcsos_jrdco_dcmnto" : "''||:P13_ID_PRCSOS_JRDCO_DCMNTO||''"}'', :P13_ID_PLNTLLA);',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(42494367543652112)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(42496660442652135)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Gestionar Documento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_mdio_ntfccion number;',
'    v_id_lte_gnrado    number;',
'    v_cdgo_rspsta      number;',
'    v_mnsje_rspsta     varchar2(1000);',
'begin',
'    ',
'    insert into muerto (v_001, v_002, t_001) values(''val_med_not_cnm'', :P13_ID_MDIO, systimestamp); commit;',
'    ',
'    if pkg_cb_proceso_persuasivo.fnc_cl_parametro_configuracion(p_cdgo_clnte => :F_CDGO_CLNTE, p_cdgo_cnfgrcion => ''SMD'') = ''S'' and :P13_ID_MDIO is not null then',
'        v_id_mdio_ntfccion := :P13_ID_MDIO;',
'    else',
'        v_id_mdio_ntfccion := null;',
'    end if;',
'    ',
'    pkg_cb_proceso_juridico.prc_rg_lote_impresion_documentos(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                             p_cdgo_prcso   => ''GCB'',',
'                                                             p_id_acto_tpo  => :P13_ID_ACTO_TPO,',
'                                                             p_id_usrio     => :F_ID_USRIO,',
unistr('                                                             p_obsrvcion    => ''Lote de impresion asignado de forma autom\00E1tica durante la generaci\00F3n de actos.'','),
'                                                             o_lte_gnrdo    => v_id_lte_gnrado,',
'                                                             o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta => v_mnsje_rspsta);',
'    ',
'   if v_cdgo_rspsta <> 0 then',
'        raise_application_error(-20001, v_mnsje_rspsta);',
'    end if;',
'    ',
'    pkg_cb_proceso_juridico.prc_rg_documento( p_id_prcsos_jrdc_dcmnt_plnt => :P13_ID_PRCSOS_JRDC_DCMNT_PLNT,',
'                                              p_id_prcsos_jrdco_dcmnto    => :P13_ID_PRCSOS_JRDCO_DCMNTO,',
'                                              p_id_plntlla                => :P13_ID_PLNTLLA,',
'                                              p_dcmnto                    => :P13_DCMNTO,',
'                                              p_id_usrio                  => :F_ID_USRIO, ',
'                                              p_id_lte_imprsion           => v_id_lte_gnrado,',
'                                              p_request                   => :REQUEST);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>unistr('Operaci\00F3n realizada de forma exitosa!!')
);
end;
/
