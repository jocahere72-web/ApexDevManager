prompt --application/pages/page_00115
begin
wwv_flow_api.create_page(
 p_id=>115
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Reporte Declaraciones'
,p_step_title=>'Reporte Declaraciones'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#/libraries/ckeditor/4.5.11/ckeditor.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/Reporte/js/bootstrap.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/Reporte/js/generatePdf.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/Reporte/js/menu.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/Reporte/js/main.js'))
,p_javascript_code_onload=>'loadFormulario();'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/Reporte/css/bootstrap.min.css',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/Reporte/css/style.css',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/css/tooltipster.bundle.min.css'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200811182237'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45124401080054301)
,p_plug_name=>unistr('Configuraci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''      ',
'        <div class="dropdown-menu dropdown-menu-md" id="context-menu">',
'        </div>',
'        <div id="formvalue" class="dropdown-menu dropdown-menu-md">',
'            <form>',
'                <div class="form-group">',
'                    <textarea id="editor" class="form-control" rows="3" cols="40"></textarea>',
'                    <button type="button" class="btn btn-outline-primary btn-sm" id="btnEditor">Aceptar</button>',
'                </div>',
'            </form>',
'        </div>',
'',
'        <!--Cuadro modal de configuraciones de una tabla-->',
'        <div id="modalTable" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"',
'            aria-labelledby="myLargeModalLabel" aria-hidden="true">',
'            <div class="modal-dialog modal-md">',
'                <div class="modal-content">',
'                    <div class="modal-header">',
'                        <h4 class="modal-title">Configurar tabla</h4>',
'                    </div>',
'                    <div class="modal-body">',
'                        <ul class="nav nav-tabs" id="myTab" role="tablist">',
'                            <li class="nav-item">',
'                                <a class="nav-link active" id="columns-tab" data-toggle="tab" href="#columns" role="tab"',
'                                    aria-controls="columns" aria-selected="true">Columnas</a>',
'                            </li>',
'                            <li class="nav-item">',
'                                <a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab"',
unistr('                                    aria-controls="settings" aria-selected="false">Configuraci\00F3n</a>'),
'                            </li>',
'                        </ul>',
'                        <div class="tab-content" id="myTabContent">',
'                            <div class="tab-pane fade show active" id="columns" role="tabpanel"',
'                                aria-labelledby="columns-tab">',
'                                <br>',
'                                <form>',
'                                    <div class="form-group row">',
'                                        <label for="colFormLabelSm"',
'                                            class="col-sm-2 col-form-label col-form-label-sm">Columnas</label>',
'                                        <div class="col-sm-10">',
'                                            <input type="text" class="form-control form-control-sm" id="column"',
'                                                placeholder="numero de columnas">',
'                                        </div>',
'                                    </div>',
'                                    <div class="form-group row">',
'                                        <label for="colFormLabelSm"',
'                                            class="col-sm-2 col-form-label col-form-label-sm">Filas</label>',
'                                        <div class="col-sm-10">',
'                                            <input type="text" class="form-control form-control-sm" id="rows"',
'                                                placeholder="numero de filas">',
'                                        </div>',
'                                    </div>',
'                                    <div class="form-group form-check">',
'                                        <input type="checkbox" class="form-check-input" id="header" value="1">',
'                                        <label class="form-check-label" for="header">Agregar Cabecera</label>',
'                                    </div>',
'                                </form>',
'                            </div>',
'                            <div class="tab-pane fade" id="settings" role="tabpanel" aria-labelledby="settings-tab">',
'                                <br>',
'                                <form>',
'                                    <div class="form-group row">',
'                                        <label for="colFormLabelSm"',
'                                            class="col-sm-2 col-form-label col-form-label-sm">Email</label>',
'                                        <div class="col-sm-10">',
'                                            <input type="email" class="form-control form-control-sm" id="colFormLabelSm"',
'                                                placeholder="col-form-label-sm">',
'                                        </div>',
'                                    </div>',
'                                    <div class="form-group row">',
'                                        <label for="colFormLabelSm"',
'                                            class="col-sm-2 col-form-label col-form-label-sm">Email</label>',
'                                        <div class="col-sm-10">',
'                                            <input type="email" class="form-control form-control-sm" id="colFormLabelSm"',
'                                                placeholder="col-form-label-sm">',
'                                        </div>',
'                                    </div>',
'                                    <div class="form-group row">',
'                                        <label for="colFormLabelSm"',
'                                            class="col-sm-2 col-form-label col-form-label-sm">Email</label>',
'                                        <div class="col-sm-10">',
'                                            <input type="email" class="form-control form-control-sm" id="colFormLabelSm"',
'                                                placeholder="col-form-label-sm">',
'                                        </div>',
'                                    </div>',
'                                </form>',
'                            </div>',
'                        </div>',
'                    </div>',
'                    <!-- Modal footer -->',
'                    <div class="modal-footer">',
'                        <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>',
'                    </div>',
'                </div>',
'            </div>',
'        </div>',
'',
'        <!--Cuadro modal de configuraciones de una columna de la tabla-->',
'        <div id="modalTd" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"',
'            aria-labelledby="myLargeModalLabel" aria-hidden="true">',
'            <div class="modal-dialog modal-md">',
'                <div class="modal-content">',
'                    <div class="modal-header">',
unistr('                        <h4 class="modal-title">Configuraci\00F3n de columna</h4>'),
'                    </div>',
'                    <div class="modal-body">',
'                        <form>',
'                            <div class="form-group row">',
'                                <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">',
'                                    Colspan</label>',
'                                <div class="col-sm-10">',
'                                    <input type="text" class="form-control form-control-sm" id="colspan"',
'                                        placeholder="tramo de columnas">',
'                                </div>',
'                            </div>',
'                            <div class="form-group row">',
'                                <label for="colFormLabelSm"',
'                                    class="col-sm-2 col-form-label col-form-label-sm">Rowspan</label>',
'                                <div class="col-sm-10">',
'                                    <input type="text" class="form-control form-control-sm" id="rowspan"',
'                                        placeholder="tramo de fila ">',
'                                </div>',
'                            </div>',
'                            <div class="form-group row">',
'                                <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Color de Fondo</label>',
'                                <div class="col-sm-10">',
'                                    <input type="color" class="form-control form-control-sm" id="background-color" value="#ffffff" placeholder="Color de fondo">',
'                                </div>',
'                            </div>',
'                            ',
'                            <div class="form-group row">',
unistr('                                <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Alineaci\00F3n del texto</label>'),
'                                <div class="col-sm-10">',
unistr('                                    <select class="form-control form-control-sm" id="text-align" placeholder="Alineaci\00F3n del texto">'),
'                                        <option value="V">Vertical</option>',
'                                        <option value="H">Horizontal</option>',
'                                    </select>  ',
'                                </div>',
'                            </div>',
'      ',
'                            <div class="form-group row">',
'                                <label for="width" class="col-sm-2 col-form-label col-form-label-sm">Ancho</label>',
'                                <div class="col-sm-10">',
'                                    <input type="number" class="form-control form-control-sm" id="width" placeholder="Ancho">',
'                                </div>',
'                            </div>',
'      ',
'                        </form>',
'                    </div>',
'                    <div class="modal-footer">',
'                        <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>',
'                    </div>',
'                </div>',
'            </div>',
'        </div>',
'',
'        <!--Cuadro modal de configuraciones de una division de columna -->',
'        <div id="modalCol" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"',
'            aria-labelledby="myLargeModalLabel" aria-hidden="true">',
'            <div class="modal-dialog modal-md">',
'                <div class="modal-content">',
'                    <div class="modal-header">',
unistr('                        <h4 class="modal-title">Configuraci\00F3n de columna</h4>'),
'                    </div>',
'                    <div class="modal-body">',
'                        <form>',
'                            <div class="form-group row">',
'                                <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Color de',
'                                    Fondo</label>',
'                                <div class="col-sm-10">',
'                                    <input type="color" class="form-control form-control-sm" id="background-color"',
'                                        placeholder="Color de fondo">',
'                                </div>',
'                            </div>',
'                        </form>',
'                    </div>',
'                    <div class="modal-footer">',
'                        <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>',
'                    </div>',
'                </div>',
'            </div>',
'        </div>',
'',
'',
'          <div class="container-fluid">',
'            <div class="row">',
'                <div class="col-sm-12">',
'                    <div class="row header">',
'                        <div class="col-sm-12">',
'                            <div class="card">',
'                                <div class="droppable card-body"></div>',
'                            </div>',
'                        </div>',
'                    </div>',
'                    <div class="row body">',
'                        <div class="col-sm-12">',
'                            <div class="card">',
'                                <div class="droppable card-body"></div>',
'                            </div>',
'                        </div>',
'                    </div>',
'                    <div class="row footer">',
'                        <div class="col-sm-12">',
'                            <div class="card">',
'                                <div class="droppable card-body"></div>',
'                            </div>',
'                        </div>',
'                    </div>',
'                </div>                ',
'            </div>',
'        </div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(45125303845054310)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>'<br><h5><center><b><i> Opciones</i><i class="fa fa-gears" aria-hidden="true"></i></b></center></h5>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46755245656840921)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>40
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
unistr('Esta Funcionalidad permite gestionar los reportes de un formulario de declaraci\00F3n.'),
'<br><br>	',
unistr('Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46755991927840928)
,p_plug_name=>'Paleta'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46755772545840926)
,p_plug_name=>'Formulario'
,p_parent_plug_id=>wwv_flow_api.id(46755991927840928)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'htp.p(''<div class="card-body" id="formulario"></div>'')'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46755879662840927)
,p_plug_name=>'Elementos'
,p_parent_plug_id=>wwv_flow_api.id(46755991927840928)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''<ul class="elementos">',
'    <li>',
'        <div id="row" class="elements" draggable="true">Fila</div>',
'    </li>',
'    <li>',
'        <div id="col" class="elements" draggable="true">Columna</div>',
'    </li>',
'    <li>',
'        <div id="table" class="elements" draggable="true">tabla</div>',
'    </li>',
'    <li>',
'        <div id="br" class="elements" draggable="true">Salto de linea</div>',
'    </li>',
'    <li>',
'        <div id="sl" class="elements" draggable="true">Salto de pagina</div>',
'    </li>',
'    <li>',
'        <div id="img" class="elements" draggable="true">Imagen</div>',
'    </li>',
'    <li>',
unistr('        <div id="cdgo" class="elements" draggable="true">C\00F3digo de Barra</div>'),
'    </li>',
'</ul>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(46756130976840930)
,p_plug_name=>unistr('Elementos Declaracci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(46755991927840928)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164076287595707682)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    htp.p(''<div class="card-body" id="formulario">'');',
'    htp.p(''<ul id="varlist">'');',
'     ',
'    for elm in (select cdgo_elmnto',
'                     , tpo_rtrno',
'                     , nmbre',
'                  from v_gi_d_dclrcnes_rprte_elmnto',
'                 where cdgo_clnte = :F_CDGO_CLNTE',
'                )',
'    loop',
'        htp.p(''<li><div class="column h-card" data-tooltip="''|| elm.nmbre || ''" data-valor="<span data-elm=''''''||elm.cdgo_elmnto || ''''''>#''|| elm.nmbre || ''#</span>" draggable="true">''|| elm.nmbre || ''</div></li>'');',
'    end loop;',
'    htp.p(''</ul></div>'');',
'',
'exception',
'    when others then',
'    null;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46756516169840934)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(45125303845054310)
,p_button_name=>'btn_rgrsar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Regresar'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46755114785840920)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(45125303845054310)
,p_button_name=>'btn_aplicar'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-floppy-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(46756296706840931)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(45125303845054310)
,p_button_name=>'btn_imprimir'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Vista previa'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-eye'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46755060600840919)
,p_name=>'P115_ID_DCLRCION_RPRTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(45124401080054301)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46755318104840922)
,p_name=>unistr('al hacer clic en el bot\00F3n aplicar cambios')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46755114785840920)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46755477295840923)
,p_event_id=>wwv_flow_api.id(46755318104840922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'guardar();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(46756398017840932)
,p_name=>unistr('al hacer clic en el bot\00F3n imprimir')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(46756296706840931)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(46756483580840933)
,p_event_id=>wwv_flow_api.id(46756398017840932)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'generar(0);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(48967702746095803)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar'
,p_process_sql_clob=>'null;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(46755114785840920)
,p_process_success_message=>unistr('\00A1Reporte actualizado de forma exitosa!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45125074563054307)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarFormulario'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json_formulario               clob;',
'    v_cdgo_rspsta                   number;',
'    v_mnsje_rspsta                  varchar2(4000);',
'    v_id_dclrcion_vgncia_frmlrio    number; ',
'begin',
'    begin',
'        select max(b.id_dclrcion_vgncia_frmlrio)',
'          into v_id_dclrcion_vgncia_frmlrio',
'          from gi_d_declaraciones_reporte  a',
'          join gi_d_dclrcnes_vgncias_frmlr b on b.id_frmlrio = a.id_frmlrio',
'         where a.id_dclrcion_rprte = :P115_ID_DCLRCION_RPRTE',
'           and a.actvo = ''S'';',
'    exception',
'        when others then ',
'            v_id_dclrcion_vgncia_frmlrio := null;',
'    end;',
'    apex_json.open_object;',
'    pkg_gi_declaraciones.prc_co_declaracion_formulario ( p_cdgo_clnte                  => :F_CDGO_CLNTE,',
'                                                         p_id_dclrcion_vgncia_frmlrio  => v_id_dclrcion_vgncia_frmlrio,',
'                                                         p_id_sjto_impsto              => 1,',
'                                                         o_json                        => v_json_formulario,',
'                                                         o_cdgo_rspsta                 => v_cdgo_rspsta,',
'                                                         o_mnsje_rspsta                => v_mnsje_rspsta);',
'',
'    if (v_cdgo_rspsta <> 0) then',
'        null;',
'    end if;',
'    apex_json.write(''v_json'', v_json_formulario);',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object;',
'end; '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(45125585252054312)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'obtenerDatos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json_formulario   clob;',
'    v_valor_gestion_a   json_array_t;',
'    v_valor_gestion     clob;',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(4000);',
'    v_id_dclrcion       number         := apex_application.g_f01(1);',
'    v_html              clob;',
'    v_count             number := 1;',
'    v_rs                clob; ',
'    v_h                 clob;',
'begin',
'    apex_json.open_object;',
'    begin',
'        begin        ',
'            select c.id_dclrcion',
'              into v_id_dclrcion',
'              from gi_d_declaraciones_reporte  a',
'              join gi_d_dclrcnes_vgncias_frmlr b',
'                on b.id_frmlrio = a.id_frmlrio',
'              join gi_g_declaraciones c',
'                on c.id_dclrcion_vgncia_frmlrio = b.id_dclrcion_vgncia_frmlrio',
'             where a.id_dclrcion_rprte = :P115_ID_DCLRCION_RPRTE',
'               and a.actvo = ''S''',
'          order by c.id_dclrcion',
'             fetch first 1 row only ;',
'           ',
'            pkg_gi_declaraciones.prc_co_dclrcnes_vlor_gstion( p_cdgo_clnte		=>	:F_CDGO_CLNTE',
'                                                            , p_id_dclrcion		=>	v_id_dclrcion',
'                                                            , o_valor_gestion	=>	v_valor_gestion_a',
'                                                            , o_cdgo_rspsta		=>	v_cdgo_rspsta',
'                                                            , o_mnsje_rspsta	=>	v_mnsje_rspsta);',
'',
'            if (v_cdgo_rspsta <> 0) then',
'                null;',
'            end if;',
'        exception',
'            when others then',
'                v_valor_gestion_a := json_array_t(''[]'');',
'        end;',
'        ',
'        begin',
'            select a.encbzdo || a.cntndo|| a.pie_pgna ',
'              into v_html',
'              from gi_d_declaraciones_reporte  a',
'             where a.id_dclrcion_rprte = :P115_ID_DCLRCION_RPRTE',
'               and a.actvo = ''S'';',
'        exception',
'            when others then',
'                v_html := '''';',
'        end;',
'       ',
'        v_valor_gestion := v_valor_gestion_a.stringify;    ',
'        apex_json.write(''valores'', v_valor_gestion);',
'        apex_json.write(''html''   , v_html);',
'        apex_json.write(''type''   , ''OK'');',
'        apex_json.close_object;',
'    exception',
'        when others then',
'            apex_json.write(''type'', ''ERROR'');',
'            apex_json.write(''msg'' , ''Ocurrio un error '' || sqlerrm);',
'            apex_json.close_object;',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46755587943840924)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Guardar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_header clob;',
'    v_body   clob;',
'    v_footer clob;',
'begin',
'    ',
'    for i in 1..apex_application.g_f01.count ',
'    loop',
'        v_header := v_header || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    for i in 1..apex_application.g_f02.count ',
'    loop',
'        v_body := v_body || apex_application.g_f02(i);',
'    end loop;',
'    ',
'    for i in 1..apex_application.g_f03.count ',
'    loop',
'        v_footer := v_footer || apex_application.g_f03(i);',
'    end loop;',
'    ',
'    apex_json.open_object;',
'    begin',
'        update gi_d_declaraciones_reporte',
'           set encbzdo  = v_header',
'             , cntndo   = v_body',
'             , pie_pgna = v_footer',
'         where id_dclrcion_rprte = :P115_ID_DCLRCION_RPRTE;',
'        ',
'        apex_json.write(''type'', ''OK'');',
unistr('        apex_json.write(''msg'' , ''\00A1Reporte actualizado de forma exitosa!'');'),
'    exception',
'        when others then',
'             apex_json.write(''type'', ''error'');',
'            apex_json.write(''msg''  , sqlerrm);',
'    end;',
'    apex_json.close_all;',
'end ;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(46755649103840925)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ConsultarHtml'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_header     clob;',
'v_content    clob;',
'v_footer     clob;',
'begin',
'    apex_json.open_object;',
'    begin',
'        select encbzdo',
'             , cntndo',
'             , pie_pgna',
'          into v_header',
'             , v_content',
'             , v_footer',
'          from gi_d_declaraciones_reporte',
'         where id_dclrcion_rprte = :P115_ID_DCLRCION_RPRTE;',
'',
'        apex_json.write(''type'', ''OK'') ;',
'        apex_json.write(''header'', v_header) ;',
'        apex_json.write(''body''  , v_content) ;',
'        apex_json.write(''footer'', v_footer) ;',
'    exception',
'        when others then',
'            apex_json.write(''type'', ''error'');',
'            apex_json.write(''msg'', sqlerrm);',
'    end;',
'    apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
