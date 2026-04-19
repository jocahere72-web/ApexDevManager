prompt --application/pages/page_00036
begin
wwv_flow_api.create_page(
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(30413944355578333)
,p_name=>unistr('Notificaci\00F3n Masiva Por Portal')
,p_step_title=>unistr('Notificaci\00F3n Masiva Por Portal')
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_json;',
'var v_id_nt_crtfcdo_json;',
'',
'function obtenerActos() {',
'',
'    var region = apex.region("actos");',
'    var responsables = [];',
'',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'',
'',
'        if (records.length > 0) {  // Verifica si hay registros seleccionados',
'            records.forEach(function (record) {',
'                var idActo = model.getValue(record, "ID_ACTO").trim();',
'                responsables.push({ "ID_ACTO": idActo });',
'            });',
'',
'            v_json = JSON.stringify(responsables);',
'',
'            window.localStorage.setItem(''v_json'', JSON.stringify(v_json));',
'',
'            $s("P36_JSON_ACTOS", v_json);',
'            console.log(v_json);',
'',
'            let count = JSON.parse(v_json).length;',
'',
'            if (apex.item("P36_NTFCDO").getValue() === ''N'' || apex.item("P36_NTFCDO").getValue() === ''S'' || apex.item("P36_NTFCDO").getValue() === ''T'') {',
'',
'                if (count > 0) {',
'                    if (count <= 50) {',
'                        $("#publicar").show();',
'                        $("#publicar_job").hide();',
'                    } else {',
'                        $("#publicar_job").show();',
'                        $("#publicar").hide();',
'                    }',
'                } else {',
'                    $("#publicar_job").hide();',
'                    $("#publicar").hide();',
'                    $("#certificado").hide();',
'                    $("#puntual").hide();',
'                }',
'            }',
'',
'            if (apex.item("P36_NTFCDO").getValue() === ''W'') {',
'                if (v_json && v_json !== "") {',
'                    try {',
'                        apex.server.process("registrarJson", {',
'                            f01: v_json,',
'                            pageItems: "#F_CDGO_CLNTE"',
'                        }, {',
'                            success: function (data) {',
'                                if (data.o_cdgo_rspsta != 0) {',
'                                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                                    apex.message.clearErrors();',
'                                    apex.message.showErrors([',
'                                        {',
'                                            type: "error",',
'                                            location: "page",',
'                                            message: data.o_mnsje_rspsta,',
'                                            unsafe: false',
'                                        }',
'                                    ]);',
'',
'                                } else {',
'                                    console.log("P36_ID_CRTFCDO_JSON_PNTAL devuelto buildJsonCertificado: ", data.o_id_nt_crtfcdo_json);',
'                                    apex.item("P36_ID_CRTFCDO_JSON_PNTAL").setValue(data.o_id_nt_crtfcdo_json);',
'                                    $("#certificado").hide();',
'                                    $("#puntual").show();',
'                                }',
'                            }',
'                        })',
'                    } catch (e) {',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([{',
'                            type: "error",',
'                            location: ["page"],',
'                            message: "Error al seleccionar los actos: " + e,',
'                            unsafe: false',
'                        }]);',
'                    }',
'                }',
'',
'            }else if (apex.item("P36_NTFCDO").getValue() === ''N'' || apex.item("P36_NTFCDO").getValue() === ''S'' || apex.item("P36_NTFCDO").getValue() === ''T''   && count > 50) {',
'                console.log("se van a notificar mas de 50 actos: ", count);',
'                try {',
'                        apex.server.process("registrarJson", {',
'                            f01: v_json,',
'                            pageItems: "#F_CDGO_CLNTE"',
'                        }, {',
'                            success: function (data) {',
'                                if (data.o_cdgo_rspsta != 0) {',
'                                    console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                                    apex.message.clearErrors();',
'                                    apex.message.showErrors([',
'                                        {',
'                                            type: "error",',
'                                            location: "page",',
'                                            message: data.o_mnsje_rspsta,',
'                                            unsafe: false',
'                                        }',
'                                    ]);',
'',
'                                } else {',
'                                    console.log("id del json de actos a notificar: ", data.o_id_nt_crtfcdo_json);',
'                                    apex.item("P36_ID_CRTFCDO_JSON").setValue(data.o_id_nt_crtfcdo_json);                                   ',
'                                }',
'                            }',
'                        })',
'                    } catch (e) {',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([{',
'                            type: "error",',
'                            location: ["page"],',
'                            message: "Error al seleccionar los actos: " + e,',
'                            unsafe: false',
'                        }]);',
'                    }',
'            }',
'',
'            return v_json;',
'',
'        } else {',
'            $s("P36_JSON_ACTOS", null);  // Si no hay registros seleccionados, limpiar P36_JSON_ACTOS',
'            console.log("No hay registros seleccionados.");',
'        }',
'    } else {',
unistr('        console.error("No se encontr\00F3 la regi\00F3n con el nombre ''actos''.");'),
'    }',
'}',
'',
'function buildjsonActos() {',
'    ',
'    var region = apex.region("actos_notificar");',
'    var responsables = [];',
'',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'      ',
'        if (records.length > 0) {',
'            records.forEach(function (record) {',
'                var idActo = model.getValue(record, "ID_ACTO").trim();',
'                responsables.push({ "ID_ACTO": idActo });',
'            });',
'',
'            v_json = JSON.stringify(responsables);',
'',
'            window.localStorage.setItem(''v_json'', v_json);',
'',
'            $s("P36_JSON_ACTOS", v_json);',
'           ',
'            try {',
'                apex.server.process("registrarJson", {',
'                    f01: v_json,',
'                    pageItems: "#F_CDGO_CLNTE, #P36_CDGO_RGSTRO_TPO"',
'                }, {',
'                    success: function (data) {',
'                        if (data.o_cdgo_rspsta != 0) {',
'                            console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                            apex.message.clearErrors();',
'                            apex.message.showErrors([',
'                                {',
'                                    type: "error",',
'                                    location: "page",',
'                                    message: data.o_mnsje_rspsta,',
'                                    unsafe: false',
'                                }',
'                            ]);',
'',
'                        } else {                            ',
'                            apex.item("P36_ID_JSON_ANTFCAR").setValue(data.o_id_nt_crtfcdo_json);',
'                            apex.item("P36_NMRO_ACTOS_PBLCAR").setValue(data.o_nmro_actos);   ',
'                            apex.item("P36_ID_CRTFCDO_JSON").setValue("");',
'                            apex.item("P36_NMRO_ACTOS_JSON").setValue(""); ',
'                            apex.item("publicar").show();                                                    ',
'                        }',
'                    }',
'                })',
'            } catch (e) {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: ["page"],',
'                    message: "Error al seleccionar los actos: " + e,',
'                    unsafe: false',
'                }]);',
'            }         ',
'        }',
'    }',
'}',
'',
'async function notificarActos() {',
'',
'    let $await;',
'',
unistr('    apex.message.confirm(''\00BFEst\00E1 seguro de enviar a notificar los actos seleccionados?'', async function (confirmed) {'),
'        if (confirmed) {',
'            try {',
'                $await = apex.widget.waitPopup();',
'',
'                let resp = await apex.server.process(''PublicarWeb'', {',
'                    pageItems: "#F_CDGO_CLNTE, #P36_FCHA_PBLCCION, #P36_ID_JSON_ANTFCAR, #P36_NTFCA_ACTO"',
'                });',
'',
'                if (resp.o_cdgo_rspsta != 0) {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([{',
'                        type: "error",',
'                        location: ["page"],',
'                        message: resp.o_mnsje_rspsta,',
'                        unsafe: false',
'                    }]);',
'                } else {',
'                    apex.message.showPageSuccess("Actos publicados satisfactoriamnete.");',
'                    v_json = ''''; ',
'                    apex.item("publicar").hide();',
'                    apex.submit();',
'                }',
'',
'            } catch (e) {',
'                console.error("Error al notificar los actos:", e);',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: ["page"],',
'                    message: "Error al intentar notificar los actos.",',
'                    unsafe: false',
'                }]);',
'            } finally {',
'                $await.remove();',
'            }',
'        }',
'    });',
'',
'}',
'',
'function publicarJob() {',
'    ',
'    var fcha_pblccion = apex.item("P36_FCHA_PBLCCION").getValue();',
'',
'    if (fcha_pblccion === null || fcha_pblccion === "") {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "Ingrese la fecha de publicaci\00F3n de los actos",'),
'            unsafe: false',
'        }]);',
'    } else {        ',
'               ',
unistr('        apex.message.confirm("\00BFEst\00E1 seguro de publicar los actos seleccionados?", function (confirmed) {'),
'            ',
'            if (confirmed) {',
'                                ',
'                try {',
'                    apex.server.process("PublicaWebJob", {                       ',
'                        pageItems: "#F_CDGO_CLNTE, #P36_FCHA_PBLCCION, #P36_ID_CRTFCDO_JSON, #P36_ID_JSON_ANTFCAR, #F_ID_USRIO, #P36_NTFCA_ACTO"',
'                    }, {',
'                        success: function (data) {',
'                            if (!data || data.o_cdgo_rspsta != 0) {',
'                                apex.message.clearErrors();',
'                                apex.message.showErrors([{',
'                                    type: "error",',
'                                    location: "page",',
'                                    message: "Error procesando el job.",',
'                                    unsafe: false',
'                                }]);',
'                            } else {                                ',
unistr('                                    apex.message.showPageSuccess("Se est\00E1 ejecutando el proceso. Al finalizar ser\00E1 notificado.");                              '),
'                                    setTimeout(function() {refrescar()}, 2000);                                                                 ',
'                            }',
'                        }',
'                    });',
'                } catch (e) {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([{',
'                        type: "error",',
'                        location: "page",',
'                        message: "Error al intentar notificar los actos",',
'                        unsafe: false',
'                    }]);',
'                }',
'            }',
'        });',
'    }',
'}',
'',
'function refrescar(){',
'    apex.submit();',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (apex.region("actos")) {',
'    apex.region("actos").widget().interactiveGrid("setSelectedRecords", []);',
'    $("#publicar_job").hide();',
'    $("#publicar").hide();',
'     $("#puntual").hide();',
'}',
'',
'apex.item("P36_FECHA_PUBLICADO").hide();',
'',
'$("#publicar").hide();',
'$("#certificado").hide();',
'$("#publicar_job").hide();',
'',
'',
'',
''))
,p_step_template=>wwv_flow_api.id(30309424961578275)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250215104247'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3574110070323711)
,p_plug_name=>'Publicar'
,p_region_name=>'modalPublicar'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(30336754148578287)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29791495211221101)
,p_plug_name=>unistr('Par\00E1metros de b\00FAsqueda')
,p_region_name=>'busqueda'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29791859141221105)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_api.id(29792025258221107)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30339999956578288)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center></b></h5>',
'<i>Funcionalidad que permite:<br>',
'1. Seleccionar el lote que se va a notificar.<br>',
'2. Seleccionar los Actos que se van a notifar del lote seleccionado.<br>',
'3. Seleccionar la fecha en que se van a publicar esos actos.<br>',
unistr('4. Iniciar el proceso de notificaci\00F3n al dar clic sobre el bot\00F3n "Publicar en la Web".'),
'<br/>',
unistr('5. Para generar el certificado se debe escoger la opci\00F3n notificado Web en la lista desplegable.<br>'),
'6. Seleccionar la fecha en que los actos fueron publicados en el portal.<br>',
unistr('7. Iniciar la generaci\00F3n del certificado al dar clic sobre el bot\00F3n "Generar Certificado".<br>'),
'<br/>',
'    <p>',
unistr('        Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario'),
'    </p>',
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29792159243221108)
,p_plug_name=>'Actos Pendientes Por Publicar Lote'
,p_region_name=>'actos'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from (',
'select distinct b.id_acto as id_acto,',
'                b.nmro_acto as Nro_Acto,',
'                to_char(c.FCHA, ''DD/MM/YYYY'') as Fecha,',
'                c.FCHA_NTFCCION,',
'                b.cdgo_acto_orgen as Origen_de_Acto,',
'                b.dscrpcion_acto_orgen as Tipo_de_Acto,',
'                b.id_acto_tpo as id_acto_tipo,',
'                b.dscrpcion_acto_tpo AS dscrpcion_acto_tpo,',
'                b.fcha as fecha_notificado,',
'                c.fcha_pblccion,',
'                decode(b.indcdor_ntfcdo, ''S'', ''SI'', ''N'', ''NO'') as Notificado',
'  from nt_d_lote_detalle a',
'  join gn_g_actos c',
'    on a.id_acto = c.id_acto',
'  join v_nt_g_notfccnes_gn_g_actos b',
'    on a.id_acto = b.id_acto',
' Where a.id_lte = :P36_NMRO_LOTE   ',
'   and c.ntfcdo_pag_web = ''N''',
'   and ( (:P36_NTFCDO = ''S'' and b.indcdor_ntfcdo = ''S'')',
'     or (:P36_NTFCDO = ''N'' and b.indcdor_ntfcdo = ''N'')',
'     or ((:P36_NTFCDO = ''T'' or :P36_NTFCDO is null) ',
'          and b.indcdor_ntfcdo in (''S'', ''N'')))   ',
'   and b.nmro_acto = nvl(:P36_NMRO_ACTO, b.nmro_acto) ',
' order by b.id_acto);',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P36_NMRO_LOTE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P36_NMRO_LOTE'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(2876667138060509)
,p_name=>'FCHA_PBLCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_PBLCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha De Publicaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29792435222221111)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>30
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29792508966221112)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29900868507163202)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(29901060351163204)
,p_name=>'NOTIFICADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOTIFICADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFNotificado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>2
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30469529972270902)
,p_name=>'NRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nro.Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30469639293270903)
,p_name=>'ORIGEN_DE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORIGEN_DE_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30469737000270904)
,p_name=>'TIPO_DE_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIPO_DE_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo De Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30469863348270905)
,p_name=>'ID_ACTO_TIPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TIPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30469990782270906)
,p_name=>'FECHA_NOTIFICADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA_NOTIFICADO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(30471168418270918)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Dscrpcion Acto Tpo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(41108647555958701)
,p_name=>'FECHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FECHA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(41108838347958703)
,p_name=>'FCHA_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_NTFCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Notificacion'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(29792208534221109)
,p_internal_uid=>29792208534221109
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>'<h4>No hay actos pertenecientes a este lote <span aria-hidden="true" class="fa fa-send-o fa-2x"></span></h4>'
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(29815370733500423)
,p_interactive_grid_id=>wwv_flow_api.id(29792208534221109)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>1000
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(29815419348500438)
,p_report_id=>wwv_flow_api.id(29815370733500423)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(51980485621287)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(30469529972270902)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(52695157621306)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(30469639293270903)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(53309492621323)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(30469737000270904)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54009808621325)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(30469863348270905)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(54715189621327)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(30469990782270906)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(2930161886233227)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(2876667138060509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29819039568536117)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(29792435222221111)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29935065453101258)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(29900868507163202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(29940476653211106)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(29901060351163204)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(30618905572371922)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(30471168418270918)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(41114649835958880)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(41108647555958701)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(41118861931971135)
,p_view_id=>wwv_flow_api.id(29815419348500438)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(41108838347958703)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43885839266759119)
,p_plug_name=>'Actos Pendientes Por Publicar'
,p_region_name=>'actos_notificar'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(30328831919578284)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_acto,',
'       a.nmro_acto,',
'       a.nmro_acto_dsplay,',
'       a.cdgo_acto_orgen,',
'       a.dscrpcion_acto_orgen,',
'       a.id_orgen,',
'       a.id_undad_prdctra,',
'       a.id_acto_tpo,',
'       initcap(a.dscrpcion_acto_tpo) dscrpcion_acto_tpo,',
'       a.anio,',
'       a.fcha,',
'       case a.indcdor_ntfcdo',
'         when ''N'' then ''#ffbe00''',
'         else ''#1fe06a''',
'       end clor_cdgo_estdo,',
'       case a.indcdor_ntfcdo',
'         when ''N'' then ''fa-exclamation-circle-o''',
'         else ''fa-paper-plane-o''',
'       end icno_cdgo_estdo,',
'       case a.indcdor_ntfcdo',
unistr('         when ''N'' then ''Sin Notificaci\00F3n'''),
'         else ''Pendiente''',
'       end dscrpcion_cdgo_estdo',
'  from v_nt_g_notfccnes_gn_g_actos a  ',
'  join gn_g_actos k on k.id_acto = a.id_acto',
' where a.cdgo_clnte = :F_CDGO_CLNTE  ',
'   and trunc(a.fcha_incio_ntfccion) <= trunc(sysdate)',
'   and (a.cdgo_estdo = ''NPR'' or cdgo_estdo is null)',
'   and (nvl(a.indcdor_ntfcdo, ''N'') = ''N'')',
'   and k.ntfcdo_pag_web= ''N''',
'   and a.cdgo_acto_orgen = nvl(:P36_CDGO_ACTO_ORGEN, a.cdgo_acto_orgen)',
'   and a.id_acto_tpo = nvl(:P36_ID_ACTO_TPO, a.id_acto_tpo) and',
'   ((trunc(a.fcha)        between :P36_FCHA_INCIAL      and :P36_FCHA_FNAL)',
'       or (trunc(a.fcha) >= :P36_FCHA_INCIAL and :P36_FCHA_FNAL is null) ',
'       or (trunc(a.fcha) <= :P36_FCHA_FNAL and :P36_FCHA_INCIAL  is null)',
'       or(:P36_FCHA_INCIAL is null and :P36_FCHA_FNAL is null )) ',
'   and not exists',
' (select 1 from nt_d_lote_detalle n where n.id_acto = a.id_acto)',
'   and a.nmro_acto = NVL(:P36_NMRO_ACTO, a.nmro_acto);'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P36_FCHA_INCIAL is not null or',
':P36_FCHA_FNAL  is not null or  ',
':P36_CDGO_ACTO_ORGEN  is not null or  ',
':P36_ID_ACTO_TPO  is not null)',
'and :P36_NMRO_LOTE is null'))
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43119345430176450)
,p_name=>'NTFCCION_ESTDO'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43119445804176451)
,p_name=>'CLOR_CDGO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLOR_CDGO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43119523060176452)
,p_name=>'ICNO_CDGO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICNO_CDGO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43119640937176453)
,p_name=>'DSCRPCION_CDGO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CDGO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Notificado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>16
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43886048096759121)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43886116870759122)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero del Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43886186074759123)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43886283881759124)
,p_name=>'CDGO_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43886366168759125)
,p_name=>'DSCRPCION_ACTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_ORGEN'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Origen del Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43886551552759127)
,p_name=>'ID_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43886684623759128)
,p_name=>'ID_UNDAD_PRDCTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_UNDAD_PRDCTRA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43886947965759130)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo de Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43887079407759132)
,p_name=>'ANIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ANIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43887182628759133)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de <br>Generaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>true
,p_max_length=>10
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(43887819554759139)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(86747267336406623)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(43885919982759120)
,p_internal_uid=>43885919982759120
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>'<h4>No hay actos disponibles para notificar <span aria-hidden="true" class="fa fa-send-o fa-2x"></span></h4>'
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(43897760456831870)
,p_interactive_grid_id=>wwv_flow_api.id(43885919982759120)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>1000
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(43897899083831870)
,p_report_id=>wwv_flow_api.id(43897760456831870)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43898423153831873)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(43886048096759121)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43898865026831875)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(43886116870759122)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43899395409831876)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(43886186074759123)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43899820585831877)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(43886283881759124)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43900340368831879)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(43886366168759125)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43901272044831881)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(43886551552759127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43901838372831882)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(43886684623759128)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43902752540831884)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(43886947965759130)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43903820984831887)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(43887079407759132)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(43904332733831888)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(43887182628759133)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44598351359225552)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(43119345430176450)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44607668118313791)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(43119445804176451)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44608168966313792)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(43119523060176452)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(44608710958313793)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(43119640937176453)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(86809376240804158)
,p_view_id=>wwv_flow_api.id(43897899083831870)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(86747267336406623)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(33466246169967320)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(29792159243221108)
,p_button_name=>'BTN_SLCCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Seleccionar Todos'
,p_button_position=>'ABOVE_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-square-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3574505202323715)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(43885839266759119)
,p_button_name=>'BTN_SLCCIONAR_TODO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Seleccionar Todos'
,p_button_position=>'ABOVE_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-square-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29791985968221106)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(29791859141221105)
,p_button_name=>'BNT_PUBLICAR'
,p_button_static_id=>'publicar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Publicar Actos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-send'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2877176842060514)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(3574110070323711)
,p_button_name=>'BTN_PBCAR_JOB'
,p_button_static_id=>'publicar_job'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Publicar T'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-cloud-upload'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30350540209747706)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(29791859141221105)
,p_button_name=>'BTN_GNRAR_CRTFCDO'
,p_button_static_id=>'certificado'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Certificado'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3500109524824701)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(29791859141221105)
,p_button_name=>'BTN_GNRAR_CRTFCDO_PNTAL'
,p_button_static_id=>'puntual'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Certificado'
,p_button_position=>'BELOW_BOX'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5621656832923037)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(3574110070323711)
,p_button_name=>'BTN_PUBLICAR'
,p_button_static_id=>'BTN_PUBLICAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Publicar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-cloud-upload'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(29791770599221104)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_api.id(29791495211221101)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(30392190548578313)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2877061663060513)
,p_name=>'P36_ID_CRTFCDO_JSON'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3500631865824706)
,p_name=>'P36_ID_CRTFCDO_JSON_PNTAL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(29791859141221105)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3574019416323710)
,p_name=>'P36_NMRO_ACTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_prompt=>unistr('<b>N\00FAmero De Acto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5402364523138974)
,p_name=>'P36_FCHA_INCIAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_prompt=>'<b>Fecha Del Acto Desde</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5402644343143793)
,p_name=>'P36_FCHA_FNAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_prompt=>'<b>Fecha Del Acto Hasta</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>' onkeydown="return false"  onfocus="this.value=''''"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'+0d'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5402915476147390)
,p_name=>'P36_CDGO_ACTO_ORGEN'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_prompt=>'<b>Origen del Acto</b>'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_acto_orgen||'' - ''||dscrpcion d, cdgo_acto_orgen r',
'from gn_d_actos_origen',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5404480190164501)
,p_name=>'P36_ID_ACTO_TPO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_prompt=>'<b>Tipo de Acto</b>'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_ACTO_TIPOS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_acto_tpo||'' - ''||dscrpcion d , id_acto_tpo r ',
'from gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      indcdor_ntfccion = ''S''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5621534655923036)
,p_name=>'P36_ID_JSON_ANTFCAR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5621915753923040)
,p_name=>'P36_NTFCA_ACTO'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(3574110070323711)
,p_item_default=>'N'
,p_prompt=>'<b>Indicador Notica Acto</b>'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391756467578313)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'SI'
,p_attribute_04=>'N'
,p_attribute_05=>'NO'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5622028659923041)
,p_name=>'P36_NMRO_ACTOS_PBLCAR'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5622164096923042)
,p_name=>'P36_CDGO_RGSTRO_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_item_default=>'P'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5622618916923047)
,p_name=>'P36_NMRO_ACTOS_JSON'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29791531819221102)
,p_name=>'P36_ID_ACTO_TPO1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29791687440221103)
,p_name=>'P36_NMRO_LOTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_prompt=>unistr('<b>N\00FAmero de Lote</b>')
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_lte || '' - '' || a.dscrpcion || '' - '' || d.DSCRPCION ,',
'       a.id_lte ',
'  from nt_g_lote a',
'  join nt_d_entidad_cliente_medio b',
'    on b.id_entdad_clnte_mdio = a.id_entdad_clnte_mdio',
'  join nt_d_entidad_cliente c',
'    on c.id_entdad_clnte = b.id_entdad_clnte',
'  join nt_d_entidad d',
'    on d.cdgo_entdad = c.cdgo_entdad',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
' and a.id_acto_tpo = :P36_ID_ACTO_TPO',
'   and a.cdgo_estdo_lte = ''PRO''',
' order by  a.id_lte;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P36_ID_ACTO_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29792733042221114)
,p_name=>'P36_JSON_ACTOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(29791859141221105)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30469476516270901)
,p_name=>'P36_NTFCDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_prompt=>'<b>Actos Para Mostar</b>'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Notificados;S,No Notificados;N,Todos;T'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30470050391270907)
,p_name=>'P36_CERTIFICADO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(29791859141221105)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30473462669270941)
,p_name=>'P36_FECHA_PUBLICADO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(29791495211221101)
,p_prompt=>unistr('<b>Fecha de Publicaci\00F3n del Acto</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Debe seleccionar la fecha en la que se publicaron los actos por el portal web'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30660438702248801)
,p_name=>'P36_FCHA_PBLCCION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(3574110070323711)
,p_prompt=>unistr('<b>Fecha De Publicaci\00F3n</b>')
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30391428256578312)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Debe seleccionar la fecha en la que se realizar\00E1 la publicaci\00F3n de los actos')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30022317282850430)
,p_name=>unistr('Al cambiar la selecci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(29792159243221108)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30022465856850431)
,p_event_id=>wwv_flow_api.id(30022317282850430)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function obtenerJsonActos() {',
'    ',
'    var region = apex.region(''actos'');',
'    var responsables = [];',
'',
'    if (region) {',
'',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        var records = view.view$.grid("getSelectedRecords");',
'      ',
'        if (records.length > 0) {',
'            records.forEach(function (record) {',
'                var idActo = model.getValue(record, "ID_ACTO").trim();',
'                responsables.push({ "ID_ACTO": idActo });',
'            });',
'',
'            v_json = JSON.stringify(responsables);',
'',
'            window.localStorage.setItem(''v_json'', v_json);',
'',
'            $s("P36_JSON_ACTOS", v_json);',
'           ',
'            try {',
'                apex.server.process("registrarJson", {',
'                    f01: v_json,',
'                    pageItems: "#F_CDGO_CLNTE, #P36_CDGO_RGSTRO_TPO"',
'                }, {',
'                    success: function (data) {',
'                        if (data.o_cdgo_rspsta != 0) {',
'                            console.log(''RESPUESTA: '' + data.o_cdgo_rspsta);',
'                            apex.message.clearErrors();',
'                            apex.message.showErrors([',
'                                {',
'                                    type: "error",',
'                                    location: "page",',
'                                    message: data.o_mnsje_rspsta,',
'                                    unsafe: false',
'                                }',
'                            ]);',
'',
'                        } else {',
'                            console.log(''o_id_nt_crtfcdo_json: ''+ data.o_id_nt_crtfcdo_json);',
'                            console.log(''o_nmro_actos: ''+ data.o_nmro_actos);',
'                            ',
'                            apex.item("P36_ID_JSON_ANTFCAR").setValue(data.o_id_nt_crtfcdo_json);',
'                            apex.item("P36_NMRO_ACTOS_PBLCAR").setValue(data.o_nmro_actos);',
'                            apex.item("P36_ID_CRTFCDO_JSON").setValue("");',
'                            apex.item("P36_NMRO_ACTOS_JSON").setValue("");                                                      ',
'                            ',
'                            console.log(''P36_ID_JSON_ANTFCAR: ''+ apex.item("P36_ID_JSON_ANTFCAR").getValue());',
'                            console.log(''P36_NMRO_ACTOS_PBLCAR: ''+ apex.item("P36_NMRO_ACTOS_PBLCAR").getValue());',
'                            apex.item("publicar").show();                                   ',
'                        }',
'                    }',
'                })',
'            } catch (e) {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([{',
'                    type: "error",',
'                    location: ["page"],',
'                    message: "Error al seleccionar los actos: " + e,',
'                    unsafe: false',
'                }]);',
'            }         ',
'        }',
'    }',
'}',
'',
'obtenerJsonActos();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30022598688850432)
,p_name=>'Al dar clic en publicar en la web'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29791985968221106)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30022671516850433)
,p_event_id=>wwv_flow_api.id(30022598688850432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function open(){',
'    ',
'  //  apex.item("BTN_PUBLICAR").hide();',
'   // apex.item("publicar_job").hide();',
'    apex.item("P36_FCHA_PBLCCION").setValue("");',
'    ',
'    openModal(''modalPublicar'');',
'}',
'',
'open();',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30690075476575906)
,p_name=>'AL CAMBIAR FECHA'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36_FCHA_PBLCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30690170836575907)
,p_event_id=>wwv_flow_api.id(30690075476575906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  APEX_UTIL.SET_SESSION_STATE(''P36_FCHA_PBLCCION'', :P36_FCHA_PBLCCION);',
'END;'))
,p_attribute_02=>'P36_FCHA_PBLCCION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33465165066967309)
,p_name=>'al cambiar P36_ID_ACTO_TPO'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36_ID_ACTO_TPO1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33465247222967310)
,p_event_id=>wwv_flow_api.id(33465165066967309)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var id_acto_tpo = apex.item("P36_ID_ACTO_TPO").getValue();',
'',
'console.log(''ID_ACTO_TPO: '' + id_acto_tpo);'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2877395220060516)
,p_name=>'al dar clic BTN_PBCAR_JOB'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2877176842060514)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2877425188060517)
,p_event_id=>wwv_flow_api.id(2877395220060516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function publicarActosJob(){',
'    ',
'     var fcha_pblccion = apex.item("P36_FCHA_PBLCCION").getValue();',
'',
'    if (fcha_pblccion === null || fcha_pblccion === "") {',
'        apex.message.clearErrors();',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "Ingrese la fecha de publicaci\00F3n de los actos",'),
'            unsafe: false',
'        }]);',
'    }else{',
'        publicarJob();',
'    }',
'    ',
'}',
'',
'publicarActosJob();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33466392925967321)
,p_name=>'Al dar clic en BTN_SLCCION'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(33466246169967320)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33466411816967322)
,p_event_id=>wwv_flow_api.id(33466392925967321)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccionarTodos() {',
'',
'    var ig$ = apex.region("actos").widget();',
'',
'    var gridView = ig$.interactiveGrid("getViews", "grid");',
'',
'    gridView.view$.grid("selectAll");',
'    ',
'    apex.server.process(''SeleccionActos'', {',
'        pageItems: "#P36_NMRO_LOTE, #F_CDGO_CLNTE, #P36_NTFCDO, #P36_NMRO_ACTO"',
'    },',
'        {',
'            success: function (data) {',
'                if (data.o_cdgo_rspsta != 0) {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([{',
'                        type: "error",',
'                        location: "page",',
'                        message: "Error al seleccionar los actos. " + data.o_mnsje_rspsta,',
'                        unsafe: false',
'                    }]);',
'                } else {',
'                    apex.message.showPageSuccess("Se seleccionaron " + data.o_nmro_actos + " actos");',
'                    ',
'                    apex.item("P36_ID_CRTFCDO_JSON").setValue(data.o_id_nt_crtfcdo_json);',
'                    apex.item("P36_NMRO_ACTOS_JSON").setValue(data.o_nmro_actos);',
'                    apex.item("P36_ID_JSON_ANTFCAR").setValue("");',
'                    apex.item("P36_NMRO_ACTOS_PBLCAR").setValue("");',
'                    ',
'                    console.log(''Id json P36_ID_CRTFCDO_JSON : '' + apex.item("P36_ID_CRTFCDO_JSON").getValue());                    ',
'                    console.log(''P36_NMRO_ACTOS_JSON : '' + apex.item("P36_NMRO_ACTOS_JSON").getValue()); ',
'                    console.log(''P36_ID_JSON_ANTFCAR : '' + apex.item("P36_ID_JSON_ANTFCAR").getValue()); ',
'                    ',
'                   apex.item("publicar").show();',
'',
'                }',
'            }',
'        });',
'}',
'',
'seleccionarTodos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3581627876964004)
,p_name=>'Al cambia P36_FECHA_PUBLICADO'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36_FECHA_PUBLICADO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3581780853964005)
,p_event_id=>wwv_flow_api.id(3581627876964004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.submit();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3574618685323716)
,p_name=>'Al dar clic en BTN_SLCCIONAR_TODO'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3574505202323715)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3574703463323717)
,p_event_id=>wwv_flow_api.id(3574618685323716)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccionarTodos() {',
'',
'    var ig$ = apex.region("actos_notificar").widget();',
'',
'    var gridView = ig$.interactiveGrid("getViews", "grid");',
'',
'    gridView.view$.grid("selectAll");',
'    ',
'    apex.server.process(''genera_json_actos'', {',
'        pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO, #P36_NMRO_ACTO, #P36_FCHA_INCIAL, #P36_FCHA_FNAL, #P36_ID_ACTO_TPO, #P36_CDGO_ACTO_ORGEN, #P36_NTFCDO, #P36_NMRO_LOTE, #P36_CDGO_RGSTRO_TPO"',
'    },',
'        {',
'            success: function (data) {',
'                if (data.o_cdgo_rspsta != 0) {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([{',
'                        type: "error",',
'                        location: "page",',
'                        message: "Error al seleccionar los actos. " + data.o_mnsje_rspsta,',
'                        unsafe: false',
'                    }]);',
'                } else {',
'                    apex.message.showPageSuccess("" + data.o_mnsje_rspsta);',
'                    apex.item("P36_ID_CRTFCDO_JSON").setValue(data.o_id_json);',
'                    apex.item("P36_NMRO_ACTOS_JSON").setValue(data.o_nmro_actos);',
'                    apex.item("P36_ID_JSON_ANTFCAR").setValue("");',
'                    apex.item("P36_NMRO_ACTOS_PBLCAR").setValue("");',
'                   ',
'                    console.log(''Id json P36_ID_CRTFCDO_JSON : '' + apex.item("P36_ID_CRTFCDO_JSON").getValue());                    ',
'                    console.log(''P36_NMRO_ACTOS_JSON : '' + apex.item("P36_NMRO_ACTOS_JSON").getValue()); ',
'                    console.log(''P36_ID_JSON_ANTFCAR : '' + apex.item("P36_ID_JSON_ANTFCAR").getValue()); ',
'                    ',
'                   apex.item("publicar").show();',
'                    ',
'                    }',
'',
'                }',
'            });',
'}',
'',
'seleccionarTodos();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5621327031923034)
,p_name=>'Al seleccionar una fila en Actos a Notificar'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(43885839266759119)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5621451724923035)
,p_event_id=>wwv_flow_api.id(5621327031923034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'buildjsonActos();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5621762037923038)
,p_name=>'Al dar clien en BTN_PUBLICAR'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5621656832923037)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5621816085923039)
,p_event_id=>wwv_flow_api.id(5621762037923038)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function notificar() {',
'    ',
'    var fcha_pblccion = apex.item("P36_FCHA_PBLCCION").getValue();',
'        ',
'    if (!fcha_pblccion) {',
'        apex.message.clearErrors(); ',
'        apex.message.showErrors([{',
'            type: "error",',
'            location: "page",',
unistr('            message: "Ingrese la fecha de publicaci\00F3n de los actos", '),
'            unsafe: false',
'        }]);',
'    } else {',
'        ',
'        var nmro_actos = Number(apex.item("P36_NMRO_ACTOS_PBLCAR").getValue().trim());',
'        var nmro_actos_lte = Number(apex.item("P36_NMRO_ACTOS_JSON").getValue().trim());',
'        ',
unistr('        console.log(''N\00FAmero de actos: '' + nmro_actos);'),
unistr('        console.log(''N\00FAmero de actos lte: '' + nmro_actos_lte);        '),
'        ',
'        if (nmro_actos == 0 && nmro_actos_lte > 0) {',
'            if (nmro_actos_lte > 1000) {',
unistr('                console.log(''Publicar\00E1 por job'');'),
'                publicarJob(); ',
'            } else {',
unistr('                console.log(''Publicar\00E1 por p\00E1gina'');'),
'                notificarActos(); ',
'            }',
'        } else if (nmro_actos_lte == 0 && nmro_actos > 0) {',
'            if (nmro_actos > 1000) {',
unistr('                console.log(''Publicar\00E1 por job'');'),
'                publicarJob(); ',
'            } else {',
unistr('                console.log(''Publicar\00E1 por p\00E1gina'');'),
'                notificarActos(); ',
'            }',
'        }',
'    }',
'}',
'',
'notificar();',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30123464234115146)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarCertificado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'  v_object      json_object_t := json_object_t();',
'  v_nmbre_trcro varchar2(500);',
'  v_json        clob;',
'  v_actos_json  clob := empty_clob();',
'  v_json_temp   clob;',
'  id_reporte    number;',
'  v_error       exception;',
'  v_cdgo_rspsta number := 0;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_cdgo_error  varchar2(4000);',
'  v_fcha_pbccion varchar2(100);',
'begin',
'',
'    if(:P36_FECHA_PUBLICADO is null)then',
'      v_cdgo_rspsta:= 10;',
unistr('      v_mnsje_rspsta := ''La fecha de publicaci\00F3n de los actos no puede esta vac\00EDa'';'),
'      raise v_error;',
'    end if;',
'',
unistr('  -- Obtener informaci\00F3n del reporte'),
'  begin',
'    select nmbre_rprte || ''_'' || to_char(SYSDATE, ''YYYYMMDD''), id_rprte',
'      into v_nmbre_rprte, id_reporte',
'      from gn_d_reportes',
'     where cdgo_rprte_grpo = ''CPA''',
'     and actvo = ''S'';',
'  exception',
'    when others then',
unistr('      v_mnsje_rspsta := ''No se encontr\00F3 la informaci\00F3n del reporte: '' || sqlerrm;'),
'      raise v_error;',
'  end;',
'',
'  -- Obtener nombre del usuario',
'  begin',
'    select a.nmbre_trcro',
'      into v_nmbre_trcro',
'      from v_sg_g_usuarios a',
'     where a.id_usrio = :F_ID_USRIO;',
'  exception',
'    when no_data_found then',
'      v_nmbre_trcro  := null;',
'      v_mnsje_rspsta := ''Error al consultar los datos del usuario: '' || sqlerrm;',
'      raise v_error;',
'  end;',
'',
'  -- Obtener el JSON de actos',
'  begin ',
'    select a.json_crtfcdos ',
'    into v_actos_json',
'    from nt_g_certificados_json a ',
'    where a.id_nt_crtfcdo_json = :P36_ID_CRTFCDO_JSON;',
'  exception',
'    when others then',
'      v_cdgo_rspsta := 1;',
'      v_mnsje_rspsta := ''Error al consultar los actos: '' || sqlerrm;',
'      raise v_error;',
'  end;  ',
'  ',
'   select pkg_gn_generalidades.fnc_cl_fecha_texto(:P36_FECHA_PUBLICADO)',
'  into v_fcha_pbccion ',
'  from dual;',
'    ',
'  -- Construir el JSON',
'  begin',
'    DBMS_LOB.CREATETEMPORARY(v_json_temp, TRUE);',
'',
'    -- Concatenar partes del JSON en el CLOB    ',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''{"nmbre_rprte":"'') + LENGTH(v_nmbre_rprte) + LENGTH(''",''), ''{"nmbre_rprte":"'' || v_nmbre_rprte || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"id_usrio":"'') + LENGTH(:F_ID_USRIO) + LENGTH(''",''), ''"id_usrio":"'' || :F_ID_USRIO || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"nmbre_trcro":"'') + LENGTH(v_nmbre_trcro) + LENGTH(''",''), ''"nmbre_trcro":"'' || v_nmbre_trcro || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"fcha_publccion":"'') + LENGTH(v_fcha_pbccion) + LENGTH(''",''), ''"fcha_publccion":"'' || v_fcha_pbccion || ''",'');',
'   -- DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"ACTOS":'') + LENGTH(v_actos_json) +LENGTH(''",''), ''"ACTOS":'' || v_actos_json ||''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"id_crtfcdo_json":'') + LENGTH(:P36_ID_CRTFCDO_JSON) + LENGTH(''}''), ''"id_crtfcdo_json":'' || :P36_ID_CRTFCDO_JSON || ''}'');',
'    -- Asignar el CLOB concatenado al v_json',
'    v_json := v_json_temp;',
'',
'    -- Liberar el CLOB temporal',
'    DBMS_LOB.FREETEMPORARY(v_json_temp);',
'',
'      ',
'     apex_session.attach(p_app_id     => 66000,',
'                          p_page_id    => 37,',
'                          p_session_id => :APP_SESSION);',
'    ',
'      apex_util.set_session_state(''P37_NMBRE_RPRTE'', v_nmbre_rprte);',
'      apex_util.set_session_state(''P37_JSON'', v_json);',
'      apex_util.set_session_state(''P37_ID_RPRTE'', id_reporte);',
'  ',
'  exception',
'    when others then',
'      v_cdgo_error := sqlerrm;     ',
'      v_cdgo_rspsta := 1;',
'      raise v_error;',
'  end;',
'',
'exception',
'  when v_error then',
'    rollback;',
'    return;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3500581148824705)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GenerarCertificadoPuntual'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_nmbre_rprte gn_d_reportes.nmbre_rprte%type;',
'  v_object      json_object_t := json_object_t();',
'  v_nmbre_trcro varchar2(500);',
'  v_json        clob;',
'  v_actos_json  clob := empty_clob();',
'  v_json_temp   clob;',
'  id_reporte    number;',
'  v_error       exception;',
'  v_cdgo_rspsta number := 0;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_cdgo_error  varchar2(4000);',
'  v_fcha_pbccion varchar2(100);',
'begin',
'',
'    if(:P36_FECHA_PUBLICADO is null)then',
'      v_cdgo_rspsta:= 10;',
unistr('      v_mnsje_rspsta := ''La fecha de publicaci\00F3n de los actos no puede esta vac\00EDa'';'),
'      raise v_error;',
'    end if;',
'',
unistr('  -- Obtener informaci\00F3n del reporte'),
'  begin',
'    select nmbre_rprte || ''_'' || to_char(SYSDATE, ''YYYYMMDD''), id_rprte',
'      into v_nmbre_rprte, id_reporte',
'      from gn_d_reportes',
'     where cdgo_rprte_grpo = ''CPA''',
'     and actvo = ''S'';',
'  exception',
'    when others then',
unistr('      v_mnsje_rspsta := ''No se encontr\00F3 la informaci\00F3n del reporte: '' || sqlerrm;'),
'      raise v_error;',
'  end;',
'',
'  -- Obtener nombre del usuario',
'  begin',
'    select a.nmbre_trcro',
'      into v_nmbre_trcro',
'      from v_sg_g_usuarios a',
'     where a.id_usrio = :F_ID_USRIO;',
'  exception',
'    when no_data_found then',
'      v_nmbre_trcro  := null;',
'      v_mnsje_rspsta := ''Error al consultar los datos del usuario: '' || sqlerrm;',
'      raise v_error;',
'  end;',
'',
'  -- Obtener el JSON de actos',
'  begin ',
'    select a.json_crtfcdos ',
'    into v_actos_json',
'    from nt_g_certificados_json a ',
'    where a.id_nt_crtfcdo_json = :P36_ID_CRTFCDO_JSON_PNTAL;',
'  exception',
'    when others then',
'      v_cdgo_rspsta := 1;',
'      v_mnsje_rspsta := ''Error al consultar los actos: '' || sqlerrm;',
'      raise v_error;',
'  end;  ',
'  ',
'   select pkg_gn_generalidades.fnc_cl_fecha_texto(:P36_FECHA_PUBLICADO)',
'  into v_fcha_pbccion ',
'  from dual;',
'    ',
'  -- Construir el JSON',
'  begin',
'    DBMS_LOB.CREATETEMPORARY(v_json_temp, TRUE);',
'',
'    -- Concatenar partes del JSON en el CLOB    ',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''{"nmbre_rprte":"'') + LENGTH(v_nmbre_rprte) + LENGTH(''",''), ''{"nmbre_rprte":"'' || v_nmbre_rprte || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"id_usrio":"'') + LENGTH(:F_ID_USRIO) + LENGTH(''",''), ''"id_usrio":"'' || :F_ID_USRIO || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"nmbre_trcro":"'') + LENGTH(v_nmbre_trcro) + LENGTH(''",''), ''"nmbre_trcro":"'' || v_nmbre_trcro || ''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"fcha_publccion":"'') + LENGTH(v_fcha_pbccion) + LENGTH(''",''), ''"fcha_publccion":"'' || v_fcha_pbccion || ''",'');',
'   -- DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"ACTOS":'') + LENGTH(v_actos_json) +LENGTH(''",''), ''"ACTOS":'' || v_actos_json ||''",'');',
'    DBMS_LOB.WRITEAPPEND(v_json_temp, LENGTH(''"id_crtfcdo_json":'') + LENGTH(:P36_ID_CRTFCDO_JSON_PNTAL) + LENGTH(''}''), ''"id_crtfcdo_json":'' || :P36_ID_CRTFCDO_JSON_PNTAL || ''}'');',
'    -- Asignar el CLOB concatenado al v_json',
'    v_json := v_json_temp;',
'',
'    -- Liberar el CLOB temporal',
'    DBMS_LOB.FREETEMPORARY(v_json_temp);',
'',
'      ',
'     apex_session.attach(p_app_id     => 66000,',
'                          p_page_id    => 37,',
'                          p_session_id => :APP_SESSION);',
'    ',
'      apex_util.set_session_state(''P37_NMBRE_RPRTE'', v_nmbre_rprte);',
'      apex_util.set_session_state(''P37_JSON'', v_json);',
'      apex_util.set_session_state(''P37_ID_RPRTE'', id_reporte);',
'  ',
'  exception',
'    when others then',
'      v_cdgo_error := sqlerrm;     ',
'      v_cdgo_rspsta := 1;',
'      raise v_error;',
'  end;',
'',
'exception',
'  when v_error then',
'    rollback;',
'    return;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30120523229115117)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PublicarWeb'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_mnsje_rspsta varchar(4000);',
'  v_cdgo_rspsta  number;',
'  v_json         clob;',
'  l_url          varchar(4000);',
'  error          exception;',
'begin ',
'',
'   pkg_nt_notificacion.prc_rg_pag_web (p_cdgo_clnte      => :F_CDGO_CLNTE,',
'                                       p_pblccion        => :P36_FCHA_PBLCCION,',
'                                       p_id_crtfcdo_json => :P36_ID_JSON_ANTFCAR,',
'                                       p_indcdor_ntfca   => :P36_NTFCA_ACTO,',
'                                       p_json_actos      => null,',
'                                       o_cdgo_rspsta     => v_cdgo_rspsta,',
'                                       o_mnsje_rspsta    => v_mnsje_rspsta);  ',
'  ',
'  ',
'  if (v_cdgo_rspsta <> 0) then     ',
'     raise error;    ',
'  else',
'    commit;    ',
'  end if;',
'  ',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'  apex_json.write(''tipo'', 0);',
'  apex_json.close_object;',
' ',
'exception',
'  when error then',
'    rollback; ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'  when others then',
'    rollback; ',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);       ',
'    apex_json.close_object;',
'end;',
''))
,p_process_error_message=>'Revise los campos antes de continuar'
,p_process_when=>'P36_FCHA_PBLCCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30690214996575908)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CambiarFecha'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
unistr('  -- No necesitamos hacer nada aqu\00ED, solo queremos actualizar la sesi\00F3n'),
'  NULL;',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2876947468060512)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrarJson'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_id_nt_crtfcdo_json number;',
'  v_id_crtfcdo_json    number;',
'  v_cdgo_rspsta        number;',
'  v_mnsje_rspsta       varchar2(4000);',
'  v_error              exception;',
'  v_json_actos         clob;',
'  v_nmro_actos         number;',
'begin',
'',
'  for i in 1 .. apex_application.g_f01.count loop',
'    v_json_actos := v_json_actos || apex_application.g_f01(i);',
'  end loop;',
'',
'  pkg_nt_notificacion.prc_rg_certificados_json(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                               p_json_actos         => v_json_actos,',
'                                               p_cdgo_rgstro_tpo    => :P36_CDGO_RGSTRO_TPO,',
'                                               o_id_nt_crtfcdo_json => v_id_nt_crtfcdo_json,',
'                                               o_nmro_actos         => v_nmro_actos,',
'                                               o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                               o_mnsje_rspsta       => v_mnsje_rspsta);',
'',
'  if (v_cdgo_rspsta <> 0) then',
'    raise v_error;',
'  else',
'    commit;',
'  ',
'    :P36_ID_JSON_ANTFCAR := v_id_nt_crtfcdo_json;',
'    :P36_ID_CRTFCDO_JSON := null;',
'      ',
'    APEX_UTIL.SET_SESSION_STATE(''P36_ID_JSON_ANTFCAR'',',
'                                v_id_nt_crtfcdo_json);',
'    APEX_UTIL.SET_SESSION_STATE(''P36_ID_CRTFCDO_JSON'', v_id_crtfcdo_json);',
'    APEX_UTIL.SET_SESSION_STATE(''P36_NMRO_ACTOS_PBLCAR'', v_nmro_actos);',
'  ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_id_nt_crtfcdo_json'', v_id_nt_crtfcdo_json);',
'    apex_json.write(''o_id_crtfcdo_json'', v_id_crtfcdo_json);',
'    apex_json.write(''o_nmro_actos'', v_nmro_actos);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'  end if;',
'',
'exception',
'  when v_error then',
'    rollback;',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_id_nt_crtfcdo_json'', v_id_nt_crtfcdo_json);',
'    apex_json.write(''o_id_crtfcdo_json'', v_id_crtfcdo_json);',
'    apex_json.write(''o_nmro_actos'', v_nmro_actos);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2877519903060518)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PublicaWebJob'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_cdgo_rspsta      number;',
'  v_mnsje_rspsta     varchar2(4000);',
'  v_exception        exception;',
'  x01                number;',
'  v_id_json_pblcar   number;',
'  v_running_instance number;',
'  v_prmtro_id_json   number;',
'begin',
'',
'  v_cdgo_rspsta := 0; ',
'  ',
'  x01 := apex_application.g_x01; ',
'    ',
'  if (:P36_ID_JSON_ANTFCAR is null) then',
'    v_id_json_pblcar := :P36_ID_CRTFCDO_JSON;',
'  else',
'    v_id_json_pblcar := :P36_ID_JSON_ANTFCAR;',
'  end if;',
'  ',
'  begin',
'  ',
'    DBMS_SCHEDULER.set_attribute(name      => ''"GENESYS"."IT_NT_NOTIFICACION_WEB"'',',
'                                 attribute => ''job_action'',',
'                                 value     => ''pkg_nt_notificacion.prc_rg_pag_web_job'');',
'  ',
'    DBMS_SCHEDULER.set_attribute(name      => ''"GENESYS"."IT_NT_NOTIFICACION_WEB"'',',
'                                 attribute => ''number_of_arguments'',',
'                                 value     => ''5'');',
'  ',
'    DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => ''IT_NT_NOTIFICACION_WEB'',',
'                                          argument_position => 1,',
'                                          argument_value    => :F_CDGO_CLNTE);',
'    DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => ''IT_NT_NOTIFICACION_WEB'',',
'                                          argument_position => 2,',
'                                          argument_value    => TO_CHAR(:P36_FCHA_PBLCCION,''DD/MM/YYYY''));',
'    DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => ''IT_NT_NOTIFICACION_WEB'',',
'                                          argument_position => 3,',
'                                          argument_value    => v_id_json_pblcar);',
'    DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => ''IT_NT_NOTIFICACION_WEB'',',
'                                          argument_position => 4,',
'                                          argument_value    => :P36_NTFCA_ACTO);                                      ',
'    DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE(job_name          => ''IT_NT_NOTIFICACION_WEB'',',
'                                          argument_position => 5,',
'                                          argument_value    => :F_ID_USRIO);',
'  ',
'  end;',
'',
'  begin',
'    DBMS_SCHEDULER.enable(''"GENESYS"."IT_NT_NOTIFICACION_WEB"'');',
'  exception',
'    when others then',
'      v_cdgo_rspsta := 1;',
'      raise v_exception;',
'  end;  ',
' ',
'  apex_json.open_object;',
'  apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'  apex_json.write(''o_estdo_job'', v_running_instance);',
'  apex_json.close_object;',
'',
'exception',
'  when v_exception then',
'  ',
'    rollback;',
'  ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_estdo_job'', v_running_instance);',
'    apex_json.close_object;',
'  ',
'  when others then',
'    rollback;',
'  ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_estdo_job'', v_running_instance);',
'    apex_json.close_object;',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(33466161853967319)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SeleccionActos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_nmro_actos         number;',
'    v_id_nt_crtfcdo_json number;',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(4000);',
'    v_error              exception;',
'    v_indcdor_ntfcdo     varchar2(10);',
'    v_datos              varchar2(4000);',
'begin',
'    ',
'   /* if (:P36_NTFCDO = ''S'') then',
'        v_indcdor_ntfcdo := ''S'';',
'    elsif (:P36_NTFCDO = ''N'') then   ',
'        v_indcdor_ntfcdo := ''N'';',
'    elsif (:P36_NTFCDO = ''T'' or :P36_NTFCDO is null) then    ',
'        v_indcdor_ntfcdo := ''(''||chr(39)||''N''||chr(39)||'',''||chr(39)||''S''||chr(39)||'')'';',
'    end if;',
'    ',
'    v_datos := ''Entrando a la up con F_CDGO_CLNTE: ''||:F_CDGO_CLNTE;',
'    v_datos := v_datos|| '', P36_NMRO_LOTE: ''||:F_CDGO_CLNTE;',
'    v_datos := v_datos|| '', v_indcdor_ntfcdo: ''||v_indcdor_ntfcdo;',
'    ',
'    insert into muerto (n_001,v_001,t_001) values (10,v_datos,systimestamp);',
'    commit;',
'    ',
'    pkg_nt_notificacion.prc_gn_json_actos_pblcar(p_cdgo_clnte         => :F_CDGO_CLNTE,',
'                                                 p_id_lte             => :P36_NMRO_LOTE,',
'                                                 p_indcdor_ntfcdo     => v_indcdor_ntfcdo,',
'                                                 p_fcha_pblccion      => :P36_FECHA_PUBLICADO,',
'                                                 p_cdgo_rgstro_tpo    => :P36_CDGO_RGSTRO_TPO,',
'                                                 o_nmro_actos         => v_nmro_actos,',
'                                                 o_id_nt_crtfcdo_json => v_id_nt_crtfcdo_json,',
'                                                 o_cdgo_rspsta        => v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta       => v_mnsje_rspsta);*/',
'                                                 ',
'   pkg_nt_notificacion.prc_gn_json_actos_lte(p_cdgo_clnte     => :F_CDGO_CLNTE,',
'                                             p_nmro_lte       => :P36_NMRO_LOTE,',
'                                             p_indcdor_ntfcdo => :P36_NTFCDO,',
'                                             p_nmro_acto      => :P36_NMRO_ACTO,',
'                                             o_id_json        =>  v_id_nt_crtfcdo_json,',
'                                             o_nmro_actos     =>  v_nmro_actos,',
'                                             o_cdgo_rspsta    =>  v_cdgo_rspsta,',
'                                             o_mnsje_rspsta   =>  v_mnsje_rspsta);   ',
'                                             ',
'   :P36_ID_CRTFCDO_JSON := v_id_nt_crtfcdo_json;',
'   :P36_ID_JSON_ANTFCAR := null;',
'   ',
'   APEX_UTIL.SET_SESSION_STATE(''P36_ID_CRTFCDO_JSON'', :P36_ID_CRTFCDO_JSON);',
'   APEX_UTIL.SET_SESSION_STATE(''P36_ID_JSON_ANTFCAR'', :P36_ID_JSON_ANTFCAR);                                          ',
'',
'   if v_cdgo_rspsta <> 0 then',
'       rollback;',
'       raise v_error;',
'   else       ',
'       commit;',
'   end if;',
'   ',
'   apex_json.open_object;',
'   apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'   apex_json.write(''o_id_nt_crtfcdo_json'', v_id_nt_crtfcdo_json); ',
'   apex_json.write(''o_nmro_actos'', v_nmro_actos);',
'   apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'   apex_json.close_object;',
'   ',
'   exception',
'	    when v_error then',
'			rollback;',
'			apex_json.open_object;',
'			apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'            apex_json.write(''o_id_nt_crtfcdo_json'', v_id_nt_crtfcdo_json); ',
'            apex_json.write(''o_nmro_actos'', v_nmro_actos);',
'            apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'			apex_json.close_object;  ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3574820656323718)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'genera_json_actos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_nmro_actos         number;',
'    v_id_json            number;',
'    v_cdgo_rspsta        number;',
'    v_mnsje_rspsta       varchar2(4000);',
'    v_error              exception;',
'    v_indcdor_ntfcdo     varchar2(1);',
'    v_datos              varchar2(4000);',
'begin',
'    ',
'     ',
'    pkg_nt_notificacion.prc_gn_json_actos(p_cdgo_clnte      => :F_CDGO_CLNTE,',
'                                          p_id_usrio        => :F_ID_USRIO,',
'                                          p_cdgo_acto_orgen => :P36_CDGO_ACTO_ORGEN,',
'                                          p_id_acto_tpo     => :P36_ID_ACTO_TPO,',
'                                          p_fcha_incial     => :P36_FCHA_INCIAL,',
'                                          p_fcha_fnal       => :P36_FCHA_FNAL,',
'                                          p_nmro_acto       => :P36_NMRO_ACTO,',
'                                          p_cdgo_rgstro_tpo => :P36_CDGO_RGSTRO_TPO,',
'                                          o_id_json         => v_id_json,',
'                                          o_nmro_actos      => v_nmro_actos,',
'                                          o_cdgo_rspsta     => v_cdgo_rspsta,',
'                                          o_mnsje_rspsta    => v_mnsje_rspsta);    ',
'    ',
'',
'   if v_cdgo_rspsta <> 0 then',
'       rollback;',
'       raise v_error;',
'   else       ',
'       commit;',
'   end if;',
'   ',
'   :P36_ID_CRTFCDO_JSON := v_id_json;',
'   :P36_ID_JSON_ANTFCAR := null;',
'   ',
'   APEX_UTIL.SET_SESSION_STATE(''P36_ID_CRTFCDO_JSON'', :P36_ID_CRTFCDO_JSON);',
'   APEX_UTIL.SET_SESSION_STATE(''P36_ID_JSON_ANTFCAR'', :P36_ID_JSON_ANTFCAR);',
'',
'   apex_json.open_object;',
'   apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'   apex_json.write(''o_id_json'', v_id_json); ',
'   apex_json.write(''o_nmro_actos'', v_nmro_actos); ',
'   apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'   apex_json.close_object;',
'   ',
'   exception',
'	    when v_error then',
'			rollback;',
'			apex_json.open_object;',
'			apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta); ',
'            apex_json.write(''o_id_json'', v_id_json); ',
'            apex_json.write(''o_nmro_actos'', v_nmro_actos); ',
'            apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'			apex_json.close_object;  ',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31027912125971701)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar Seleccion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  APEX_UTIL.SET_SESSION_STATE(''P36_FECHA_PUBLICADO'', :P36_FECHA_PUBLICADO);',
'  APEX_UTIL.SET_SESSION_STATE(''P36_FCHA_PBLCCION'', :P36_FCHA_PBLCCION);',
'  APEX_UTIL.SET_SESSION_STATE(''P36_NTFCDO'', :P36_NTFCDO);',
'  ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_CONSULTAR, BTN_PUBLICAR,BTN_GNRAR_CRTFCDO'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
null;
end;
/
