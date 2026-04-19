prompt --application/pages/page_00038
begin
wwv_flow_api.create_page(
 p_id=>38
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Condiciones Acci\00F3n')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Condiciones Acci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Declaraciones/funciones.js?version=4'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*==========Drag and Drop================*/',
'function allowDrop(ev) {',
'    ev.preventDefault();',
'}',
'',
'function drag(ev) {',
'    console.log(12);',
'    ev.dataTransfer.setData("text", ([''F'',''S''].includes(document.getElementById(''P38_TPO_VLOR'').value) ? '':'' : '''') + ev.target.attributes.dataValor.textContent);',
'}',
'',
'function drop(ev) {',
'    ev.preventDefault();',
'}',
'',
'function dropItem(ev) {',
'    ev.preventDefault();',
'    var v_text = ev.dataTransfer.getData("text").replace(":", "")',
'    ev.target.value = v_text;',
'    /*if(fnc_vldarExprsion(v_text)){',
'        ev.target.value = v_text;',
'    }',
'    else{',
'        ev.target.value = "";',
'    }*/',
'}',
'',
'function handleDragStart(e) {',
'    this.style.opacity = ''0.4'';  // this / e.target is the source node.',
'}',
'',
'function handleDragEnd(e) {',
'    this.style.opacity = ''1'';  // this / e.target is the source node.',
'}',
'',
'function fnc_agrgarAtributos(){',
'    let b = document.getElementById("P38_VLOR");',
'    b.setAttribute("ondrop", "drop(event)");',
'    b.setAttribute("ondragover", "allowDrop(event)");',
'};',
'',
'function fnc_quitarAtributos(){',
'    let b = document.getElementById("P38_VLOR");',
'    b.removeAttribute("ondrop");',
'    b.removeAttribute("ondragover");',
'};',
'',
unistr('/*==========Funci\00F3n================*/'),
'function render_function(){',
'    let v_fncion = $(''#P38_FUNCION'').val();',
'    $(''#P38_VLOR'').val(v_fncion);',
'}',
'',
'',
'/*=======Funcion que valida calculo=======*/',
'function fnc_vldarClclo(){',
'    if ($v(''P38_TPO_VLOR'') == ''C''){',
'        if(!fnc_vldarExprsion($v(''P38_VLOR''))){',
'            apex.message.clearErrors();',
'            apex.message.showErrors ([',
'                {',
'                    type:       "error",',
'                    location:   "inline",',
'                    pageItem:   "P38_VLOR",',
unistr('                    message:    ''Se encontr\00F3 un error en la formula especificada.'','),
'                    unsafe:     false',
'                }',
'            ]);',
'        }else{',
'            apex.message.clearErrors();',
'        };',
'    }else{',
'        apex.message.clearErrors();',
'    }',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var acc = document.getElementsByClassName("accordion");',
'',
'for (let item of acc) {',
'    item.addEventListener("click", function() {',
'        this.classList.toggle("active");',
'        var panel = this.nextElementSibling;',
'        if (panel.style.maxHeight) {',
'            panel.style.maxHeight = null;',
'        } else {',
'            let b = this.parentElement.parentElement.parentElement;',
'            if (b.className == "panel") {',
'                let v_height = this.parentElement.parentElement.parentElement.clientHeight;',
'                this.parentElement.parentElement.parentElement.style.maxHeight = v_height + panel.scrollHeight + "px";',
'            }',
'            panel.style.maxHeight = panel.scrollHeight + "px";',
'        }',
'    });',
'};',
'',
'$(''.column'').hover(function() {',
'    var content = `<div>${$(this).data(''tooltip'')} </div>`;',
'    $(this).tooltipster({',
'        contentAsHTML: true,',
'        interactive: true,',
'        theme: ''tooltipster-shadow'', //''tooltipster-light'',',
'        animation: ''fade'',',
'        delay: [100, 1000]',
'    }).tooltipster(''content'', content).tooltipster(''open'');',
'}, function() {',
'    $(this).tooltipster(''close'');',
'});',
'',
'let b = document.getElementById("P38_VLOR");',
'b.setAttribute("oninput", "fnc_vldarClclo()");',
'',
'b = document.getElementById("P38_ITEM_AFCTDO");',
'b.setAttribute("ondrop", "dropItem(event)");',
'b.setAttribute("ondragover", "allowDrop(event)");',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-noir.min.css',
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#rgnesList{',
'    cursor: pointer;',
'}',
'',
'.accordion {',
'    background-color: #eee;',
'    color: #444;',
'    padding: 5px;',
'    width: 100%;',
'    border: 1px solid #eee;',
'    text-align: left;',
'    border-radius: 5px;',
'    outline: none;',
'    font-size: 12px;',
'    transition: 0.3s;',
'    margin-bottom: 4px;',
'}',
'',
'.active, .accordion:hover {',
'    background-color: #ccc;',
'}',
'',
'/*.accordion:after {',
'    content: ''\002B'';',
'    color: #777;',
'    font-weight: bold;',
'    float: right;',
'    margin-right: 4px;',
'}*/',
'',
'/*.active:after {',
'    content: "\2212";',
'}*/',
'',
'.panel {',
'    padding: 0 8px;',
'    background-color: white;',
'    max-height: 0;',
'    overflow: hidden;',
'    transition: max-height 0.6s ease-out;',
'}',
'',
'#atrbtosList, #vlresList {',
'    list-style-type: none;',
'    margin: 0 !important;',
'    padding: 0;',
'}',
'',
'#vlresList li {',
'    background: #c4ced724;',
'    border: 1px solid #c4ced724;',
'    border-radius: 5px;',
'    margin-bottom: 5px;',
'    height: 25px;',
'    line-height: 25px;',
'}',
'',
'#vlresList li:nth-child(2n) {',
'    background: #c4ced7c9;',
'    border: 1px solid #c4ced7c9;',
'}',
'',
'#atrbtosList li, #vlresList li {',
'    cursor: move !important;',
'}',
'',
'#vlresList li:hover {',
'    background: #FFFDE3;',
'    border-left: 5px solid #DCDAC1;',
'    margin-left: -5px; ',
'}',
'',
'.column {',
'    padding: 0 20px;',
'    white-space: nowrap;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'',
'.column.over {',
'  border: 2px dashed #000;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'75%'
,p_dialog_chained=>'N'
,p_last_updated_by=>'JDIAZ'
,p_last_upd_yyyymmddhh24miss=>'20200318112408'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11669547764933128)
,p_plug_name=>unistr('Condiciones Acci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11667680783933109)
,p_plug_name=>unistr('Valores Condiciones Acci\00F3n')
,p_parent_plug_id=>wwv_flow_api.id(11669547764933128)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11668725564933120)
,p_plug_name=>'Columnas Items'
,p_parent_plug_id=>wwv_flow_api.id(11669547764933128)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'begin',
'    htp.p(''<div class="columns"> <ul>'');',
'    ',
'    --Generales',
'    htp.p(',
'        ''<div class = "accordion">'' || ',
'            ''<div id="rgnesList">GENERALES</div>'' ||',
'        ''</div>''',
'    );',
'                        ',
'    htp.p(',
'        ''<div class="panel">'' ||',
'        ''<ul id="vlresList">''',
'    );',
'                                    ',
'    --ID_DCLRCION_VGNCIA_FRMLRIO',
'    htp.p(',
'        ''<li>'' || ',
'            ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="ID_DCLRCION_VGNCIA_FRMLRIO" dataValor="ID_DCLRCION_VGNCIA_FRMLRIO">ID_DCLRCION_VGNCIA_FRMLRIO</div>'' ||',
'        ''</li>''',
'    );',
'    --F_CDGO_CLNTE',
'    htp.p(',
'        ''<li>'' || ',
'            ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="F_CDGO_CLNTE" dataValor="F_CDGO_CLNTE">F_CDGO_CLNTE</div>'' ||',
'        ''</li>''',
'    );',
'    ',
'    --IDNTFCCION',
'    htp.p(',
'        ''<li>'' || ',
'            ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="IDNTFCCION" dataValor="IDNTFCCION">IDNTFCCION</div>'' ||',
'        ''</li>''',
'    );',
'    ',
'    --ID_SJTO_IMPSTO',
'    htp.p(',
'        ''<li>'' || ',
'            ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="ID_SJTO_IMPSTO" dataValor="ID_SJTO_IMPSTO">ID_SJTO_IMPSTO</div>'' ||',
'        ''</li>''||',
'        ''</ul></div>''',
'    );',
'    ',
'    for c_rgnes in (select  a.id_frmlrio_rgion,',
'                            a.dscrpcion',
'                    from    gi_d_formularios_region a',
'                    where   a.id_frmlrio    =   :P38_ID_FRMLRIO',
'                    and     a.actvo         =   ''S''',
'                    order by    a.orden)',
'    loop',
'        htp.p(',
'            ''<div class = "accordion">''||',
'                ''<div id="rgnesList" draggable="true" ondragstart="drag(event)" dataValor="RGN''||c_rgnes.id_frmlrio_rgion|| ''">''|| c_rgnes.dscrpcion || ''</div>'' ||',
'            ''</div>''||',
'            ''<div class="panel"> <ul id="atrbtosList">''',
'        );',
'        --Atributos',
'        for c_atrbtos in (select  a.id_frmlrio_rgion_atrbto,',
'                                  a.nmbre_dsplay',
'                          from    gi_d_frmlrios_rgion_atrbto  a',
'                          where   a.id_frmlrio_rgion        =   c_rgnes.id_frmlrio_rgion',
'                          and     a.actvo                   =   ''S''',
'                          order by    a.orden)',
'        loop',
'            htp.p(',
'                ''<li>'' ||',
'                    ''<div class = "accordion">'' || ',
'                        ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''" dataValor="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || '
||'c_atrbtos.id_frmlrio_rgion_atrbto || ''">'' || ',
'                            c_atrbtos.nmbre_dsplay || ',
'                        ''</div>'' ||',
'                    ''</div>'' ||',
'                ''<div class="panel"><ul id="vlresList">''',
'            );',
'            ',
'            --Valores',
'            for c_vlres in (select  a.id_frmlrios_rgn_atrbt_vlr,',
'                                    a.fla',
'                            from    gi_d_frmlrios_rgn_atrbt_vlr a',
'                            where   a.id_frmlrio_rgion_atrbto   =   c_atrbtos.id_frmlrio_rgion_atrbto',
'                            order by    a.fla)',
'            loop',
'                htp.p(',
'                    ''<li>'' || ',
'                        ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="RGN'' || :P38_ID_FRMLRIO_RGION || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''FLA'' || c_vlres.fla || ''" dataVal'
||'or="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''FLA'' || c_vlres.fla || ''">Fila '' || c_vlres.fla || ''</div>'' ||',
'                    ''</li>''',
'                );',
'            end loop;',
'            ',
'            htp.p(',
'                ''<li>'' || ',
'                    ''<div class="column h-card" draggable="true" ondragstart="drag(event)" data-tooltip="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || c_atrbtos.id_frmlrio_rgion_atrbto || ''FLAX" dataValor="RGN'' || c_rgnes.id_frmlrio_rgion || ''ATR'' || '
||'c_atrbtos.id_frmlrio_rgion_atrbto || ''FLAX">''||',
'                        ''Fila X''||',
'                    ''</div>'' ||',
'                ''</li>''',
'            );',
'            ',
'            htp.p(',
'                ''</ul></div>'' ||',
'                ''</li>''',
'            );',
'        end loop;',
'        ',
'        htp.p(''</ul></div>'');',
'        ',
'    end loop;',
'    ',
'    htp.p(''</ul></div>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11669987677933132)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(11669547764933128)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11669696543933129)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(11669547764933128)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insertar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P38_ID_FRMLRIO_CNDCION_ACCION'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11669771266933130)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(11669547764933128)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Aplicar Cambios'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P38_ID_FRMLRIO_CNDCION_ACCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(11669854974933131)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(11669547764933128)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Eliminar'
,p_button_position=>'REGION_TEMPLATE_DELETE'
,p_button_condition=>'P38_ID_FRMLRIO_CNDCION_ACCION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11667739033933110)
,p_name=>'P38_ID_FRMLRIO_CNDCION_ACCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(11669547764933128)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_FRMLRIO_CNDCION_ACCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11667837081933111)
,p_name=>'P38_ID_FRMLRIO_CNDCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(11669547764933128)
,p_use_cache_before_default=>'NO'
,p_source=>'ID_FRMLRIO_CNDCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11667902853933112)
,p_name=>'P38_ACCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(11667680783933109)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo de Acci\00F3n')
,p_source=>'ACCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Mostrar;M,Ocultar;O,Setear;S,Fecha M\00E1xima;F')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11668004180933113)
,p_name=>'P38_VLOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(11667680783933109)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valor'
,p_source=>'VLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11668112090933114)
,p_name=>'P38_ITEM_AFCTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(11667680783933109)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('\00CDtem Afectado')
,p_source=>'ITEM_AFCTDO'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(164103465114707755)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11669283248933125)
,p_name=>'P38_ID_FRMLRIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(11669547764933128)
,p_prompt=>'Formulario'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio',
'from    gi_d_formularios    a',
'where   a.id_frmlrio    =   :P38_ID_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11670277093933135)
,p_name=>'P38_TPO_VLOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(11667680783933109)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tipo Valor'
,p_source=>'TPO_VLOR'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC:Est\00E1tico;E,SQL;S,Calculo;C,Funci\00F3n;F')
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11670369411933136)
,p_name=>'P38_FUNCION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(11667680783933109)
,p_prompt=>unistr('Funci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  object_name || '' version '' || overload d,',
'        ''PKG_GI_DECLARACIONES_FUNCIONES.'' ||object_name || ''('' || listagg(argument_name || '' => $'' || position ,'' ,'') within group (order by position) || '')'' b',
'from    user_arguments',
'where   package_name = ''PKG_GI_DECLARACIONES_FUNCIONES''',
'and     argument_name is not null',
'group by object_name,',
'         overload;'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'80%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11670760068933140)
,p_name=>'P38_OPERACION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(11667680783933109)
,p_prompt=>unistr('Operaci\00F3n Agrupada')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LV_OPERACIONES_AGRUPADAS'
,p_lov=>'.'||wwv_flow_api.id(12777803354581544)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11890835445169132)
,p_name=>'P38_TPO_ACCION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(11669547764933128)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Tipo Acci\00F3n')
,p_source=>'TPO_ACCION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Verdadero;V,Falso;F'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13521110959694022)
,p_name=>'P38_ID_FRMLRIO_RGION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(11669547764933128)
,p_prompt=>unistr('Regi\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion,',
'        a.id_frmlrio_rgion',
'from    gi_d_formularios_region a',
'where   a.id_frmlrio_rgion  =   :P38_ID_FRMLRIO_RGION;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(164103298426707753)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(11890798757169131)
,p_validation_name=>'validar_SQLfuncion'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_sql    clob;',
'begin',
'    if :P38_TPO_VLOR = ''S'' then',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for '' || :P38_VLOR;',
'        execute immediate v_sql ;',
'    elsif  :P38_TPO_VLOR = ''F'' then  ',
'        v_sql := ''explain plan set statement_id = ''''VALIDSQL'''' for select '' || :P38_VLOR || '' from dual'';',
'        execute immediate v_sql ;',
'    end if;',
'exception when others then',
'    return regexp_replace(sqlerrm,''(ORA|PLS)-[0-9]{0,5}: '','''');   ',
'end;'))
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'P38_TPO_VLOR'
,p_validation_condition2=>'S:F'
,p_validation_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11668251573933115)
,p_name=>'P38_TPO_VLOR = C'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_TPO_VLOR'
,p_condition_element=>'P38_TPO_VLOR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'C'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11670912716933142)
,p_event_id=>wwv_flow_api.id(11668251573933115)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_OPERACION,P38_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11671293306933145)
,p_event_id=>wwv_flow_api.id(11668251573933115)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_agrgarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11671007561933143)
,p_event_id=>wwv_flow_api.id(11668251573933115)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_VLOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11671323933933146)
,p_event_id=>wwv_flow_api.id(11668251573933115)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_OPERACION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11671113232933144)
,p_event_id=>wwv_flow_api.id(11668251573933115)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11670065508933133)
,p_name=>'Close Dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(11669987677933132)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11670101341933134)
,p_event_id=>wwv_flow_api.id(11670065508933133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11671452984933147)
,p_name=>'P38_TPO_VLOR = E'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_TPO_VLOR'
,p_condition_element=>'P38_TPO_VLOR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'E'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11671565764933148)
,p_event_id=>wwv_flow_api.id(11671452984933147)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11671670781933149)
,p_event_id=>wwv_flow_api.id(11671452984933147)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_VLOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11671768159933150)
,p_event_id=>wwv_flow_api.id(11671452984933147)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_agrgarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11887748401169101)
,p_name=>'P38_TPO_VLOR = F'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_TPO_VLOR'
,p_condition_element=>'P38_TPO_VLOR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11887801485169102)
,p_event_id=>wwv_flow_api.id(11887748401169101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_FUNCION,P38_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11888122133169105)
,p_event_id=>wwv_flow_api.id(11887748401169101)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_FUNCION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11887931593169103)
,p_event_id=>wwv_flow_api.id(11887748401169101)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_FUNCION,P38_VLOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11888036978169104)
,p_event_id=>wwv_flow_api.id(11887748401169101)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11888213133169106)
,p_name=>'P38_TPO_VLOR = S'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_TPO_VLOR'
,p_condition_element=>'P38_TPO_VLOR'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'S'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11888372987169107)
,p_event_id=>wwv_flow_api.id(11888213133169106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11888416293169108)
,p_event_id=>wwv_flow_api.id(11888213133169106)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_VLOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11888502780169109)
,p_event_id=>wwv_flow_api.id(11888213133169106)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'fnc_quitarAtributos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11888639907169110)
,p_name=>'P38_TPO_VLOR = null'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_TPO_VLOR'
,p_condition_element=>'P38_TPO_VLOR'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11888738216169111)
,p_event_id=>wwv_flow_api.id(11888639907169110)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_VLOR'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11888887751169112)
,p_event_id=>wwv_flow_api.id(11888639907169110)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11888953641169113)
,p_name=>'P38_ACCION = S'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_ACCION'
,p_condition_element=>'P38_ACCION'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'S,F'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11889082972169114)
,p_event_id=>wwv_flow_api.id(11888953641169113)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_TPO_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11890475424169128)
,p_event_id=>wwv_flow_api.id(11888953641169113)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_TPO_VLOR,P38_ITEM_AFCTDO'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11889349564169117)
,p_event_id=>wwv_flow_api.id(11888953641169113)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P38_TPO_VLOR'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11889434360169118)
,p_name=>'P38_OPERACION seleccionar'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_OPERACION'
,p_condition_element=>'P38_OPERACION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11889581855169119)
,p_event_id=>wwv_flow_api.id(11889434360169118)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'try{',
'    let v_areaText1 = document.getElementById("P38_VLOR");',
'    let v_start1 = v_areaText1.value.substring(0, v_areaText1.selectionStart);',
'    var v_end1 = v_areaText1.value.substring(v_areaText1.selectionEnd);',
'    v_areaText1.value = v_start1 + document.getElementById("P38_OPERACION").value + v_end1;',
'    fnc_vldarClclo();',
'}finally{',
'    console.log("prueba");',
'    document.getElementById("P38_OPERACION").value = "";',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11889638971169120)
,p_name=>'P38_FUNCION Seleccionar'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P38_FUNCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11889702535169121)
,p_event_id=>wwv_flow_api.id(11889638971169120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'render_function()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11889869391169122)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'rcprarFla gi_d_frmlrios_cndcion_accn'
,p_attribute_02=>'GI_D_FRMLRIOS_CNDCION_ACCN'
,p_attribute_03=>'P38_ID_FRMLRIO_CNDCION_ACCION'
,p_attribute_04=>'ID_FRMLRIO_CNDCION_ACCION'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P38_ID_FRMLRIO_CNDCION_ACCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11889923380169123)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'gstnar gi_d_frmlrios_cndcion_accn'
,p_attribute_02=>'GI_D_FRMLRIOS_CNDCION_ACCN'
,p_attribute_03=>'P38_ID_FRMLRIO_CNDCION_ACCION'
,p_attribute_04=>'ID_FRMLRIO_CNDCION_ACCION'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>unistr('Acci\00F3n procesada con \00E9xito.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11890551332169129)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Cerrar cuadro de dialogo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
end;
/
