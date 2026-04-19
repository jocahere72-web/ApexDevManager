prompt --application/pages/page_00550
begin
wwv_flow_api.create_page(
 p_id=>550
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Declaraciones Presentaci\00F3n')
,p_step_title=>unistr('Declaraciones Presentaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function visor(file) {',
'    var container = document.getElementById(''visor'');',
'    if (container.childElementCount > 0)',
'        container.children[0].remove();',
'    if (file) {',
'        var v_url = window.URL.createObjectURL(file);',
'        var visor = document.createElement(''iframe'');',
'        var obj = document.createElement(''object'');',
'        obj.setAttribute(''data'', v_url + "#toolbar=0&navpanes=0&scrollbar=0");',
'        obj.setAttribute(''width'', ''100%'');',
'        obj.setAttribute(''height'', ''100%'');',
'        obj.setAttribute(''type'', file.type);',
'        obj.append(visor);',
'        visor.setAttribute(''class'', ''pdfobject'');',
'        visor.setAttribute(''src'', v_url + "#toolbar=0&navpanes=0&scrollbar=0");',
'        visor.setAttribute(''type'', file.type);',
'        visor.setAttribute(''style'', ''overflow: auto; width: 100%; height: 100%;'');',
'        visor.setAttribute(''internalinstanceid'', ''29'');',
'        container.append(obj);',
'    }',
'}',
'',
'async function declaracion_vencida() {',
unistr('    // Validar si la fecha l\00EDmite est\00E1 vencida'),
'    let $waitPopup = apex.widget.waitPopup(); // Mostrar el popup de espera',
'        try {',
'',
unistr('            // Llamada al proceso AJAX para consultar la fecha l\00EDmite'),
'            var rs = await apex.server.process("ajax_consulta_fecha_limite", {',
unistr('                pageItems: "#P550_ID_DCLRCION" // Se pasa el par\00E1metro del ID de declaraci\00F3n a la llamada'),
'            });',
'',
'            // Verificar el tipo de respuesta del servidor',
'            if (rs.type === ''OK'') {',
unistr('                console.log(''Fecha l\00EDmite v\00E1lida: '', rs);'),
unistr('                //apex.message.showPageSuccess("La fecha l\00EDmite es v\00E1lida. Puede proceder con el pago."); // Mensaje de \00E9xito'),
'                ',
'            } else {',
unistr('                console.log(''Fecha l\00EDmite no v\00E1lida o error: '', rs);'),
'                Swal.fire({',
'                title: ''Apreciado contribuyente'',',
unistr('                text: ''Esta declaraci\00F3n se encuentra vencida por lo que no podr\00E1 realizar el pago a trav\00E9s de Bot\00F3n PSE. Por favor, presente nuevamente su declaraci\00F3n y realice el pago a trav\00E9s de los medios de pago que tenemos para su disposici\00F3n.'','),
'                icon: ''info'',',
'                confirmButtonText: ''Aceptar'',',
'                confirmButtonColor: ''#3085d6''',
'                });',
'            }',
'        } catch (e) {',
unistr('            console.error("Error en la funci\00F3n declaracion_vencida:", e);  // Capturar y mostrar el error en la consola'),
'        } finally {',
'            $waitPopup.remove();  // Asegurarse de que el popup se remueva',
'        }   ',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function ver() {',
'    var $waitPopup = apex.widget.waitPopup();',
'    try {',
'        var docUrl = ''f?p=&APP_ID.:550:&APP_SESSION.:APPLICATION_PROCESS=DOWNLOADFILE:::'';',
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
'ver();',
'declaracion_vencida();'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'ILARA'
,p_last_upd_yyyymmddhh24miss=>'20250313155201'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32746335480463202)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>40
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
 p_id=>wwv_flow_api.id(32746496332463203)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
unistr('<i style=" color: red; font-weight: 500; font-size: 18px;">Se debe autorizar la declaraci\00F3n con el fin de habilitar la presentaci\00F3n de la misma ante la administraci\00F3n.</i>'),
'<br><br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P550_CDGO_DCLRCION_ESTDO'
,p_plug_display_when_cond2=>'REG'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(192686972537774720)
,p_plug_name=>'Viewer'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="visor"',
'     class="pdfobject-container">',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32746546413463204)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(32746335480463202)
,p_button_name=>'BTN_PRESENTAR_SIN_PAGO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Presentaci\00F3n Sin Pago')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P550_CDGO_DCLRCION_ESTDO = ''AUT'' and exists  (',
'                                                select  1',
'                                                from    gi_g_declaraciones          a',
'                                                join    gi_d_dclrcnes_vgncias_frmlr b   on  b.id_dclrcion_vgncia_frmlrio    =   a.id_dclrcion_vgncia_frmlrio',
'                                                join    gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcion_tpo_vgncia        =   b.id_dclrcion_tpo_vgncia',
'                                                join    gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo                 =   c.id_dclrcn_tpo',
'                                                where   a.id_dclrcion           =   :P550_ID_DCLRCION',
'                                                and     a.vlor_pago             =   0',
'                                                and     d.indcdor_prsntcion_web =   ''S''    ',
'                                            );'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-credit-card-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32747246678463211)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(32746335480463202)
,p_button_name=>'BTN_PAGO_PSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pago En Linea'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P550_CDGO_DCLRCION_ESTDO = ''AUT''  and exists  (',
'                                                select  1',
'                                                from    gi_g_declaraciones          a',
'                                                join    gi_d_dclrcnes_vgncias_frmlr b   on  b.id_dclrcion_vgncia_frmlrio    =   a.id_dclrcion_vgncia_frmlrio',
'                                                join    gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcion_tpo_vgncia        =   b.id_dclrcion_tpo_vgncia',
'                                                join    gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo                 =   c.id_dclrcn_tpo',
'                                                where   a.id_dclrcion           =   :P550_ID_DCLRCION',
'                                                and     a.vlor_pago             >   0',
'                                                and     d.indcdor_prsntcion_web =   ''S''    ',
'                                            )',
' and pkg_gn_generalidades.fnc_vl_pago_pse(:F_CDGO_CLNTE,:P550_ID_IMPSTO,:P550_ID_IMPSTO_SBMPSTO)  = ''S''',
' ',
' and not exists (select 1 from re_g_pagadores_documento e ',
'                where e.id_orgen = :P550_ID_DCLRCION ',
'                and e.indcdor_estdo_trnsccion in (''IN'',''PE'',''AP'')--IN: Iniciada, PE: Pendiente, AP: Aprobada',
'               )',
' and :P550_FCHA_LMTE_PRSNTCION is not null'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-credit-card'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32747504770463214)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(32746335480463202)
,p_button_name=>'BTN_RGRSAR_INCIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar al Inicio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32747674529463215)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(32746335480463202)
,p_button_name=>'BTN_ADJNTAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Adjuntar Archivos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:P25_ID_DCLRCION:&P550_ID_DCLRCION.'
,p_button_condition=>'( :P550_INDCDOR_ADJNTOS = ''S'' and :P550_CDGO_DCLRCION_ESTDO in (''REG'', ''AUT'', ''RLA''))'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-arrow-up'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(32747878406463217)
,p_branch_name=>'ir a la pagina 23'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP:P23_CDGO_ORGN_TPO,P23_ID_IMPSTO,P23_ID_SJTO_IMPSTO,P23_ID_ORGEN,P23_ID_IMPSTO_SBMPSTO:DL,&P550_ID_IMPSTO.,&P550_ID_SJTO_IMPSTO.,&P550_ID_DCLRCION.,&P550_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(32747246678463211)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7026451335446044)
,p_name=>'P550_FCHA_LMTE_PRSNTCION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select d.vlor_dsplay',
'       from gi_d_hmlgcnes_prpdad a',
'       inner join gi_d_homologaciones b on b.id_hmlgcion = a.id_hmlgcion',
'       inner join gi_d_hmlgcnes_prpddes_items c on c.id_hmlgcion_prpdad = a.id_hmlgcion_prpdad and c.id_frmlrio in ( select a.id_frmlrio',
'                                                                                                                     from gi_d_dclrcnes_vgncias_frmlr a',
'                                                                                                                     where exists(select 1',
'                                                                                                                                  from gi_g_declaraciones b',
'                                                                                                                                  where b.id_dclrcion = :P550_ID_DCLRCION',
'                                                                                                                                  and b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio))',
'        inner join gi_g_declaraciones_detalle d on c.id_frmlrio_rgion_atrbto = d.ID_FRMLRIO_RGION_ATRBTO and c.fla = d.fla',
'        where b.cdgo_hmlgcion = ''PRD''',
'        and a.cdgo_prpdad = ''FPY''',
'        and d.id_dclrcion = :P550_ID_DCLRCION',
'        and to_date(d.vlor_dsplay,''DD/MM/YY'') >= to_Date(sysdate,''DD/MM/YY'');'))
,p_item_default_type=>'SQL_QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32738358822368824)
,p_name=>'P550_CONSULTA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32738635018368828)
,p_name=>'P550_VALOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32739026210368828)
,p_name=>'P550_NOMBRE_TABLA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32739410816368828)
,p_name=>'P550_COLUMNA_FILENAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32739800033368829)
,p_name=>'P550_COLUMNA_BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32740205477368829)
,p_name=>'P550_COLUMNA_MIME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32740696808368835)
,p_name=>'P550_COLUMNA_CLAVE_PRIMARIA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32741028956368835)
,p_name=>'P550_COLUMNA_CLAVE_SECUNDARIA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32741418487368836)
,p_name=>'P550_VALOR_SECUNDARIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32747050957463209)
,p_name=>'P550_ID_DCLRCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32747115735463210)
,p_name=>'P550_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32747757710463216)
,p_name=>'P550_INDCDOR_ADJNTOS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32747915855463218)
,p_name=>'P550_ID_IMPSTO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32748097739463219)
,p_name=>'P550_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32748108190463220)
,p_name=>'P550_ID_SJTO_IMPSTO'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(192686972537774720)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(32741976024368840)
,p_computation_sequence=>10
,p_computation_item=>'P550_CONSULTA'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_sql varchar2(3000);',
'begin',
'    /*Consulta Base*/',
'    v_sql :=',
'        ''select ''||:P550_COLUMNA_FILENAME||'',''',
'                 ||:P550_COLUMNA_BLOB||'',''',
'                 ||:P550_COLUMNA_MIME||',
'        '' from ''||:P550_NOMBRE_TABLA||',
'        '' where ''||:P550_COLUMNA_CLAVE_PRIMARIA||''=''||:P550_VALOR;',
'    /*Consulta con clave secundaria*/',
'    if(:P550_COLUMNA_CLAVE_SECUNDARIA is not null)then',
'        v_sql := v_sql ||'' and ''||:P550_COLUMNA_CLAVE_SECUNDARIA||''=''||:P550_VALOR_SECUNDARIO;',
'    end if;',
'        return v_sql;',
'end;'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32746638218463205)
,p_name=>unistr('Presentar Declaraci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(32746546413463204)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32746702687463206)
,p_event_id=>wwv_flow_api.id(32746638218463205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function presentarDeclaracion() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        apex.server.process("ajax_presentarDeclaracion", {',
'            pageItems: "#P550_ID_DCLRCION"',
'        }, {',
'            success: async function (data) {',
'                if (data.o_cdgo_rspsta != 0) {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);',
'                } else {',
unistr('                    sessionStorage.setItem("mensajeDeclaracionPresentada", "Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        });',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
unistr('apex.message.confirm( "Tenga en cuenta que la presentaci\00F3n y aplicaci\00F3n se har\00E1 de forma autom\00E1tica \00BFEst\00E1 seguro de presentar la declaraci\00F3n?", function( okPressed ) {'),
'    if( okPressed ) {',
'        presentarDeclaracion();',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32747300319463212)
,p_name=>'Pago en Linea'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(32747246678463211)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32747445204463213)
,p_event_id=>wwv_flow_api.id(32747300319463212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "Tenga en cuenta que ser\00E1 redireccionado a una p\00E1gina para su pago en l\00EDnea, la presentaci\00F3n y aplicaci\00F3n se har\00E1 de forma autom\00E1tica \00BFEst\00E1 seguro de presentar la declaraci\00F3n?", function(  Aceptar  ) {'),
'    if(  Aceptar  ) {',
'     apex.page.submit( "BTN_PAGO_PSE" );     ',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32748292710463221)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Datos de la Declaraci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''GET'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(:P550_ID_DCLRCION)));',
'    ',
'    ',
'    :P550_CDGO_DCLRCION_ESTDO         := v_json.get_String(''cdgo_dclrcion_estdo'');',
'   -- :P3_INDCDOR_ADJNTOS             := v_json.get_String(''indcdor_adjntos'');',
'  --  :P3_ID_DCLRCION_VGNCIA_FRMLRIO  := v_json.get_String(''id_dclrcion_vgncia_frmlrio'');',
'   -- :P3_CDGO_TPO_AUTRZCION          := v_json.get_String(''cdgo_tpo_autrzcion'');',
'   -- :P3_ID_SJTO_IMPSTO              := v_json.get_String(''id_sjto_impsto'');',
'   -- :P3_ID_IMPSTO                   := v_json.get_String(''id_impsto'');',
'   -- :P3_ID_IMPSTO_SBMPSTO           := v_json.get_String(''id_impsto_sbmpsto'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32742264857368841)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOADFILE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    file_name varchar2(2000);',
'    file_blob blob;',
'    file_mimetype varchar2(1000);',
'begin',
'    execute immediate :P550_CONSULTA into  file_name, file_blob, file_mimetype;',
'    if(file_blob is not null and file_name is not null and file_mimetype is not null)then',
'        htp.init;',
'        owa_util.mime_header(file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(file_blob);',
'        apex_application.stop_apex_engine;',
'    end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32746829473463207)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_presentarDeclaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'    v_id_usrio number := :F_ID_USRIO;',
'    v_id_usrio_use number;',
'begin',
'    ',
'    select id_usrio_rgstro',
'    into v_id_usrio',
'    from gi_g_declaraciones',
'    where id_dclrcion = :P3_ID_DCLRCION;',
'    ',
'    if :F_ID_USRIO is null then',
'        v_id_usrio_use := v_id_usrio;',
'    else',
'        v_id_usrio_use := :F_ID_USRIO;',
'    end if;',
'',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion:p_id_usrio''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''presentarDeclaracion:'' || :F_CDGO_CLNTE || '':'' || :P3_ID_DCLRCION || '':'' || v_id_usrio_use)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7026515987446045)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_consulta_fecha_limite'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_fcha_lmte_prsntacion VARCHAR2(12);',
'    v_json json_object_t;',
'    v_cdgo_dclrcion_estdo varchar2(10);',
'BEGIN',
'    BEGIN',
unistr('        -- Obtener la fecha l\00EDmite de la declaraci\00F3n'),
'        SELECT d.vlor_dsplay',
'        INTO v_fcha_lmte_prsntacion',
'        FROM gi_d_hmlgcnes_prpdad a',
'        INNER JOIN gi_d_homologaciones b ON b.id_hmlgcion = a.id_hmlgcion',
'        INNER JOIN gi_d_hmlgcnes_prpddes_items c ON c.id_hmlgcion_prpdad = a.id_hmlgcion_prpdad',
'             AND c.id_frmlrio IN (SELECT a.id_frmlrio',
'                                  FROM gi_d_dclrcnes_vgncias_frmlr a',
'                                  WHERE EXISTS (SELECT 1',
'                                                FROM gi_g_declaraciones b',
'                                                WHERE b.id_dclrcion = :P3_ID_DCLRCION',
'                                                  AND b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio))',
'        INNER JOIN gi_g_declaraciones_detalle d ON c.id_frmlrio_rgion_atrbto = d.id_frmlrio_rgion_atrbto',
'             AND c.fla = d.fla',
'        WHERE b.cdgo_hmlgcion = ''PRD''',
'          AND a.cdgo_prpdad = ''FPY''',
'          AND d.id_dclrcion = :P3_ID_DCLRCION',
'          AND TO_DATE(d.vlor_dsplay, ''DD/MM/YY'') >= TO_DATE(SYSDATE, ''DD/MM/YY''); ',
'    EXCEPTION            ',
'        WHEN OTHERS THEN',
'            v_fcha_lmte_prsntacion := null;',
'    END;',
'    ',
'    begin',
'        select g.cdgo_dclrcion_estdo ',
'        into v_cdgo_dclrcion_estdo',
'        from  gi_g_declaraciones g ',
'        where g.id_dclrcion = :P3_ID_DCLRCION',
'        and g.cdgo_dclrcion_estdo = ''APL'';',
'    exception',
'        when others then',
'            v_cdgo_dclrcion_estdo :=  ''N'';',
'    end;',
'    ',
unistr('    -- Verificar si se obtuvo la fecha l\00EDmite'),
'    IF v_fcha_lmte_prsntacion IS NOT NULL or v_cdgo_dclrcion_estdo = ''APL'' THEN',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''OK'');',
'        apex_json.write(''fecha_limite'', v_fcha_lmte_prsntacion);',
'        apex_json.close_object;',
'        RETURN;',
'        ',
'    ELSE',
'        apex_json.open_object;',
'        apex_json.write(''type'', ''ERROR'');',
unistr('        apex_json.write(''msg'', ''No se encontr\00F3 fecha l\00EDmite.'');'),
'        apex_json.close_object;',
'        RETURN;',
'    END IF;',
'   /* ',
'    apex_json.open_object;',
'            apex_json.write(''type'', ''ERROR'');',
unistr('            apex_json.write(''msg'', ''Hubo un error al consultar la fecha l\00EDmite.'');'),
'            apex_json.close_object;',
'            RETURN;*/',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
