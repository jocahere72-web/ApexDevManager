prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Declaraciones Autorizar Presentaci\00F3n')
,p_step_title=>unistr('Declaraciones Autorizar Presentaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/1.0/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/pdfjs-2.4.456-dist/build/pdf.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URLSERVER = ''https://taxation-valledupar.gobiernoit.com/generarPdf'';',
'',
'function generarBlobPDF() {',
'    return new Promise(async function (resolve, reject) {',
'        try {',
'            let data = await apex.server.process("ajax_imprimirDeclaracion", {',
'                pageItems: "#P10_ID_DCLRCION"',
'            });',
'',
'            if (data.o_cdgo_rspsta != 0) {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.o_mnsje_rspsta,',
'                        unsafe: false',
'                    }',
'                ]);',
'            } else {',
'                let VALORES_GESTION = JSON.parse(data.valores);',
'                let html = `<div><div class="container-fluid">${data.html}</div></div>`;',
'                html = formularioDeclaracion.reemplazarHtml(html, VALORES_GESTION);',
'                let elm = VALORES_GESTION.find((f) => { return f.TPO === ''R'' });',
'                var htmla = '''';',
'                if (elm) {',
'                    html = $(`<div>${html}</div>`);',
'                    var alink = $(html).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                    if (alink.length > 0) {',
'                        JSON.parse(elm.VALUE).forEach((elmt, index, arr) => {',
'                            var clone = $(html).clone();',
'                            var it = $(clone).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                            $(it).text(elmt.valor || '''');',
'                            htmla += `${$(clone).html()}${(index === arr.length - 1) ? '''' : ''<div class="salto"></div>''}`;',
'                        });',
'                    } else {',
'                        htmla = $(html).html();',
'                    }',
'                } else {',
'                    htmla = html;',
'                }',
'                let v_blob = await formularioDeclaracion.fecth_async(URLSERVER, { ''html'': htmla, ''header'': '''' });',
'                //console.log(v_blob);',
'                resolve(v_blob);',
'            }',
'        } catch (e) {',
'            reject(e);',
'        }',
'    })',
'}',
'',
'',
'async function visualizarDeclaracion() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        let blobPDF = await generarBlobPDF();',
'        let urlPDF = URL.createObjectURL(blobPDF);',
'        // Asynchronous download of PDF',
'        var loadingTask = pdfjsLib.getDocument(urlPDF);',
'        loadingTask.promise.then(function (pdf) {',
'            console.log(''PDF loaded'');',
'',
'            // Fetch the first page',
'            var pageNumber = 1;',
'            pdf.getPage(pageNumber).then(function (page) {',
'                console.log(''Page loaded'');',
'',
'                var scale = 1.5;',
'                var viewport = page.getViewport({ scale: scale });',
'',
'                // Prepare canvas using PDF page dimensions',
'                var canvas = document.getElementById(''visorPDF'');',
'                var context = canvas.getContext(''2d'');',
'                canvas.height = viewport.height;',
'                canvas.width = viewport.width;',
'',
'                // Render PDF page into canvas context',
'                var renderContext = {',
'                    canvasContext: context,',
'                    viewport: viewport',
'                };',
'                var renderTask = page.render(renderContext);',
'                renderTask.promise.then(function () {',
'                    console.log(''Page rendered'');',
'                });',
'            });',
'        }, function (reason) {',
'            // PDF loading error',
'            console.log(reason)',
'        });',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
'async function autorizarDeclaracion(indicadorAutorizacion) {',
'    try {',
'        let data = await apex.server.process("ajax_autorizarDeclaracion", {',
'            x01: indicadorAutorizacion,',
'            pageItems: "#P10_TOKEN"',
'        });',
'',
'        if (data.o_cdgo_rspsta != 0) {',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type: "error",',
'                    location: "page",',
'                    message: data.o_mnsje_rspsta,',
'                    unsafe: false',
'                }',
'            ]);',
'        } else {',
unistr('            sessionStorage.setItem("mensajeDeclaracion", "Acci\00F3n procesada con \00E9xito.");'),
'            apex.submit();',
'        }',
'    } catch (e) {',
'        console.log(e);',
'    }',
'}',
'',
'function descargarDeclaracion() {',
'    return new Promise(async function (resolve, reject) {',
'        let $waitPopup = apex.widget.waitPopup();',
'        try {',
'            let data = await apex.server.process("ajax_validarAdjuntos", {',
'                pageItems: "#P10_ID_DCLRCION"',
'            });',
'',
'            if (data.o_cdgo_rspsta != 0) {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.o_mnsje_rspsta,',
'                        unsafe: false',
'                    }',
'                ]);',
'            } else {',
'                let vBlob = await generarBlobPDF();',
'                let a = document.createElement("a");',
'                document.body.appendChild(a);',
'',
'                let v_url = window.URL.createObjectURL(vBlob);',
'                a.download = "declaracion.pdf";//d.filename;',
'                a.href = v_url;',
'                a.click();',
'                document.body.removeChild(a);',
'                window.URL.revokeObjectURL(v_url);',
'            }',
'            resolve(true);',
'        } catch {',
'            reject(null)',
'        } finally {',
'            $waitPopup.remove();',
'        }',
'    })',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'mostrarAyudaD();',
'visualizarDeclaracion();',
'',
'apex.message.hidePageSuccess();',
'if (sessionStorage.getItem("mensajeDeclaracion")) {',
'    apex.message.showPageSuccess(sessionStorage.getItem("mensajeDeclaracion"));',
'    sessionStorage.removeItem("mensajeDeclaracion");',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20210215130540'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57687342888056401)
,p_plug_name=>unistr('Regi\00F3n Visor')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="visor" class="pdfobject-container" ></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82729873618639603)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(82730242779639607)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><i><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i></b>',
unistr('</h5>Funcionalidad que permite autorizar o rechazar la declaraci\00F3n.'),
'<br>',
unistr('Para que la declaraci\00F3n pueda actualizar su estado a \201Cautorizada\201D, todos los responsables relacionados en la regi\00F3n de'),
unistr('firmas deben autorizar la declaraci\00F3n.'),
'<br><br>',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.'),
'</i>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82734478668639649)
,p_plug_name=>unistr('Encabezado Declaraci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion id_dclrcion_2,',
'        b.nmbre_impsto_sbmpsto,',
'        c.vgncia,',
'        c.prdo || '' - '' || c.dscrpcion prdo,',
'        f.dscrpcion dscrpcion_tpo_dclrcion,',
'        a.nmro_cnsctvo,',
'        g.dscrpcion_dclrcion_estdo',
'from    gi_g_declaraciones          a',
'join    df_i_impuestos_subimpuesto  b   on  b.id_impsto_sbmpsto         =   a.id_impsto_sbmpsto',
'join    df_i_periodos               c   on  c.id_prdo                   =   a.id_prdo',
'join    gi_d_dclrcnes_vgncias_frmlr d   on  d.id_dclrcion_vgncia_frmlrio=   a.id_dclrcion_vgncia_frmlrio',
'join    gi_d_dclrcnes_tpos_vgncias  e   on  e.id_dclrcion_tpo_vgncia    =   d.id_dclrcion_tpo_vgncia',
'join    gi_d_declaraciones_tipo     f   on  f.id_dclrcn_tpo             =   e.id_dclrcn_tpo',
'join    gi_d_declaraciones_estado   g   on  g.cdgo_dclrcion_estdo       =   a.cdgo_dclrcion_estdo;'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83691570936840813)
,p_plug_name=>'Declaraciones Tabs'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(252182344492651399)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83691028716840808)
,p_plug_name=>'Vista Previa'
,p_parent_plug_id=>wwv_flow_api.id(83691570936840813)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<canvas id="visorPDF"></canvas>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(83691691776840814)
,p_plug_name=>unistr('Historial de Autorizaci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(83691570936840813)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178663149651395)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_dclrcion_autrzcion_lte,',
'        case a.actvo',
'            when ''S'' then ''Activo''',
'            when ''N'' then ''Inactivo''',
'        end actvo,',
'        case a.cdgo_rspsta',
'            when ''P'' then ''Pendiente''',
'            when ''A'' then ''Aceptada''',
'            when ''R'' then ''Rechazada''',
'        end cdgo_rspsta',
'from    gi_g_dclrcnes_autrzcnes_lte a',
'where   a.id_dclrcion   =   :P10_ID_DCLRCION;'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83691819232840816)
,p_name=>'ID_DCLRCION_AUTRZCION_LTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_DCLRCION_AUTRZCION_LTE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Lote'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>10
,p_value_alignment=>'CENTER'
,p_attribute_03=>'right'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83691959326840817)
,p_name=>'ACTVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTVO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>8
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
 p_id=>wwv_flow_api.id(83692094557840818)
