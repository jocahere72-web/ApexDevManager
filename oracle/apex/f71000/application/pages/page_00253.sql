prompt --application/pages/page_00253
begin
wwv_flow_api.create_page(
 p_id=>253
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Generaci\00F3n de Actos T\00EDtulos Judiciales')
,p_step_title=>unistr('Generaci\00F3n de Actos T\00EDtulos Judiciales')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var json = window.localStorage.jsonTitulos;',
'if (json !== null){',
'    $s(''P253_JSON'', json);',
'    /*',
'    apex.server.process(''cargar_datos'', {pageItems: ''#P253_JSON''}).then((resp) => {',
'        console.log(resp);',
'        $s(''P253_ID_TTLO_JDCIAL_DCMNTO'', resp.P253_ID_TTLO_JDCIAL_DCMNTO);',
'        $s(''P253_ID_PLNTLLA'', resp.P253_ID_PLNTLLA);',
'         apex_json.write(''P253_ID_TTLO_JDCIAL_DCMNTO'', v_id_ttlo_jdcial_dcmnto);',
'    apex_json.write(''P253_DCMNTO''               , v_dcmnto);',
'    apex_json.write(''P253_ID_PLNTLLA''           , v_id_plntlla);',
'        ',
'    });*/',
'}',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#P253_DCMNTO_DISPLAY{',
'    width: 99.5% !important;',
'}'))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ACARABALLO'
,p_last_upd_yyyymmddhh24miss=>'20250909071856'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11815870106526103)
,p_plug_name=>unistr('Generaci\00F3n de Actos')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(414411046188152961)
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
 p_id=>wwv_flow_api.id(529703829079462745)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
