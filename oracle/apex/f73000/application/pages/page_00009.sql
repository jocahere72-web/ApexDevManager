prompt --application/pages/page_00009
begin
wwv_flow_api.create_page(
 p_id=>9
,p_user_interface_id=>wwv_flow_api.id(76451776849582525)
,p_name=>'Documentos'
,p_step_title=>'Documentos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var file_blob = new Blob();',
'async function enviarDocumento(accion) {',
'    apex.message.clearErrors();',
'    var errors = [];',
'    $(''.t-Form-error'').remove();',
'    errors = validate(accion);',
'    if (errors.length === 0) {',
'        $(''#metadatas [required]'').each(function () {',
'            var id = $(this).attr(''id'');',
'            if (!$v(id)) {',
'                errors.push({',
'                    type: "error",',
'                    location: ["page", "inline"],',
'                    pageItem: id,',
'                    message: $(''[for="''+id+''"]'').text() + " es requerido!",',
'                    unsafe: false',
'                });',
'            };',
'        });',
'    }',
'',
'    if (errors.length > 0) {',
'        apex.message.showErrors(errors);',
'    } else {',
'        var resp = await validarMetadatos();',
'        if (resp.type === ''ERROR'') {',
'            console.log(''validar metadatos'', resp);',
'            apex.message.clearErrors();',
'            apex.message.showErrors(resp.errors);',
'            return;',
'        }',
'        gestionarDocumento(accion);',
'    }',
'}',
'',
'function validarMetadatos() {',
'    var json = [];',
'    $(''[id*="INP"]'').each(function () {',
'        var id = $(this).attr(''id'');',
'        var valor = $v(id);',
'        if (valor) {',
'            json.push({',
'                ''key'': id,',
'                ''value'': valor',
'            });',
'        }',
'    });',
'',
'    return apex.server.process(''ValidarMetadatos'', {',
'        pageItems: ''#P9_ID_DCMNTO_TPO'',',
'        f01: JSON.stringify(json)',
'    });',
'}',
'',
'function validate(accion) {',
'    var errors = [];',
'    if (!$v(''P9_ID_DCMNTO_TPO'')) {',
'        errors.push({',
'            type: "error",',
'            location: ["page", "inline"],',
'            pageItem: "P9_ID_DCMNTO_TPO",',
'            message: "Selecciona un elemento de la lista!",',
'            unsafe: false',
'        });',
'    }',
'',
'    if (file_blob.size < 5) {',
'        if (!$v(''P9_FILE_BLOB'') && accion === ''CREATE'') {',
'            errors.push({',
'                type: "error",',
'                location: ["page", "inline"],',
'                pageItem: "P9_FILE_BLOB",',
'                message: "No ha sido seleccionado un Archivo, por favor valide e intente nuevamente.", ',
'                unsafe: false',
'            });',
'        }',
'    }',
'    return errors;',
'}',
'',
'async function gestionarDocumento(accion) {',
'    $waitPopup = apex.widget.waitPopup();',
'    try {',
'        var json = [];',
'        $(''[id*="INP"]'').each(function () {',
'            var id = $(this).attr(''id'');',
'            var valor = $v(id);',
'            if (valor) {',
'                json.push({',
'                    ''key'': id,',
'                    ''value'': valor',
'                });',
'            }',
'        });',
'',
'        var v_blob = document.getElementById(''P9_FILE_BLOB'').files[0] || file_blob;',
'        var formData = new FormData();',
'        if (v_blob)',
'            formData.append(''archivo'', v_blob, v_blob.name || ''scanner.pdf'');',
'        var options = {',
'            method: ''POST'',',
'            body: formData,',
'            headers: {',
'                ''app_session'': $v(''pInstance''),',
'                ''filename'': v_blob.name || ''scanner.pdf'',',
'                ''json'': JSON.stringify(json),',
'                ''documento'': $v(''P9_ID_DCMNTO''),',
'                ''trd_serie'': $v(''P9_ID_TRD_SRIE_DCMNTO_TPO_S'') == 0 ? '''' : $v(''P9_ID_TRD_SRIE_DCMNTO_TPO_S''),',
'                ''tipo_documento'': $v(''P9_ID_DCMNTO_TPO''),',
'                ''accion'': accion',
'            }',
'        };',
'',
'        await fetch(''/ords/api/gdocumental/gestion'', options)',
'            .then(function (response) {',
'                return response.json();',
'            })',
'            .then(function (data) {',
'                if (data.type === ''OK'') {',
'                    $s(''P9_ID_DCMNTO'', data.id_dcmnto);',
'                    var url = `f?p=${$v(''pFlowId'')}:${$v(''pFlowStepId'')}:${$v(''pInstance'')}:MENSAJE:::P9_ID_DCMNTO:${data.id_dcmnto}`;',
'                    window.location.href = url;',
'                } else {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([{',
'                        type: "error",',
'                        location: ["page"],',
'                        message: data.msg,',
'                        unsafe: false',
'                    }]);',
'                }',
'            });',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'function visor(file) {',
'    var container = document.getElementById(''visor'');',
'    if (container.childElementCount > 0)',
'        container.children[0].remove();',
'    if (file) {',
'        var v_url = window.URL.createObjectURL(file);',
'        var visor = document.createElement(''embed'');',
'        var obj = document.createElement(''object'');',
'        obj.setAttribute(''data'', v_url);',
'        obj.setAttribute(''width'', ''100%'');',
'        obj.setAttribute(''height'', ''100%'');',
'        obj.setAttribute(''type'', file.type);',
'        obj.append(visor);',
'        visor.setAttribute(''class'', ''pdfobject'');',
'        visor.setAttribute(''src'', v_url);',
'        visor.setAttribute(''type'', file.type);',
'        visor.setAttribute(''style'', ''overflow: auto; width: 100%; height: 100%;'');',
'        visor.setAttribute(''internalinstanceid'', ''29'');',
'        container.append(obj);',
'    }',
'}',
'',
'',
'async function loadMetadatos() {',
'    var resp = await apex.server.process("loadMetadatas", { pageItems: ''#P9_ID_DCMNTO_TPO'' }, {',
'        dataType: "text",',
'        async: true',
'    });',
'    resp ? $(''#metadatas'').show() : $(''#metadatas'').hide();',
'    $(''#metadatas .t-Region-body'').html(resp);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function ver() {',
'    var $waitPopup = apex.widget.waitPopup();',
'    try {',
'        var docUrl = ''f?p=&APP_ID.:9:&APP_SESSION.:APPLICATION_PROCESS=CargarArchivo:::'';',
'        await fetch(docUrl, {',
'            method: ''GET'',',
'            cache: ''default''',
'        }).then(resp => {',
'            return resp.blob()',
'        }).then(resp => {',
'            visor(resp);',
'        });',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'ver();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_step_template=>wwv_flow_api.id(76345756650582452)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'MCARO'
,p_last_upd_yyyymmddhh24miss=>'20191205161033'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6162360451811311)
,p_plug_name=>'Documentos'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6164588453811333)
,p_plug_name=>'Metadatas'
,p_region_name=>'metadatas'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6164700796811335)
,p_plug_name=>'Visor'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>9
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="visor" class="pdfobject-container" ></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6165957313811347)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(6166040036811348)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(76377741273582469)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
' ',
'    </b>',
'</h5>',
'Funcionalidad permite:<br><br>',
unistr('<b>1.</b> Ingresar, consultar, modificar y eliminar los documentos de la gesti\00F3n documental.<br><br>	'),
unistr('<b>2.</b> Almacenar documentos en el sistema mediante carga de un archivo \00F3 digitalizar un archivo al hacer clic en el bot\00F3n Esc\00E1ner.<br><br>'),
'<b>3.</b> Ingresar en el sistema los metadatos del documento parametrizado.<br><br> ',
unistr('<b>2.</b> Clasificar el documento en la Tabla de Retenci\00F3n Documental de acuerdo con el \00E1rea y el proceso al que pertenece, al hacer clic en el bot\00F3n Agregar TRD, se muestra una ventana para diligenciar los datos correspondientes al documento. <br><b')
||'r> ',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7576748304079322)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(6165957313811347)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_ID_DCMNTO_TPO:&P8_ID_DCMNTO_TPO.'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6164104077811329)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(6165957313811347)
,p_button_name=>'CREATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P9_ID_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(6165209821811340)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(6165957313811347)
,p_button_name=>'SAVE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P9_ID_DCMNTO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7579294926079347)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(6165957313811347)
,p_button_name=>'SCANNER'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>unistr('Esc\00E1ner')
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=50000:909:&SESSION.::&DEBUG.:RP,909:P909_APP_ID,P909_APP_PAGE_ID:&APP_ID.,&APP_PAGE_ID.'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9208073298864814)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(6165957313811347)
,p_button_name=>'AGRGAR_TRD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(76429967275582502)
,p_button_image_alt=>'Agregar TRD'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6162553726811313)
,p_name=>'P9_ID_DCMNTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(6162360451811311)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6162719967811315)
,p_name=>'P9_ID_DCMNTO_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(6162360451811311)
,p_prompt=>'Tipo de Documento'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_dcmnto_tpo || '' - '' || nmbre',
'     , id_dcmnto_tpo ',
'  from gd_d_documentos_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
'   and actvo = ''S''',
'   and (id_dcmnto_tpo in ( select id_dcmnto_tpo from v_gd_d_trd_serie_dcmnto_tpo where id_trd_srie_dcmnto_tpo = :P9_ID_TRD_SRIE_DCMNTO_TPO_S) ',
'    or nvl(:P9_ID_TRD_SRIE_DCMNTO_TPO_S, 0) = 0 )'))
,p_lov_cascade_parent_items=>'P9_ID_TRD_SRIE_DCMNTO_TPO_S'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'Seleccione de la lista el tipo de documento.'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6162812510811316)
,p_name=>'P9_NMRO_DCMNTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(6162360451811311)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6162991894811317)
,p_name=>'P9_FILE_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(6162360451811311)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Archivo'
,p_source=>'FILE_BLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(76429402979582500)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Seleccione el documento que se almacenar\00E1 en el sistema.')
,p_attribute_01=>'DB_COLUMN'
,p_attribute_02=>'FILE_MIMETYPE'
,p_attribute_03=>'FILE_NAME'
,p_attribute_06=>'Y'
,p_attribute_07=>'&P9_FILE_NAME.'
,p_attribute_08=>'attachment'
,p_attribute_11=>'image/*,video/*,application/pdf'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(6163368578811321)
,p_name=>'P9_ID_USRIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(6162360451811311)
,p_item_default=>'F_ID_USRIO'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7576658746079321)
,p_name=>'P9_FILE_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(6162360451811311)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10816720705184605)
,p_name=>'P9_ID_TRD_SRIE_DCMNTO_TPO_S'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(6162360451811311)
,p_item_default=>'0'
,p_prompt=>'TRD Series'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Todos'' as a',
'     , 0 as b',
'  from dual',
' union ',
'select cdgo_trd || '' -'' || nmbre_srie || '' -''|| nmbre_sbsrie || '' -''|| nmbre',
'     , id_trd_srie_dcmnto_tpo ',
'  from v_gd_d_trd_serie_dcmnto_tpo',
' where cdgo_clnte = :F_CDGO_CLNTE ',
''))
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(76429181601582500)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Seleccione de la lista la Serie de Tabla de Retenci\00F3n Documental.')
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6164896004811336)
,p_name=>'al cambiar el tipo de documento'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_ID_DCMNTO_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7577762541079332)
,p_event_id=>wwv_flow_api.id(6164896004811336)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'loadMetadatos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6165573958811343)
,p_name=>'al hacer clic en el boton CREATE'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6164104077811329)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6165601885811344)
,p_event_id=>wwv_flow_api.id(6165573958811343)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'enviarDocumento(''CREATE'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6165781285811345)
,p_name=>unistr('al hacer clic en el bot\00F3n SAVE')
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(6165209821811340)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6165824484811346)
,p_event_id=>wwv_flow_api.id(6165781285811345)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'enviarDocumento(''SAVE'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(6166144012811349)
,p_name=>'al cambiar el archivo'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9_FILE_BLOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(6166254049811350)
,p_event_id=>wwv_flow_api.id(6166144012811349)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var file = this.triggeringElement.files[0];',
'visor(file);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7579435865079349)
,p_name=>'al cerrar la ventana modal escaner'
,p_event_sequence=>70
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7579591929079350)
,p_event_id=>wwv_flow_api.id(7579435865079349)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'file_blob = $(''[src*="f?p="]'')[0].contentWindow.file_blob || new Blob(); ',
'if (file_blob.size > 5)',
'    visor(file_blob);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9208980710864823)
,p_name=>'al cerrar la ventana modal agregar'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(9208073298864814)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9209052474864824)
,p_event_id=>wwv_flow_api.id(9208980710864823)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9_ID_TRD_SRIE_DCMNTO_TPO_S'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':P11_TRD_SRIE'
,p_attribute_07=>'P9_ID_TRD_SRIE_DCMNTO_TPO_S'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11592439986204805)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Mensaje'
,p_process_sql_clob=>'null;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'MENSAJE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Proceso realizado de forma exitosa!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10414592424664108)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Automatic Fecth Row'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_trd_srie_dcmnto_tpo ',
'     , id_dcmnto_tpo ',
'     , nmro_dcmnto ',
'     , file_name ',
'     , id_usrio   ',
'  into :P9_ID_TRD_SRIE_DCMNTO_TPO_S',
'     , :P9_ID_DCMNTO_TPO ',
'     , :P9_NMRO_DCMNTO ',
'     , :P9_FILE_NAME ',
'     , :P9_ID_USRIO',
'  from gd_g_documentos ',
' where id_dcmnto = :P9_ID_DCMNTO;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from gd_g_documentos',
' where id_dcmnto = :P9_ID_DCMNTO'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6165051774811338)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'loadMetadatas'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_html    clob;',
'begin',
'         ',
'    v_html := pkg_gd_gestion_documental.fnc_gn_region_metadatos(p_id_dcmnto_tpo => :P9_ID_DCMNTO_TPO , p_cdgo_clnte => :F_CDGO_CLNTE, p_id_dcmnto => :P9_ID_DCMNTO );',
'    htp.prn(v_html);    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(6165442937811342)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'gestionarDocumento'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_blob                     blob;',
'    v_id_dcmnto                number            := apex_application.g_x01;',
'    v_id_trd_srie_dcmnto_tpo   number            := apex_application.g_x02;',
'    v_id_dcmnto_tpo            number            := apex_application.g_x03;',
'    v_file_name                varchar2(4000)    := apex_application.g_x04;',
'    v_file_mimetype            varchar2(4000)    := apex_application.g_x05;',
'    v_accion                   varchar2(4000)    := apex_application.g_x06; ',
'    v_json                     clob;            ',
'    v_cdgo_rspsta              number;           ',
'    v_mnsje_rspsta             varchar2(4000);',
'    p_apex_file_name           varchar2(4000);',
'    o_id_dcmnto                number;  ',
'    ',
'begin',
'    ',
'    ',
'    for i in 1..apex_application.g_f02.count ',
'    loop',
'        v_json := v_json || apex_application.g_f02(i);',
'    end loop;',
'    ',
'    if apex_application.g_f01.count > 0 then   ',
'        p_apex_file_name := apex_application.g_f01(1);         ',
'        begin',
'            select blob_content',
'              into v_blob',
'              from apex_application_files',
'             where name = p_apex_file_name;   ',
'        exception ',
'            when others then',
'                null;',
'        end;',
'        --delete from apex_application_files where name = p_apex_file_name;   ',
'    end if;',
'    ',
'   pkg_gd_gestion_documental.prc_cd_documentos( p_id_dcmnto                => v_id_dcmnto',
'                                              , p_id_trd_srie_dcmnto_tpo   => v_id_trd_srie_dcmnto_tpo',
'                                              , p_id_dcmnto_tpo            => v_id_dcmnto_tpo',
'                                              , p_file_blob                => v_blob',
'                                              , p_file_name                => v_file_name',
'                                              , p_file_mimetype            => v_file_mimetype',
'                                              , p_id_usrio                 => :F_ID_USRIO',
'                                              , p_cdgo_clnte               => :F_CDGO_CLNTE',
'                                              , p_json                     => v_json',
'                                              , p_accion                   => v_accion',
'                                              , o_cdgo_rspsta              => v_cdgo_rspsta',
'                                              , o_mnsje_rspsta             => v_mnsje_rspsta',
'                                              , o_id_dcmnto                => o_id_dcmnto) ; ',
'    ',
'    ',
'    ',
'    apex_util.set_session_state(''P9_ID_DCMNTO'', o_id_dcmnto);',
'    apex_json.open_object;',
'    apex_json.write(''type'', case when v_cdgo_rspsta = 0 then ''OK'' else ''ERROR'' end );',
'    apex_json.write(''msg'' , v_cdgo_rspsta || '' '' || v_mnsje_rspsta );',
'    apex_json.write(''id_dcmnto'', o_id_dcmnto);',
'    apex_json.close_object;',
'    ',
' exception ',
'    when others then ',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'' , ''Ocurrio un error al procesar el documento.'' ); ',
'        apex_json.close_object;   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7576597077079320)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CargarArchivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    file_name varchar2(2000);',
'    file_blob blob;',
'    file_mimetype varchar2(1000);',
'begin',
'    begin',
'    ',
'        select file_name',
'             , file_blob',
'             , file_mimetype',
'          into file_name',
'             , file_blob',
'             , file_mimetype',
'          from gd_g_documentos',
'          where id_dcmnto = :P9_ID_DCMNTO;',
'          ',
'        if(file_blob is not null and file_name is not null and file_mimetype is not null)then',
'            htp.init;',
'            owa_util.mime_header(file_mimetype, FALSE );',
'            htp.p(''Content-length: '' ||dbms_lob.getlength(file_blob));',
'            htp.p(''Content-Disposition: attachment; filename="'' ||file_name || ''"'' );',
'            htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'            owa_util.http_header_close;',
'            wpg_docload.download_file(file_blob);',
'            apex_application.stop_apex_engine;',
'        end if;',
'        ',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(28576430899727829)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ValidarMetadatos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    clob;',
'    v_json_p  clob;',
'    v_sql     clob;',
'    v_count   number;',
'begin',
'    for i in 1..apex_application.g_f01.count ',
'    loop',
'        v_json := v_json ||  apex_application.g_f01(i);',
'    end loop;',
'    ',
'    begin',
'        select json_arrayagg( json_object(''key'' value k, ''value'' value valor))   ',
'          into v_json_p',
'          from v_gd_d_documentos_tipo_mtdta a',
'          join (select replace(id, ''INP'') id',
'                             , id k   ',
'                             , valor',
'                          from json_table( v_json, ''$[*]''',
'                                      columns( id    varchar2    path    ''$.key'',',
'                                               valor varchar2    path    ''$.value'' ',
'                                             )',
'                                         )',
'              ) b',
'             on b.id             = a.id_dcmnto_tpo_mtdta',
'          where a.id_dcmnto_tpo  = :P9_ID_DCMNTO_TPO',
'            and a.cdgo_clnte     = :F_CDGO_CLNTE',
'            and a.actvo_mtdta    = ''S''',
'            and a.indcdor_unco   = ''S'';',
'    ',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    v_sql := ''select count(1) from ('' || pkg_gd_gestion_documental.fnc_co_metadatas(p_id_dcmnto_tpo  => :P9_ID_DCMNTO_TPO, p_cdgo_clnte => :F_CDGO_CLNTE, p_json => v_json_p ) || '')'';',
'    execute immediate v_sql into v_count;',
'    apex_json.open_object;',
'    if v_count = 0 or v_json_p is null then',
'        apex_json.write(''type'', ''OK''); ',
'    else        ',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.open_array(''errors'');',
'        for c_json in (select a.nmbre',
'                            , b.id ',
'                         from v_gd_d_documentos_tipo_mtdta a',
'                         join (select replace(id, ''INP'') as id_dcmnto_tpo_mtdta ',
'                                    , id   ',
'                                 from json_table( v_json_p, ''$[*]'' columns( id    varchar2    path    ''$.key'') ) )b',
'                           on b.id_dcmnto_tpo_mtdta = a.id_dcmnto_tpo_mtdta',
'                        where a.id_dcmnto_tpo  = :P9_ID_DCMNTO_TPO',
'                          and a.cdgo_clnte     = :F_CDGO_CLNTE',
'                          and a.actvo_mtdta    = ''S'' ',
'                          and a.indcdor_unco   = ''S''',
'                      )',
'        loop',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''error'');',
'            apex_json.open_array(''location'');',
'            apex_json.write(''page'');',
'            apex_json.write(''inline'');',
'            apex_json.close_array;',
'            apex_json.write(''pageItem'', c_json.id);',
'            apex_json.write(''message'', c_json.nmbre || '' debe ser unico'');',
'            apex_json.close_object;',
'        end loop;     ',
'    end if;    ',
'    apex_json.close_all;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