,p_name=>'CDGO_RSPSTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_RSPSTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Respuesta Autorizaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>9
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
 p_id=>wwv_flow_api.id(83692126545840819)
,p_name=>'Ver Responsables'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attribute_02=>'VALUE'
,p_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22:P22_ID_DCLRCION_AUTRZCION_LTE:&ID_DCLRCION_AUTRZCION_LTE.'
,p_link_text=>'Ver Responsables'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(83691786375840815)
,p_internal_uid=>83691786375840815
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
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
 p_id=>wwv_flow_api.id(84394562015675168)
,p_interactive_grid_id=>wwv_flow_api.id(83691786375840815)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(84394684446675169)
,p_report_id=>wwv_flow_api.id(84394562015675168)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84395161113675178)
,p_view_id=>wwv_flow_api.id(84394684446675169)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(83691819232840816)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84395676498675183)
,p_view_id=>wwv_flow_api.id(84394684446675169)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(83691959326840817)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84396166248675194)
,p_view_id=>wwv_flow_api.id(84394684446675169)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(83692094557840818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(84397884360697899)
,p_view_id=>wwv_flow_api.id(84394684446675169)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(83692126545840819)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4322378398924801)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(82729873618639603)
,p_button_name=>'BTN_DSCRGAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Descargar Declaraci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_g_declaraciones  a',
'where   a.id_dclrcion           =   :P10_ID_DCLRCION',
'and     a.cdgo_dclrcion_estdo   =   ''REG'';'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82730016630639605)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(82729873618639603)
,p_button_name=>'BTN_AUTRZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Autorizar Declaraci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_g_declaraciones  a',
'where   a.id_dclrcion           =   :P10_ID_DCLRCION',
'and     a.cdgo_dclrcion_estdo   =   ''REG'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10327569298337205)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(82729873618639603)
,p_button_name=>'BTN_PAGO_LINEA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Pago En Linea'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P10_CDGO_DCLRCION_ESTDO = ''AUT'' and exists  (',
'                                                select  1',
'                                                from    gi_g_declaraciones          a',
'                                                join    gi_d_dclrcnes_vgncias_frmlr b   on  b.id_dclrcion_vgncia_frmlrio    =   a.id_dclrcion_vgncia_frmlrio',
'                                                join    gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcion_tpo_vgncia        =   b.id_dclrcion_tpo_vgncia',
'                                                join    gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo                 =   c.id_dclrcn_tpo',
'                                                where   a.id_dclrcion           =   :P10_ID_DCLRCION',
'                                                and     a.vlor_pago             >   0',
'                                                and     d.indcdor_prsntcion_web =   ''S''    ',
'                                            );'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(82730150028639606)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(82729873618639603)
,p_button_name=>'BTN_RCHZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>unistr('Rechazar Declaraci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  1',
'from    gi_g_declaraciones  a',
'where   a.id_dclrcion           =   :P10_ID_DCLRCION',
'and     a.cdgo_dclrcion_estdo   =   ''REG'';'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-undo-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(10327840047337208)
,p_name=>'P10_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57687449785056402)
,p_name=>'P10_TOKEN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57687579523056403)
,p_name=>'P10_CDGO_CLNTE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(82729641258639601)
,p_name=>'P10_ID_DCLRCION'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_item_source_plug_id=>wwv_flow_api.id(82734478668639649)
,p_source=>'ID_DCLRCION_2'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83690446959840802)
,p_name=>'P10_NMBRE_IMPSTO_SBMPSTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_item_source_plug_id=>wwv_flow_api.id(82734478668639649)
,p_prompt=>'Tributo'
,p_source=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83690597012840803)
,p_name=>'P10_VGNCIA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_item_source_plug_id=>wwv_flow_api.id(82734478668639649)
,p_prompt=>'Vigencia'
,p_source=>'VGNCIA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83690691716840804)
,p_name=>'P10_PRDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_item_source_plug_id=>wwv_flow_api.id(82734478668639649)
,p_prompt=>'Periodo'
,p_source=>'PRDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83690765363840805)
,p_name=>'P10_DSCRPCION_TPO_DCLRCION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_item_source_plug_id=>wwv_flow_api.id(82734478668639649)
,p_prompt=>unistr('Tipo Declaraci\00F3n')
,p_source=>'DSCRPCION_TPO_DCLRCION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83690806520840806)
,p_name=>'P10_NMRO_CNSCTVO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_item_source_plug_id=>wwv_flow_api.id(82734478668639649)
,p_prompt=>unistr('N\00FAmero Declaraci\00F3n')
,p_source=>'NMRO_CNSCTVO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(83690913369840807)
,p_name=>'P10_DSCRPCION_DCLRCION_ESTDO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(82734478668639649)
,p_item_source_plug_id=>wwv_flow_api.id(82734478668639649)
,p_prompt=>'Estado'
,p_source=>'DSCRPCION_DCLRCION_ESTDO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(57687713368056405)
,p_computation_sequence=>10
,p_computation_item=>'F_CDGO_CLNTE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P10_CDGO_CLNTE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(10327967079337209)
,p_computation_sequence=>20
,p_computation_item=>'P10_CDGO_DCLRCION_ESTDO'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  cdgo_dclrcion_estdo',
'from    gi_g_declaraciones  a',
'where   a.id_dclrcion           =   :P10_ID_DCLRCION;',
''))
,p_compute_when=>'P10_ID_DCLRCION'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(82730424349639609)
,p_name=>'autorizarDeclaracion'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(82730016630639605)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82730573420639610)
,p_event_id=>wwv_flow_api.id(82730424349639609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de autorizar la declaraci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            autorizarDeclaracion("S");',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(82730648118639611)
,p_name=>unistr('Rechazar Declaraci\00F3n')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(82730150028639606)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(82730770767639612)
,p_event_id=>wwv_flow_api.id(82730648118639611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de rechazar la declaraci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            autorizarDeclaracion("N");',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4322472877924802)
,p_name=>unistr('Descargar Declaraci\00F3n')
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4322378398924801)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4322528817924803)
,p_event_id=>wwv_flow_api.id(4322472877924802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'descargarDeclaracion()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10327618622337206)
,p_name=>'Pago en Linea'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10327569298337205)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10327762756337207)
,p_event_id=>wwv_flow_api.id(10327618622337206)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "Tenga en cuenta que ser\00E1 redireccionado a una p\00E1gina para su pago en l\00EDnea,  \00BFEst\00E1 seguro de realizar esta accion?", function( okPressed ) {'),
'    if( okPressed ) {',
'        window.open("https://www.avalpaycenter.com/wps/portal/portal-de-pagos/web/pagos-aval/resultado-busqueda/realizar-pago/!ut/p/a1/lZBPU4MwEMW_ih48OZINBQpHgrUgtlSFKlycFGKNAkEK6PjpDe34t1rHnDa77-37JShB1ygpaceXtOGipHl_T4wb09INTwPVN-caAduLrJMz18UwASm'
||'IpQB-OTZ89Qfa-XHvd8lYJwMI3vzvgnG4DvAvVZf4GBxtp99Rt_yaZUhBMHHm8wgD_Ne_DfiH_wolXyU_vOCbYBtxLdjxh7GEHH6OsEZyA7G8aTjAYA7RZb_jnnb0WVmxustZo_AyzduMKRVt7m54eStQfACkXaU0E_WslmNe0fyEpmw15-xJeb5rirxfk4pC4YtCue1HSiXqpl9XiIyhuJNKFLsoOSxj40yW3kd5-lHuxA2MDW4qMr4UD'
||'m8zmqEY1i3asKVkfGxZRt97RSXeekQmOvbeJJiGowvP_p4E_tCWSTo5dclU_txwC8UHC-xQKka-rY51vEGpH1suGbCBVcuwVA10rG0Qy46VXHg9IADG5kBDVRFF0TXwWVGYg4eLI7p4YQvzPmSxvf8KuUOm4A!!/#Z7_8956I402K0K7A0AI5BJHBN00A7", "_blank")',
';',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82734506471639650)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_region_id=>wwv_flow_api.id(82734478668639649)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>unistr('Inicializar pantalla Declaraciones Autorizar Presentaci\00F3n')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82729750793639602)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_imprimirDeclaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'    ',
'',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionReporte'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''gestionarReporteFormulario:'' || :F_CDGO_CLNTE || '':'' || :P10_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''valores'', v_json.get_Clob(''valores''));',
'    apex_json.write(''v_id_dclrcion'', :P10_ID_DCLRCION);',
'    apex_json.write(''v_cdgo_clnte'' , :F_CDGO_CLNTE);',
'    apex_json.write(''html''   , v_json.get_Clob(''html''));',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(82730359222639608)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_autorizarDeclaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json            json_object_t;',
'    v_indcdor_atrzdo  varchar2(1) := apex_application.g_x01;',
'begin',
'    ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(',
'                                    apex_web_service.make_rest_request    (',
'                                                                            p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                            p_http_method  => ''POST'',',
'                                                                            p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_jwt_atrzcion:p_indcdor_atrzdo''),',
'                                                                            p_parm_value   => apex_util.string_to_table(''autorizarDeclaracion:'' || :F_CDGO_CLNTE || '':'' || :P10_TOKEN || '':'' || v_indcdor_atrzdo)',
'                                                                          )',
'                                 );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(83694246885840840)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarAdjuntos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''validarDeclaracionesAdjuntos:'' || :F_CDGO_CLNTE || '':'' || :P10_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