'</h5>',
'<i>Funcionalidad que Permite:</i><br><br>',
unistr('<i><b>1.</b> Visualizar y Editar Plantilla de Acto generado dentro de esta etapa de T\00EDtulos Judiciales.</i><br><br>'),
unistr('<i><b>2.</b> Generar el Acto asociado a la etapa de T\00EDtulos Judiciales.</i><br><br></i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11848070883054765)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(414411046188152961)
,p_button_name=>'REGRESAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11816383619526108)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(414411046188152961)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>'P253_ID_TTLO_JDCIAL_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11816486467526109)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(414411046188152961)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P253_ID_TTLO_JDCIAL_DCMNTO is not null and :P253_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11816548458526110)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(414411046188152961)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_button_condition=>':P253_ID_TTLO_JDCIAL_DCMNTO is not null and :P253_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12127179921800612)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(414411046188152961)
,p_button_name=>'BTN_GNRAR_OFCIO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Confirmar/Ver Acto'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>':P253_ID_TTLO_JDCIAL_DCMNTO is not null and :P253_ID_ACTO is null'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(12049702376728272)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(11815870106526103)
,p_button_name=>'BTN_GNRAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_button_condition=>'P253_ID_TTLO_JDCIAL_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-cog fa-spin'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12127099271800611)
,p_branch_name=>unistr('Ir a P\00E1gina Retorno')
,p_branch_action=>'f?p=&APP_ID.:&P253_PAGINA.:&SESSION.:RECARGAR :&DEBUG.:RP,&P253_PAGINA.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(11848070883054765)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13276161387032209)
,p_branch_name=>unistr('Ir a P\00E1gina 127 Ver acto')
,p_branch_action=>'f?p=50000:127:&SESSION.::&DEBUG.:RP,127:P127_NOMBRE_TABLA,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR,P127_COLUMNA_FILENAME:v_gn_g_actos,file_blob,file_mimetype,id_acto,&P253_ID_ACTO.,file_name&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'ITEM_IS_NOT_NULL'
,p_branch_condition=>'P253_ID_ACTO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5609799293415302)
,p_name=>'P253_SBMIT'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_item_default=>'Y'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11816124736526106)
,p_name=>'P253_ID_PLNTLLA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_prompt=>'<b>Plantilla</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      distinct a.dscrpcion',
'           ,a.id_plntlla',
'from        gn_d_plantillas        a',
'join  gn_d_actos_tipo_tarea   b   on  b.id_acto_tpo   =   a.id_acto_tpo',
'join  gn_d_actos_tipo         c   on  b.id_acto_tpo   =   c.id_acto_tpo',
'where       a.cdgo_clnte      =    :F_CDGO_CLNTE',
'and         c.cdgo_acto_tpo     =  :P253_CDGO_TTLO_JDCIAL_ESTDO',
'--and         b.id_fljo_trea    =    :F_ID_FLJO_TREA',
'and         a.actvo = ''S''',
'',
'',
'/*select a.dscrpcion d, ',
'       a.id_plntlla r',
'from gn_d_plantillas a',
'join df_s_procesos b on a.id_prcso = b.id_prcso',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'  and b.id_prcso = pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte                => a.cdgo_clnte,',
'                                                                    p_cdgo_dfncion_clnte_ctgria => ''TJP'',',
'                                                                    p_cdgo_dfncion_clnte        => :P253_CDGO_TTLO_JDCIAL_ESTDO);*/',
';'))
,p_lov_display_null=>'YES'
,p_colspan=>8
,p_grid_label_column_span=>2
,p_display_when=>'P253_ID_TTLO_JDCIAL_DCMNTO'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11816245772526107)
,p_name=>'P253_DCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>wwv_flow_api.id(177355349858050629)
,p_item_template_options=>'#DEFAULT#'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (options){',
'',
'    CKEDITOR.plugins.add( ''hcard'', {',
'			requires: ''widget'',',
'			init: function( editor ) {',
'				editor.widgets.add( ''hcard'', {',
'					allowedContent: ''span(!h-card); a[href](!u-email,!p-name); span(!p-tel)'',',
'					requiredContent: ''span(h-card)'',',
'					pathName: ''hcard'',',
'					upcast: function( el ) {',
'						return el.name == ''span'' && el.hasClass( ''h-card'' );',
'					}',
'				} );',
'',
'				editor.addFeature( editor.widgets.registered.hcard );',
'',
'				editor.on( ''paste'', function( evt ) {',
'					var column = evt.data.dataTransfer.getData( ''column'' );',
'					if ( !column ) {',
'						return;',
'					}',
'                    ',
'                    var element = CKEDITOR.dom.element.createFromHtml(column);',
'                    CKEDITOR.instances.P110_PRRFO.insertElement( element );                   ',
'                    return;',
'				});',
'			}',
'		});',
'    ',
'		CKEDITOR.on( ''instanceReady'', function(ev) {            ',
'            var columnslist = CKEDITOR.document.getById( ''columnslist'' );',
'            if (columnslist) {',
'			    columnslist.on( ''dragstart'', function( evt ) {                   ',
'                    CKEDITOR.plugins.clipboard.initDragDataTransfer( evt );',
'                    var dataTransfer = evt.data.dataTransfer; ',
'                    dataTransfer.setData( ''column'', $(evt.data.$.target).data(''valor'') );',
'                    dataTransfer.setData( ''text/html'', ''<hidden><hidden>'' );',
'			    });                ',
'            }',
'            ',
'            var varlist = CKEDITOR.document.getById( ''varlist'' );',
'            if (varlist) {',
'			    varlist.on( ''dragstart'', function( evt ) {                   ',
'                    CKEDITOR.plugins.clipboard.initDragDataTransfer( evt );',
'                    var dataTransfer = evt.data.dataTransfer; ',
'                    dataTransfer.setData( ''column'', $(evt.data.$.target).data(''valor'') );',
'                    dataTransfer.setData( ''text/html'', ''<hidden><hidden>'' );',
'			    });                ',
'            }            ',
'		} );',
'    ',
'    options.skin = ''office2013,skins/office2013/'';',
'    options.width = ''100%'';',
'    options.height = 400;',
'    options.resize_enabled = false; ',
'    options.enterMode = 2;	',
'    return  options;',
'}'))
,p_attribute_03=>'Y'
,p_attribute_04=>'kama'
,p_attribute_05=>'top'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11816814647526113)
,p_name=>'P253_ID_TTLO_JDCIAL_DCMNTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12126797365800608)
,p_name=>'P253_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13622100625992904)
,p_name=>'P253_CDGO_TTLO_JDCIAL_ESTDO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13623263956992915)
,p_name=>'P253_ID_TTLO_JDCIAL_SLCTUD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14426291304448032)
,p_name=>'P253_JSON_PAGINA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14523619502933901)
,p_name=>'P253_JSON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14523825878933903)
,p_name=>'P253_PAGINA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14748945416329801)
,p_name=>'P253_CDGO_TTLO_JDCIAL_SLCTUD_TPO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17548000284471401)
,p_name=>'P253_JSON_CNSGNR'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17548180424471402)
,p_name=>'P253_JSON_DVLVR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17559248482875101)
,p_name=>'P253_ID_INSTNCIA_FLJO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18072803224375301)
,p_name=>'P253_JSON_FRCCNR'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18746114863091002)
,p_name=>'P253_JSON_CNSGNR_DVLVR'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(18954275498229201)
,p_name=>'P253_ID_ACTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(207912034888861235)
,p_name=>'P253_ID_TTLO_JDCIAL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(11815870106526103)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(11816921255526114)
,p_validation_name=>'Validar plantilla no nula'
,p_validation_sequence=>10
,p_validation=>'P253_ID_PLNTLLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Debe seleccionar una Plantilla'
,p_validation_condition=>'BTN_GNRAR,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(11816124736526106)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(11817076352526115)
,p_validation_name=>'Validar documento no nulo'
,p_validation_sequence=>20
,p_validation=>'P253_DCMNTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('El Documento no puede estar vac\00EDo')
,p_when_button_pressed=>wwv_flow_api.id(11816383619526108)
,p_associated_item=>wwv_flow_api.id(11816245772526107)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13623302662992916)
,p_name=>unistr('Ejecutar P\00E1gina')
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13623466974992917)
,p_event_id=>wwv_flow_api.id(13623302662992916)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14141829282580502)
,p_process_sequence=>60
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select id_acto',
'      into :P253_ID_ACTO',
'      from gf_g_titulos_jdcial_dcmnto',
'     where id_ttlo_jdcial_dcmnto = :P253_ID_TTLO_JDCIAL_DCMNTO; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14749053306329802)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar JSON'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   if :P253_JSON is null then',
'        :P253_JSON := v(:P253_JSON_PAGINA);                ',
'   end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':P253_CDGO_TTLO_JDCIAL_ESTDO = ''SDT'' or :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CDT'''
,p_process_when_type=>'PLSQL_EXPRESSION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12126017907800601)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
' /*   :P253_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''<CDGO_CLNTE>''|| :F_CDGO_CLNTE ||''</CDGO_CLNTE>',
'                                                       <ID_TTLO_JDCIAL>''|| :P253_JSON ||''</ID_TTLO_JDCIAL>',
'                                                       <ID_PLNTLLA>''|| :P253_ID_PLNTLLA ||''</ID_PLNTLLA>',
'                                                       <CDGO_TTLO_JDCIAL_SLCTUD_TPO>''|| :P253_CDGO_TTLO_JDCIAL_ESTDO ||''</CDGO_TTLO_JDCIAL_SLCTUD_TPO>'', :P253_ID_PLNTLLA);',
'                                                       */',
'                                                       ',
'    :P253_DCMNTO := pkg_gn_generalidades.fnc_ge_dcmnto(''{"id_instncia_fljo":"'' ||',
'                                                      :F_ID_INSTNCIA_FLJO || ''"}''                                                       ',
'                                                       , :P253_ID_PLNTLLA);                              ',
'                                                       ',
'exception',
'    when others then',
unistr('           RAISE_APPLICATION_ERROR(-20000, ''Seleccione la plantilla de solicitud devoluci\00F3n t\00EDtulo''); '),
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(12049702376728272)
,p_process_success_message=>'Documento Generado Satisfactoriamente!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13860020552642983)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Registrar Solicitud de devoluci\00F3n de t\00EDtulo')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'    ',
'    pkg_gf_titulos_judicial.prc_rg_solicitud_dvlcion_ttlo(p_cdgo_clnte                   =>    :F_CDGO_CLNTE,',
'                                                          p_json_ttlos                   =>    :P253_JSON_DVLVR,--:P253_JSON,',
'                                                          p_id_usrio		             =>    :F_ID_USRIO,',
'                                                          p_cdgo_ttlo_jdcial_slctud_tpo  =>    :P253_CDGO_TTLO_JDCIAL_SLCTUD_TPO,',
'                                                          p_id_ttlo_jdcial               =>    :P253_ID_TTLO_JDCIAL,',
'                                                          o_id_ttlo_jdcial_slctud	     =>    :P253_ID_TTLO_JDCIAL_SLCTUD,',
'                                                          o_cdgo_rspsta	                 =>    v_cdgo_rspsta,',
'                                                          o_mnsje_rspsta	             =>    :P253_RSPSTA);',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(11816383619526108)
,p_process_when=>'P253_CDGO_TTLO_JDCIAL_ESTDO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'SDT'
,p_process_success_message=>'&P253_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12126187294800602)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin ',
'    --Se construye el JSON                    ',
'    begin',
'        select json_object(key ''ID_TTLO_JDCIAL_SLCTUD'' is :P253_ID_TTLO_JDCIAL_SLCTUD)',
'          into v_json',
'          from dual;',
'          ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Error al construir el json de la solicitud'');',
'    end;',
'    if :P253_CDGO_TTLO_JDCIAL_ESTDO = ''SDT'' then',
'        begin',
'        pkg_gf_titulos_judicial.prc_rg_documento_ttlo_jdcial(p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_json_slctud_ttlos           =>   v_json,',
'                                                             p_cdgo_ttlo_jdcial_slctud_tpo =>   ''SDT'',',
'                                                             p_id_plntlla                  =>   :P253_ID_PLNTLLA,',
'                                                             p_dcmnto                      =>   :P253_DCMNTO,  ',
'                                                             --p_request                     =>   :REQUEST,   ',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             p_id_ttlo_jdcial              =>   :P253_ID_TTLO_JDCIAL,',
'                                                             p_json_ttlos                  =>   :P253_JSON_DVLVR,',
'                                                             o_id_ttlo_jdcial_dcmnto       =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P253_RSPSTA);',
'        if v_cdgo_rspsta > 0 then',
'            raise_application_error(-20001, :P253_RSPSTA);',
'        end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CDT'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_rg_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_cdgo_ttlo_jdcial_slctud_tpo =>   ''CDT'',',
'                                                                 p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_json_ttlos              =>   :P253_JSON_DVLVR,',
'                                                                 o_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''FRC'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_rg_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_cdgo_ttlo_jdcial_slctud_tpo =>   ''FRC'',',
'                                                                 p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_json_ttlos		       =>   :P253_JSON_FRCCNR,',
'                                                                 o_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO in (''CNS'',''CMP'',''CYC'') then',
'        begin',
'            pkg_gf_titulos_judicial.prc_rg_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_cdgo_ttlo_jdcial_slctud_tpo =>   ''CNS'',',
'                                                                 p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_json_ttlos              =>   :P253_JSON_CNSGNR,',
'                                                                 o_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''ATJ'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_rg_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_cdgo_ttlo_jdcial_slctud_tpo =>   ''CNS'',',
'                                                                 p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_json_ttlos              =>   :P253_JSON_CNSGNR,',
'                                                                 o_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CYD'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_rg_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_cdgo_ttlo_jdcial_slctud_tpo =>   ''CNS'',',
'                                                                 p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_json_ttlos              =>   :P253_JSON_CNSGNR_DVLVR,',
'                                                                 o_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(11816383619526108)
,p_process_success_message=>'&P253_RSPSTA.'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(208429993729275302)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Actualizar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin ',
'    --Se construye el JSON                    ',
'    begin',
'        select json_object(key ''ID_TTLO_JDCIAL_SLCTUD'' is :P253_ID_TTLO_JDCIAL_SLCTUD)',
'          into v_json',
'          from dual;',
'          ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Error al construir el json de la solicitud'');',
'    end;',
'    if :P253_CDGO_TTLO_JDCIAL_ESTDO = ''SDT'' then',
'        begin',
'        pkg_gf_titulos_judicial.prc_ac_documento_ttlo_jdcial(p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_json_slctud_ttlos           =>   v_json,',
'                                                             p_cdgo_ttlo_jdcial_slctud_tpo =>   ''SDT'',',
'                                                             --p_id_plntlla                  =>   :P253_ID_PLNTLLA,',
'                                                             p_dcmnto                      =>   :P253_DCMNTO,  ',
'                                                             --p_request                     =>   :REQUEST,   ',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             p_id_ttlo_jdcial              =>   :P253_ID_TTLO_JDCIAL,',
'                                                             p_id_ttlo_jdcial_dcmnto       =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P253_RSPSTA);',
'',
'',
'        if v_cdgo_rspsta > 0 then',
'            raise_application_error(-20001, :P253_RSPSTA);',
'        end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CDT'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_ac_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''FRC'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_ac_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CNS'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_ac_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''ATJ'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_ac_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CYD'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_ac_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial          =>   :P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(11816486467526109)
,p_process_when=>'P253_ID_TTLO_JDCIAL_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P253_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(208430034737275303)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Plantilla'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'    v_json           clob;',
'begin ',
'    --Se construye el JSON                    ',
'    begin',
'        select json_object(key ''ID_TTLO_JDCIAL_SLCTUD'' is :P253_ID_TTLO_JDCIAL_SLCTUD)',
'          into v_json',
'          from dual;',
'          ',
'    exception',
'        when others then',
'            raise_application_error(-20001, ''Error al construir el json de la solicitud'');',
'    end;',
'    if :P253_CDGO_TTLO_JDCIAL_ESTDO = ''SDT'' then',
'        begin',
'        pkg_gf_titulos_judicial.prc_el_documento_ttlo_jdcial(p_cdgo_clnte                  =>   :F_CDGO_CLNTE,',
'                                                             p_json_slctud_ttlos           =>   v_json,',
'                                                             p_cdgo_ttlo_jdcial_slctud_tpo =>   ''SDT'',',
'                                                             --p_id_plntlla                  =>   :P253_ID_PLNTLLA,',
'                                                             --p_dcmnto                      =>   :P253_DCMNTO,  ',
'                                                             --p_request                     =>   :REQUEST,   ',
'                                                             p_id_usrio		               =>   :F_ID_USRIO,',
'                                                             p_id_ttlo_jdcial		       =>   json_value(:P253_JSON_DVLVR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                             p_id_ttlo_jdcial_dcmnto       =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                             o_cdgo_rspsta	               =>   v_cdgo_rspsta,',
'                                                             o_mnsje_rspsta	               =>   :P253_RSPSTA);',
'',
'',
'        if v_cdgo_rspsta > 0 then',
'            raise_application_error(-20001, :P253_RSPSTA);',
'        end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CDT'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_el_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 --p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial		   =>   json_value(:P253_JSON_DVLVR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''FRC'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_el_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 --p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial		   =>    json_value(:P253_JSON_FRCCNR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CNS'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_el_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 --p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial		   =>   json_value(:P253_JSON_CNSGNR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''ATJ'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_el_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 --p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial		   =>   json_value(:P253_JSON_CNSGNR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CYD'' then',
'        begin',
'            pkg_gf_titulos_judicial.prc_el_documento_ttlo_jdcial(p_cdgo_clnte              =>   :F_CDGO_CLNTE,',
'                                                                 p_json_slctud_ttlos       =>   :P253_JSON,',
'                                                                 --p_id_plntlla              =>   :P253_ID_PLNTLLA,',
'                                                                 --p_dcmnto                  =>   :P253_DCMNTO,  ',
'                                                                 --p_request                 =>   :REQUEST,   ',
'                                                                 p_id_usrio		           =>   :F_ID_USRIO,',
'                                                                 p_id_ttlo_jdcial		   =>   json_value(:P253_JSON_CNSGNR_DVLVR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>   :P253_ID_TTLO_JDCIAL_DCMNTO, ',
'                                                                 o_cdgo_rspsta	           =>   v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta	           =>   :P253_RSPSTA);',
'            if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'            end if;',
'        end;',
'    end if;',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(11816548458526110)
,p_process_when=>'P253_ID_TTLO_JDCIAL_DCMNTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'&P253_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12127225271800613)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'    if :P253_CDGO_TTLO_JDCIAL_ESTDO in (''ASL'', ''SDT'') then',
'        pkg_gf_titulos_judicial.prc_ac_solicitud_dvlcion_ttlo(p_cdgo_clnte			    =>    :F_CDGO_CLNTE,',
'                                                              p_id_ttlo_jdcial_slctud	=>    :P253_ID_TTLO_JDCIAL_SLCTUD,',
'                                                              p_id_ttlo_jdcial_dcmnto   =>    :P253_ID_TTLO_JDCIAL_DCMNTO,',
'                                                              p_json_ttlos              =>    :P253_JSON_DVLVR,--:P253_JSON,',
'                                                              p_id_usrio			    =>    :F_ID_USRIO,	',
'                                                              p_id_plntlla			    =>    :P253_ID_PLNTLLA,',
'                                                              o_id_acto				    =>    :P253_ID_ACTO,',
'                                                              o_cdgo_rspsta			    =>    v_cdgo_rspsta,',
'                                                              o_mnsje_rspsta		    =>    :P253_RSPSTA);',
'        if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'        end if;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CDT'' then',
'         pkg_gf_titulos_judicial.prc_rg_acto_dvlcion_ttlo_jdcial(p_cdgo_clnte		       =>    :F_CDGO_CLNTE,',
'                                                                 p_json_ttlos              =>    :P253_JSON_DVLVR,--:P253_JSON,',
'                                                                 p_id_ttlo_jdcial_dcmnto   =>    :P253_ID_TTLO_JDCIAL_DCMNTO,',
'                                                                 p_id_usrio			       =>    :F_ID_USRIO,',
'                                                                 p_id_plntlla		       =>    :P253_ID_PLNTLLA,',
'                                                                 o_id_acto			       =>    :P253_ID_ACTO,',
'                                                                 o_cdgo_rspsta		       =>    v_cdgo_rspsta,',
'                                                                 o_mnsje_rspsta		       =>    :P253_RSPSTA);',
'        if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'        end if;',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''FRC'' then',
'         pkg_gf_titulos_judicial.prc_rg_acto_ttlo_jdcial(p_cdgo_clnte		       =>    :F_CDGO_CLNTE,',
'                                                         p_id_ttlo_jdcial		   =>    json_value(:P253_JSON_FRCCNR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                         p_id_ttlo_jdcial_dcmnto   =>    :P253_ID_TTLO_JDCIAL_DCMNTO,',
'                                                         p_id_usrio			       =>    :F_ID_USRIO,',
'                                                         p_id_plntlla		       =>    :P253_ID_PLNTLLA,',
'                                                         p_cdgo_ttlo_jdcial_estdo  =>    :P253_CDGO_TTLO_JDCIAL_ESTDO,',
'                                                         p_obsrvcion_estdo		   =>    ''Titulo Fraccionado'',',
'                                                         o_id_acto			       =>    :P253_ID_ACTO,',
'                                                         o_cdgo_rspsta		       =>    v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta		       =>    :P253_RSPSTA);',
'        if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'        end if;',
'     elsif :P253_CDGO_TTLO_JDCIAL_ESTDO in (''CNS'', ''ATJ'',''ACN'',''CMP'', ''CYC'') then',
'         pkg_gf_titulos_judicial.prc_rg_acto_ttlo_jdcial(p_cdgo_clnte		       =>    :F_CDGO_CLNTE,',
'                                                         p_id_ttlo_jdcial		   =>    json_value(:P253_JSON_CNSGNR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                         p_id_ttlo_jdcial_dcmnto   =>    :P253_ID_TTLO_JDCIAL_DCMNTO,',
'                                                         p_id_usrio			       =>    :F_ID_USRIO,',
'                                                         p_id_plntlla		       =>    :P253_ID_PLNTLLA,',
'                                                         p_cdgo_ttlo_jdcial_estdo  =>    :P253_CDGO_TTLO_JDCIAL_ESTDO,',
'                                                         p_obsrvcion_estdo		   =>    ''Titulo Consignado'',',
'                                                         o_id_acto			       =>    :P253_ID_ACTO,',
'                                                         o_cdgo_rspsta		       =>    v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta		       =>    :P253_RSPSTA);',
'        if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'        end if;',
'     elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CYD'' then',
'         pkg_gf_titulos_judicial.prc_rg_acto_ttlo_jdcial(p_cdgo_clnte		       =>    :F_CDGO_CLNTE,',
'                                                         p_id_ttlo_jdcial		   =>    json_value(:P253_JSON_CNSGNR_DVLVR, ''$.id_ttlo_jdcial''),--:P253_ID_TTLO_JDCIAL,',
'                                                         p_id_ttlo_jdcial_dcmnto   =>    :P253_ID_TTLO_JDCIAL_DCMNTO,',
'                                                         p_id_usrio			       =>    :F_ID_USRIO,',
'                                                         p_id_plntlla		       =>    :P253_ID_PLNTLLA,',
'                                                         p_cdgo_ttlo_jdcial_estdo  =>    :P253_CDGO_TTLO_JDCIAL_ESTDO,',
'                                                         p_obsrvcion_estdo		   =>    ''Titulo Consignado/Devuelto'',',
'                                                         p_json_ttlos              =>    :P253_JSON_CNSGNR_DVLVR,',
'                                                         o_id_acto			       =>    :P253_ID_ACTO,',
'                                                         o_cdgo_rspsta		       =>    v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta		       =>    :P253_RSPSTA);',
'        if v_cdgo_rspsta > 0 then',
'                raise_application_error(-20001, :P253_RSPSTA);',
'        end if;   ',
'    end if;',
'    apex_util.set_session_state(''F_ID_FLJO_TREA'','''');',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(12127179921800612)
,p_process_when=>'P253_ID_ACTO'
,p_process_when_type=>'ITEM_IS_NULL'
,p_process_success_message=>'&P253_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14300694393207601)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Finalizar Flujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'    pkg_gf_titulos_judicial.prc_tr_fnlzar_fljo_ttlo_jdcial(p_cdgo_clnte       =>    :F_CDGO_CLNTE,',
'                                                           p_json_ttlos		  =>    :P253_JSON,',
'                                                           p_id_usrio         =>    :F_ID_USRIO,',
'                                                           p_id_acto          =>    :P253_ID_ACTO,',
'                                                           o_cdgo_rspsta      =>    v_cdgo_rspsta,',
'                                                           o_mnsje_rspsta     =>    :P253_RSPSTA);',
'end;           '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(12127179921800612)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12126844145800609)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Limpiar Editor'
,p_attribute_01=>'CLEAR_CACHE_FOR_ITEMS'
,p_attribute_03=>'P253_ID_PLNTLLA,P253_DCMNTO,P253_ID_TTLO_JDCIAL_DCMNTO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(11816548458526110)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(17654700996576802)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Construir Json T\00EDtulos')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P253_CDGO_TTLO_JDCIAL_ESTDO in (''ACN'',''CNS'',''ATJ'',''CMP'',''CYC'') then',
'        select json_arrayagg(',
'                   json_object (',
'                       ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                   )',
'               ) as json_titulos',
'        into :P253_JSON_CNSGNR',
'        from (',
'            select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'            where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'            and a.cdgo_ttlo_jdcial_estdo in (''ACN'', ''CNS'', ''ATJ'',''CMP'',''CYC'')',
'        );',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO in (''ASL'',''SDT'',''CDT'') then',
'        select json_arrayagg(',
'                   json_object (',
'                       ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                   )',
'               ) as json_titulos',
'        into :P253_JSON_DVLVR',
'        from (',
'            select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'            where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'            and a.cdgo_ttlo_jdcial_estdo in (''ASL'', ''SDT'', ''CDT'')',
'        );',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''FRC'' then',
'        select json_arrayagg(',
'                   json_object (',
'                       ''id_ttlo_jdcial'' value id_ttlo_jdcial',
'                   )',
'               ) as json_titulos',
'        into :P253_JSON_FRCCNR',
'        from (',
'            select a.id_ttlo_jdcial from gf_g_titulos_judicial a',
'            where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'            and a.cdgo_ttlo_jdcial_estdo = ''FRC''',
'        );',
'    elsif :P253_CDGO_TTLO_JDCIAL_ESTDO = ''CYD'' then',
'        select json_arrayagg(',
'                   json_object (',
'                       ''id_ttlo_jdcial'' value id_ttlo_jdcial,',
'                       ''cdgo_ttlo_jdcial_estdo'' value cdgo_ttlo_jdcial_estdo',
'                   )',
'               ) as json_titulos',
'        into :P253_JSON_CNSGNR_DVLVR',
'        from (',
'            select a.id_ttlo_jdcial, a.cdgo_ttlo_jdcial_estdo from gf_g_titulos_judicial a',
'            where a.id_instncia_fljo = :F_ID_INSTNCIA_FLJO',
'            and a.cdgo_ttlo_jdcial_estdo in (''ACN'',''CNS'',''ATJ'', ''ASL'',''SDT'',''CDT'')',
'        );',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(208161880649658401)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento SDT/CNS/ATJ'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select b.id_ttlo_jdcial_dcmnto',
'           ,b.dcmnto',
'           ,b.id_plntlla',
'           ,v(:P253_JSON_PAGINA)',
'      into :P253_ID_TTLO_JDCIAL_DCMNTO     ',
'           ,:P253_DCMNTO',
'           ,:P253_ID_PLNTLLA',
'           ,:P253_JSON',
'      from gf_g_titulos_jdcial_dcmnto b',
'      join gf_g_ttls_jdcl_dcmnt_asccn c on b.id_ttlo_jdcial_dcmnto = c.id_ttlo_jdcial_dcmnto',
'      join gn_d_actos_tipo d on d.id_acto_tpo = b.id_acto_tpo',
'     where c.id_ttlo_jdcial = nvl(json_value(:P253_JSON_CNSGNR, ''$.id_ttlo_jdcial''), json_value(:P253_JSON_DVLVR, ''$.id_ttlo_jdcial''))',
'       and d.cdgo_acto_tpo = :P253_CDGO_TTLO_JDCIAL_ESTDO',
'       and rownum = 1;',
'exception ',
'    when others then',
'        :P253_ID_TTLO_JDCIAL_DCMNTO := null;',
'        :P253_DCMNTO := null;',
'        :P253_ID_PLNTLLA := null;',
'        :P253_JSON := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P253_DCMNTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18717279362130101)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento FRC'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select b.id_ttlo_jdcial_dcmnto',
'           ,b.dcmnto',
'           ,b.id_plntlla',
'           ,v(:P253_JSON_PAGINA)',
'      into :P253_ID_TTLO_JDCIAL_DCMNTO     ',
'           ,:P253_DCMNTO',
'           ,:P253_ID_PLNTLLA',
'           ,:P253_JSON',
'      from gf_g_titulos_jdcial_dcmnto b',
'      join gf_g_ttls_jdcl_dcmnt_asccn c on b.id_ttlo_jdcial_dcmnto = c.id_ttlo_jdcial_dcmnto',
'      join gn_d_actos_tipo d on d.id_acto_tpo = b.id_acto_tpo',
'     where c.id_ttlo_jdcial = json_value(:P253_JSON_FRCCNR, ''$.id_ttlo_jdcial'')',
'       and d.cdgo_acto_tpo = :P253_CDGO_TTLO_JDCIAL_ESTDO',
'       and rownum = 1;',
'exception ',
'    when others then',
'        :P253_ID_TTLO_JDCIAL_DCMNTO := null;',
'        :P253_DCMNTO := null;',
'        :P253_ID_PLNTLLA := null;',
'        :P253_JSON := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P253_DCMNTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(18746260906091003)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento CYD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    select b.id_ttlo_jdcial_dcmnto',
'           ,b.dcmnto',
'           ,b.id_plntlla',
'           ,v(:P253_JSON_PAGINA)',
'      into :P253_ID_TTLO_JDCIAL_DCMNTO     ',
'           ,:P253_DCMNTO',
'           ,:P253_ID_PLNTLLA',
'           ,:P253_JSON',
'      from gf_g_titulos_jdcial_dcmnto b',
'      join gf_g_ttls_jdcl_dcmnt_asccn c on b.id_ttlo_jdcial_dcmnto = c.id_ttlo_jdcial_dcmnto',
'      join gn_d_actos_tipo d on d.id_acto_tpo = b.id_acto_tpo',
'     where c.id_ttlo_jdcial = json_value(:P253_JSON_CNSGNR_DVLVR, ''$.id_ttlo_jdcial'')',
'       and d.cdgo_acto_tpo = :P253_CDGO_TTLO_JDCIAL_ESTDO',
'       and rownum = 1;',
'exception ',
'    when others then',
'        :P253_ID_TTLO_JDCIAL_DCMNTO := null;',
'        :P253_DCMNTO := null;',
'        :P253_ID_PLNTLLA := null;',
'        :P253_JSON := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P253_DCMNTO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14141903126580503)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargue Datos Documento Solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' begin ',
'    select b.id_ttlo_jdcial_dcmnto',
'           ,b.dcmnto',
'           ,b.id_plntlla',
'           ,v(:P253_JSON_PAGINA)',
'      into :P253_ID_TTLO_JDCIAL_DCMNTO     ',
'           ,:P253_DCMNTO',
'           ,:P253_ID_PLNTLLA',
'           ,:P253_JSON',
'      from gf_g_ttlos_jdcl_dcmnt_slctd a',
'      join gf_g_titulos_jdcial_dcmnto b on a.id_ttlo_jdcial_dcmnto = b.id_ttlo_jdcial_dcmnto',
'      left join (select id_ttlo_jdcial_slctud',
'              from json_table(v(:P253_JSON_PAGINA) , ''$[*]''',
'                      columns (id_ttlo_jdcial_slctud varchar2 path ''$.ID_TTLO_JDCIAL_SLCTUD''))) c on a.id_ttlo_jdcial_slctud = c.id_ttlo_jdcial_slctud',
'      where /*b.id_acto is null',
'        and */a.id_ttlo_jdcial_slctud is not null',
'        and rownum = 1;',
'exception ',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P253_CDGO_TTLO_JDCIAL_ESTDO'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'ASL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14426050139448030)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cargar_datos_solicitud'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_id_ttlo_jdcial_dcmnto    number;',
'    v_dcmnto                   clob; ',
'    v_id_plntlla               number; ',
'begin',
'',
'    begin',
'        select b.id_ttlo_jdcial_dcmnto',
'               ,b.dcmnto',
'               ,b.id_plntlla',
'          into v_id_ttlo_jdcial_dcmnto --:P253_ID_TTLO_JDCIAL_DCMNTO     ',
'               , v_dcmnto              --,:P253_DCMNTO',
'               , v_id_plntlla          --,:P253_ID_PLNTLLA',
'          from gf_g_ttlos_jdcl_dcmnt_slctd a',
'          join gf_g_titulos_jdcial_dcmnto b on a.id_ttlo_jdcial_dcmnto = b.id_ttlo_jdcial_dcmnto',
'          join (select id_ttlo_jdcial_slctud',
'                  from json_table(:P253_JSON , ''$[*]''',
'                          columns (id_ttlo_jdcial_slctud varchar2 path ''$.ID_TTLO_JDCIAL_SLCTUD''))) c on a.id_ttlo_jdcial_slctud = c.id_ttlo_jdcial_slctud',
'          where b.id_acto is null',
'            and a.id_ttlo_jdcial_slctud is not null',
'            and rownum = 1;',
'            ',
'    exception ',
'        when others then ',
'            null;',
'    end;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''P253_ID_TTLO_JDCIAL_DCMNTO'', v_id_ttlo_jdcial_dcmnto);',
'    apex_json.write(''P253_DCMNTO''               , v_dcmnto);',
'    apex_json.write(''P253_ID_PLNTLLA''           , v_id_plntlla);',
'    apex_json.close_object;',
'',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
